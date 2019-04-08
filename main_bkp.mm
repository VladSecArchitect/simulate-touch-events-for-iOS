/*
Creted By Vladislav Chelnokov
vlad@redhot.ru
*/
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <AudioToolbox/AudioServices.h>

#include <stdio.h>

#import <syslog.h>
#import <xpc/xpc.h> // Create a symlink to OSX's SDK. For example, in Terminal run: ln -s /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.8.sdk/usr/include/xpc /opt/iOSOpenDev/include/xpc

#import <assert.h>

#import <dlfcn.h>

#include <asl.h>

#import <objc/runtime.h>

#import <mach/mach.h>
#import <mach/task.h>
#import <mach/port.h>
#import <mach/mach_time.h>

#import <mach-o/dyld.h>
#import <mach-o/dyld_images.h>



#include <chrono>
#include <thread>
#include <iostream>
#include <vector>
#include <iterator>

#import "IOKit/IOKitLib.h"
#import "IOKit/hid/IOHIDEvent.h"
#import <IOKit/hid/IOHIDEventSystem.h>

#import <IOKit/hid/IOHIDEventSystemClient.h>
// #import <IOKit/hidsystem/IOHIDUsageTables.h>

#import "private-headers/IOKit/hid/IOHIDEvent7.h"
#import "private-headers/IOKit/hid/IOHIDEventTypes7.h"
#import "private-headers/IOKit/hid/IOHIDEventSystemConnection.h"

#import "main.h"
#import "iokit_trace.h"

#import "ioreg_tools.h"
/*
IOHIDEventSystemClientDispatchEvent
BKSHIDEventRegisterEventCallback
*/


extern "C" {
    IOHIDEventSystemClientRef IOHIDEventSystemClientCreate(CFAllocatorRef allocator);
    IOHIDEventSystemClientRef IOHIDEventSystemClientCreateWithType(CFAllocatorRef allocator, int v1, int v2);
    void IOHIDEventSystemClientDispatchEvent(IOHIDEventSystemClientRef client, IOHIDEventRef event);
    void IOHIDEventSystemClientScheduleWithRunLoop(IOHIDEventSystemClientRef v1, __CFRunLoop * v2, const CFRunLoopMode v3);

    // void IOHIDEventAppendEvent(IOHIDEventRef event, IOHIDEventRef childEvent);
}

enum {
    kIOHIDEventOptionNone = 0,
};

BOOL keepRunning = TRUE;
unsigned long long senderId;

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
#pragma clang diagnostic ignored "-pedantic"    //Disable pedantic


static void CrashHandlerExceptionHandler(NSException *exception) {
    NSLog(@"%@", [exception callStackSymbols]);
}

static void signalHandler(int signo)
{
    syslog(LOG_NOTICE, "Received signal %d. Cleaning up...", signo);
    NSLog(@"signalHandler: Received signal %d", signo);

    switch (signo) {
    case SIGTERM:
        keepRunning = FALSE;
        NSLog(@"exit SIGTERM");
        break; // SIGTERM means we must quit
    case SIGINT:
        // printStatistics();
        NSLog(@"exit SIGINT");
        exit(SIGINT);
        break;
    case SIGCHLD:
        pid_t   pid;
        int     stat;
        NSLog(@"exit SIGCHLD");
        while ((pid = waitpid(-1, &stat, WNOHANG)) > 0) {
            NSLog(@"child %d terminated", pid);
        }
        break;

    default:
        break;
    }

    exit(signo);
}

static void xpc_connection_handler(xpc_connection_t peer)
{
    // By defaults, new connections will target the default dispatch concurrent queue.
    xpc_connection_set_event_handler(peer, ^(xpc_object_t xdict) {
        if (xdict == XPC_ERROR_CONNECTION_INVALID) {
            // The client process on the other end of the connection has either
            // crashed or cancelled the connection. After receiving this error,
            // the connection is in an invalid state, and you do not need to
            // call xpc_connection_cancel(). Just tear down any associated state
            // here.

            printf("Connection closed by remote end\n");
            return;
        }

        if (xdict == XPC_ERROR_TERMINATION_IMMINENT) {
            // Handle per-connection termination cleanup.
        }

        if (xpc_get_type(xdict) != XPC_TYPE_DICTIONARY) {
            printf("Received something else than a dictionary!\n");
            return;
        }

        NSLog(@"XPC connection received object: %s", xpc_copy_description(xdict));

        xpc_object_t xarray = xpc_dictionary_get_value(xdict, "coord");
        if (xpc_get_type(xarray) != XPC_TYPE_ARRAY) {
            printf("Received something else than an array!\n");
            return;
        }

        const char *coords_string = xpc_array_get_string(xarray, 0);
        // char * pch = strtok(coords_string, " "); // Splits spaces between words in str
        // while (pch != NULL)
        // {};

        // NSString *str = @(coords_string);
        NSString *str = [NSString stringWithUTF8String:coords_string];
        NSLog(@"str %@", str);

        NSArray * arr = [str componentsSeparatedByString:@" "];
        NSLog(@"new_stack arr: %@", arr);

        int x = [[arr objectAtIndex:0] intValue]; // integerValue ??
        int y = [[arr objectAtIndex:1] intValue];

        CGPoint point = CGPointMake(x, y);
        simulate_touch_event(0, point, 1);
        simulate_touch_event(0, point, 2);




        // xpc_array_apply(stack, ^ (size_t idx, xpc_object_t value) {
        //     if (idx >= xpc_array_get_count(stack) - 2) {
        //         return (bool)false;
        //     }
        //     xpc_array_append_value(new_stack, value);
        //     return (bool)true;
        // });

        xpc_object_t reply = xpc_dictionary_create_reply(xdict);
        // xpc_object_t reply = xpc_dictionary_create(NULL, NULL, 0);

        if (reply) {
            xpc_dictionary_set_string(reply, "message", "Pong");
            char *description = xpc_copy_description(reply);
            NSLog(@"XPC connection sending reply: %s", description);
            free(description);
            xpc_connection_send_message(xpc_dictionary_get_remote_connection(xdict), reply);
            // xpc_connection_send_message(peer, resp); // ???

        }
    });


    // This will tell the connection to begin listening for events. If you
    // have some other initialization that must be done asynchronously, then
    // you can defer this call until after that initialization is done.
    // xpc_connection_resume(peer);
}

// taskNamePortOfContextId
static void simulate_touch_event(int index, CGPoint point, int type) {
    static IOHIDEventSystemClientRef client = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 0, 0);
    IOHIDEventSystemClientScheduleWithRunLoop(client, CFRunLoopGetCurrent(), kCFRunLoopDefaultMode);

    uint64_t abTime = mach_absolute_time();
    AbsoluteTime timeStamp = *(AbsoluteTime *) &abTime;

    IOHIDEventRef digitizerEvent = IOHIDEventCreateDigitizerEvent(kCFAllocatorDefault, timeStamp,
                                   kIOHIDTransducerTypeHand,               // transducerType
                                   0,                                      // index
                                   1,                                      // identifier
                                   0,                                      // event mask
                                   0,                                      // button event
                                   0,                                      // x
                                   0,                                      // y
                                   0,                                      // z
                                   0,                                      // presure
                                   0,                                      // twist
                                   0,                                      // range
                                   1,                                      // touch
                                   kIOHIDEventOptionNone);

    // NSLog(@"%@", digitizerEvent);

    IOHIDEventSetIntegerValueWithOptions(digitizerEvent, kIOHIDEventFieldDigitizerDisplayIntegrated, 1, -268435456);
    IOHIDEventSetIntegerValueWithOptions(digitizerEvent, kIOHIDEventFieldBuiltIn, 1, -268435456);
    IOHIDEventSetSenderID(digitizerEvent, senderId);


    int eventM = (type == 0) ? kIOHIDDigitizerEventPosition : (kIOHIDDigitizerEventRange | kIOHIDDigitizerEventTouch); //Originally, 0, 1 and 2 are used too...
    int touch_ = (type == 2) ? 0 : 1;
    float x = point.x;
    float y = point.y;
    float rX, rY;
    float factor = 1.0f;
    float width = 375;
    float height = 667;
    rX = x / width * factor;
    rY = y / height * factor;

    IOHIDEventRef fingerEvent = IOHIDEventCreateDigitizerFingerEventWithQuality(kCFAllocatorDefault, timeStamp,
                                0,
                                2,
                                eventM,
                                rX,
                                rY,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                touch_,
                                touch_,
                                0);
    // NSLog(@"%@", fingerEvent);

    IOHIDEventSetSenderID(fingerEvent, senderId);
    IOHIDEventAppendEvent(digitizerEvent, fingerEvent);

    int handEventMask = 0;
    int handEventTouch = 0;
    handEventTouch |= touch_;
    if (type == 0) {
        handEventMask |= kIOHIDDigitizerEventPosition; //4
    } else {
        handEventMask |= (kIOHIDDigitizerEventRange | kIOHIDDigitizerEventTouch | kIOHIDDigitizerEventIdentity); //1 + 2 + 32 = 35
    }

    if (type == 2) {
        handEventMask |= kIOHIDDigitizerEventPosition;
    }

    IOHIDEventSetIntegerValueWithOptions(digitizerEvent, kIOHIDEventFieldDigitizerEventMask, handEventMask, -268435456);
    IOHIDEventSetIntegerValueWithOptions(digitizerEvent, kIOHIDEventFieldDigitizerRange, handEventTouch, -268435456);
    IOHIDEventSetIntegerValueWithOptions(digitizerEvent, kIOHIDEventFieldDigitizerTouch, handEventTouch, -268435456);

    IOHIDEventSystemClientDispatchEvent(client, digitizerEvent);

}

int main (int argc __unused, const char * argv[] __unused, char *envp[] __unused)
{
    xpc_connection_t service;

    // signal(SIGINT, signalHandler);
    signal(SIGHUP, signalHandler);

    //ignore sigterm
    // handling it via GCD dispatch
    signal(SIGTERM, SIG_IGN);

    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_SIGNAL, SIGTERM, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_event_handler(source, ^ {
        signalHandler(SIGTERM);
    });
    dispatch_resume(source);

    //init dispatch source for SIGTERM
    dispatch_source_t dispatchSource = dispatch_source_create(DISPATCH_SOURCE_TYPE_SIGNAL, SIGINT, 0, dispatch_get_main_queue());

    //set handler
    // disable kext & close logging
    dispatch_source_set_event_handler(dispatchSource, ^ {
        //dbg msg
        // logMsg(LOG_DEBUG, @"caught 'SIGINT' message....shutting down");

        //bye!
        // tell kext to disable/unregister, etc
        // goodbye();

        //bye bye!
        exit(SIGTERM);
    });
    //resume
    dispatch_resume(dispatchSource);

    signal(SIGCHLD, signalHandler);

    NSSetUncaughtExceptionHandler (&CrashHandlerExceptionHandler);

    NSLog(@"Simulate Touch! version=COMPILATION_DATE\n");
    fflush(stdout);

    service = xpc_connection_create_mach_service("ru.redhot.SimulateTouches",
              // dispatch_get_main_queue(),
              NULL,
              XPC_CONNECTION_MACH_SERVICE_LISTENER);

    if (!service) {
        NSLog(@"Failed to create XPC service.");
        exit(EXIT_FAILURE);
    }

    syslog(LOG_NOTICE, "Configuring connection event handler for SimulateTouches");
    xpc_connection_set_event_handler(service, ^(xpc_object_t object) {
        xpc_type_t type = xpc_get_type(object);

        if (type == XPC_TYPE_CONNECTION) {
            NSLog(@"XPC server received incoming connection: %s", xpc_copy_description(object));

            /**
            * This handler is simply a stub
            *
            * The connection should instead be passed to a controller object where
            * the controller can set it's own event handler and then resume the connection
            **/
            xpc_connection_handler(object);
            xpc_connection_resume(object);
        }
        else if (type == XPC_TYPE_ERROR) {
            NSLog(@"XPC server error: %s", xpc_dictionary_get_string(object, XPC_ERROR_KEY_DESCRIPTION));
        }
        else {
            NSLog(@"XPC server received unknown object: %s", xpc_copy_description(object));
        }
    });

    // Make connection live
    xpc_connection_resume(service);

    senderId = getSenderId(); // разобраться с итератором!
    // get_io_registry_root(); // разобраться с этой функцией! там надо переписать код

    // while (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0, 0) - 1 > 1);
    // while (keepRunning) {
    // CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0, false);
    // }


    NSLog(@"Emulate touch daemon exiting");

    CFRunLoopRun();

    /* not reached */
    // exit(0);
    return EXIT_SUCCESS;
}

#pragma clang diagnostic pop
