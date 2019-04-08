#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import "IOKit/IOKitLib.h"


io_service_t get_io_service(const char *name);
NSString *getSerialNumber();
CFStringRef copy_device_serial_number();
CFStringRef copy_device_imei();
int get_io_registry_root();
unsigned long long getSenderId();
