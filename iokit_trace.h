#import <IOKit/hid/IOHIDEvent.h>
#import <IOKit/hid/IOHIDEventSystem.h>
#import <IOKit/hid/IOHIDEventSystemClient.h>


#pragma mark IOKit

extern unsigned long long senderId;

typedef struct __IOHIDServiceClient * IOHIDServiceClientRef;
int IOHIDServiceClientSetProperty(IOHIDServiceClientRef, CFStringRef, CFNumberRef);
typedef void* (*clientCreatePointer)(const CFAllocatorRef);

typedef CFArrayRef (*IOHIDEventSystemCopyServices)(IOHIDEventSystemRef, void *);

//CFMutableDictionaryRef (*IOServiceMatching)(const char *name);

#pragma mark Types IOKit

struct rawTouch {
    float density;
    float radius;
    float quality;
    float x;
    float y;
} lastTouch;
