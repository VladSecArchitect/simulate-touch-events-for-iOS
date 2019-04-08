/*
Creted By Vladislav Chelnokov
vlad@redhot.ru

A good example: http://iphonedevwiki.net/index.php/Nfcd
 */

#import <Foundation/Foundation.h>
#include <xpc/xpc.h>

// typedef return_type (^blockName)(var_type);
typedef void (^TypeName)(xpc_object_t);

TypeName xpc_event_handler_block = ^void(xpc_object_t object) {
    char *description = xpc_copy_description(object);
    printf("object: %s\n", description);
    free(description);
};

static void connection_handler(xpc_connection_t peer)
{
    xpc_connection_set_event_handler(peer, ^(xpc_object_t event) {
        printf("Message received: %p\n", event);
    });

    xpc_connection_resume(peer);
}

int main(int argc, const char * argv[])
{
    printf("Simulate Touch Client! version=19.03.20 13:08:39\n");
    fflush(stdout);

    xpc_connection_t connection = xpc_connection_create_mach_service("ru.redhot.SimulateTouches", NULL, 0);
    if (connection == NULL) {
        perror("xpc_connection_create_mach_service");
        return (1);
    }

    xpc_connection_set_event_handler(connection, xpc_event_handler_block);
    xpc_connection_resume(connection);

    while (true) {
        // Send message to mach service, and wait for a response
        xpc_object_t msg = xpc_dictionary_create(NULL, NULL, 0);
        xpc_object_t new_stack = xpc_array_create(NULL, 0);

        printf("Enter x y: ");
        char str[100];
        fgets(str, 10, stdin);

        int i;
        i = strlen(str) - 1;
        if ( str[ i ] == '\n')
            str[i] = '\0';

        xpc_array_set_string(new_stack, XPC_ARRAY_APPEND, str);

        // xpc_dictionary_set_string(message, "Hello", "world!!!!!!");
        // xpc_dictionary_set_int64(message, "Controller", 6);
        // xpc_dictionary_set_value(message, "NFMsgObject", msgobject);

        xpc_dictionary_set_value(msg, "coord", new_stack);

        char *description = xpc_copy_description(msg);
        printf("====Sending object====\n");
        printf("%s\n", description);
        free(description);

        // xpc_connection_send_message_with_reply(connection,
        //                                        message,
        //                                        dispatch_get_main_queue(),
        // ^(xpc_object_t object) {

        // });

        xpc_object_t reply = xpc_connection_send_message_with_reply_sync(connection, msg);
        char *descr = xpc_copy_description(reply);
        printf("====Received message====\n");
        printf("%s\n", descr);
        free(descr);


        sleep(1);
    }

    return (EXIT_SUCCESS);
}
