#import "ioreg_tools.h"

#define INFO(msg) \
    fprintf(stderr, "info: %s:%d: ", __FILE__, __LINE__); \
    fprintf(stderr, "%s", msg);

io_service_t get_io_service(const char *name) {
    CFMutableDictionaryRef matchingClass;
    io_service_t ioService = 0;
    mach_port_t masterPort = 0;
    io_iterator_t iterator;
    kern_return_t k_result;

    k_result = IOMasterPort(MACH_PORT_NULL, &masterPort); // или kIOMasterPortDefault
    if (k_result)
    {
        printf("[-] Error: IOMasterPort failed: 0x%X\n", k_result);
        return 0;
    }

#ifdef DEBUG
    printf("[OK] IOMasterPort opened\n");
#endif

    matchingClass = IOServiceMatching(name);
    if (matchingClass == NULL) {
        printf("[-] Error call to IOServiceMatching(): unable to create matching dictionary for class '%s'\n", name);
        return 0;
    }

#ifdef DEBUG
    NSLog(@"IOServiceMatching(): serviceName = %@", matchingClass);
#endif

    ioService = IOServiceGetMatchingService(masterPort, matchingClass);
    // k_result = IOServiceGetMatchingServices(masterPort, matchingClass, &iterator);

    // if (k_result != KERN_SUCCESS) {
    //     printf("[-] Error call to IOServiceGetMatchingServices(): unable to get services");
    //     return 1;
    // }

    // while ((ioService = IOIteratorNext(iterator))) {
    //     if (IO_OBJECT_NULL != ioService) {
    //         NSLog(@": %@", ioService);
    //         break;
    //     }
    //     else
    //     {
    //         printf("[-] Error call to IOIteratorNext()\n");
    //         return 1;
    //     }
    // }

    // while (!service) {
    //     CFRetain(matching);
    //     service = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
    //     if (service) break;

    //     printf("waiting for matching IOKit service: %s\n", name);
    //     sleep(1);
    //     CFRelease(matching);
    // }

    // CFRelease(matchingClass);

    return ioService;
}

inline int __fastcall get_entry_data(io_registry_entry_t entry, CFStringRef key, CFMutableDataRef data)
{
    CFTypeRef cf_container;
    CFTypeID container_type_id;
    CFTypeID cf_string_type_id;
    CFTypeID cf_data_type_id;
    CFTypeID cf_dictionary_type_id;
    CFIndex string_length;
    size_t size_to_allocate;

#ifdef DEBUG
    INFO("call\n")
    NSLog(@"IORegistryEntryCreateCFProperty is %p", IORegistryEntryCreateCFProperty);
    NSLog(@"key: %@", key);
#endif

    cf_container = IORegistryEntryCreateCFProperty(entry, key, kCFAllocatorDefault, 0LL);
    if ( cf_container )
    {
        NSLog(@"IORegistryEntryCreateCFProperty");
        container_type_id = CFGetTypeID(cf_container);
        cf_string_type_id = CFStringGetTypeID();
        cf_data_type_id = CFDataGetTypeID();
        cf_dictionary_type_id = CFDictionaryGetTypeID();

        if (container_type_id == cf_string_type_id)
        {
            NSLog(@"IS CFStringGetTypeID!!!");
            string_length = CFStringGetLength((CFStringRef)cf_container);
            size_to_allocate = CFStringGetMaximumSizeForEncoding(string_length, kCFStringEncodingUTF8);

            char *allocated_bytes = new char[size_to_allocate];

            CFStringGetCString((CFStringRef)cf_container,
                               allocated_bytes,
                               (CFIndex)size_to_allocate,
                               kCFStringEncodingUTF8);

            CFDataAppendBytes(data,
                              (const unsigned char *)allocated_bytes,
                              string_length);
            CFRelease(cf_container);
        }

        if (container_type_id == cf_data_type_id)
        {
            NSLog(@"IS CFDataGetTypeID!!!");
            CFDataAppendBytes(data,
                              (const unsigned char *)CFDataGetBytePtr((CFDataRef)cf_container),
                              CFDataGetLength((CFDataRef)cf_container));

            CFRelease(cf_container);
        }

        if (container_type_id == cf_dictionary_type_id)
        {
            NSLog(@"IS DICTIONARY!!!");
        }
    }

#ifdef DEBUG
    INFO("call 1\n")
#endif
}

inline int get_apple_multi_touch_device_id()
{
    return 0;
}

int get_io_registry_root()
{
    CFMutableDataRef returnData;
    io_registry_entry_t ioRegistryRoot = IORegistryEntryFromPath(kIOMasterPortDefault, "IOService:/");
    get_entry_data(ioRegistryRoot, CFSTR(kOSBuildVersionKey), returnData);

    NSLog(@"get_io_registry_root: %@", returnData);
    IOObjectRelease(ioRegistryRoot);

    return 0;
}

io_connect_t openUserClient(io_service_t ioService)
{
    kern_return_t k_result;
    io_connect_t conn = MACH_PORT_NULL;

    k_result = IOServiceOpen(ioService, mach_task_self(), 0, &conn);
    if (k_result != KERN_SUCCESS) {
        printf("IOServiceOpen failed, unable to get user client connection: 0x%X\n", k_result);
        exit(5);
    }

#ifdef DEBUG
    printf("[OK] IOServiceOpen: conn = 0x%x\n", conn);
#endif

    return conn;
}

unsigned long long getSenderId()
{
#ifdef DEBUG
    INFO("call\n")
#endif


    CFMutableDictionaryRef properties;
    io_service_t ioService, ioServiceParent;
    unsigned long long registryEntryId;
    kern_return_t k_result;

#ifdef DEBUG
    INFO("call\n")
#endif

    ioService = get_io_service("AppleMultitouchDevice");
#ifdef DEBUG
    INFO("call\n")
#endif

    if (ioService == 0)
    {
        printf("get_io_service failed!\n");
        exit(2);
    }

    k_result = IORegistryEntryGetRegistryEntryID(ioService, &registryEntryId);

    if (k_result == KERN_SUCCESS) {
#ifdef DEBUG
        NSLog(@"registryEntryId!!! 0x%lx", registryEntryId);
#endif

        return registryEntryId;
    }

    k_result = IORegistryEntryCreateCFProperties(ioService,
               &properties,
               kCFAllocatorDefault,
               kNilOptions);

    if (k_result == KERN_SUCCESS) {
        NSDictionary *dict = (__bridge NSDictionary *)(properties);
        NSLog(@"properties: %@", dict);
    }

    IORegistryEntryGetParentEntry(ioService, kIOServicePlane, &ioServiceParent);
    k_result = IORegistryEntryGetRegistryEntryID(ioServiceParent, &registryEntryId);
    NSLog(@"registryEntryId!!! 0x%llx", registryEntryId);

    k_result = IORegistryEntryCreateCFProperties(ioServiceParent,
               &properties,
               kCFAllocatorDefault,
               kNilOptions);
    NSLog(@"properties: %@", properties);


    IOObjectRelease(ioService);


    return registryEntryId;
}

CFStringRef copy_device_serial_number() {
    io_service_t service;
    CFStringRef serialNumber;
    CFTypeRef platformSerialNumber;

    service = get_io_service("IOPlatformExpertDevice");
    if (!service) {
        printf("unable to find IOPlatformExpertDevice service\n");
        return NULL;
    }

    platformSerialNumber = IORegistryEntryCreateCFProperty(service, CFSTR("IOPlatformSerialNumber"), kCFAllocatorDefault, 0);
    IOObjectRelease(service);

    return serialNumber;
}


/**
 * Usage:
    NSString *serial = getSerialNumber();
    NSLog(@"Serial: %@", serial);
 */
NSString *getSerialNumber()
{
    NSString *serialNumber = nil;
    const char *dlsym_error;

    //void *IOKit = dlopen(NULL, RTLD_GLOBAL | RTLD_NOW);
    //void *IOKit = dlopen(NULL, 9);
    // void *IOKit = dlopen("/System/Library/Frameworks/IOKit.framework/IOKit", RTLD_NOW | RTLD_GLOBAL);
    // assert(IOKit);

    // if (IOKit == NULL) {
    //     printf("ERROR: Failed to get IOKit_handle:\n%s\n", dlerror());
    //     fflush(stdout);
    //     return;
    // }

    // if (IOKit != NULL)
    // {
    // mach_port_t *kIOMasterPortDefault = (mach_port_t *)dlsym(IOKit, "kIOMasterPortDefault");

    //CFMutableDictionaryRef (*IOServiceMatching)(const char *name) = dlsym(IOKit, "IOServiceMatching");
    //*(void**)(&IOServiceMatching) = reinterpret_cast<void (*)(CFMutableDictionaryRef)>(dlsym(IOKit, "IOServiceMatching"));
    //void *test = dlsym(IOKit, "IOServiceMatching");
    //NSLog(@"dfgdfgsdfgdsfg3: %p" , test);

    //&IOServiceMatching = test;


    //mach_port_t (*IOServiceGetMatchingService)(mach_port_t masterPort, CFDictionaryRef matching) = dlsym(IOKit, "IOServiceGetMatchingService");
    //*(void**)(&IOServiceGetMatchingService) = dlsym(IOKit, "IOServiceGetMatchingService");

    //CFTypeRef (*IORegistryEntryCreateCFProperty)(mach_port_t entry, CFStringRef key, CFAllocatorRef allocator, uint32_t options) = dlsym(IOKit, "IORegistryEntryCreateCFProperty");
    //*(void**)(&IORegistryEntryCreateCFProperty) = dlsym(IOKit, "IORegistryEntryCreateCFProperty");

    //kern_return_t (*IOObjectRelease)(mach_port_t object) = dlsym(IOKit, "IOObjectRelease");
    //*(void**)(&IOObjectRelease) = dlsym(IOKit, "IOObjectRelease");

    if (kIOMasterPortDefault && IOServiceGetMatchingService && IORegistryEntryCreateCFProperty && IOObjectRelease)
    {
        mach_port_t platformExpertDevice = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"));
        if (platformExpertDevice)
        {
            CFTypeRef platformSerialNumber = IORegistryEntryCreateCFProperty(platformExpertDevice, CFSTR("IOPlatformSerialNumber"), kCFAllocatorDefault, 0);
            if (CFGetTypeID(platformSerialNumber) == CFStringGetTypeID())
            {
                serialNumber = [NSString stringWithString:(__bridge NSString*)platformSerialNumber];
                CFRelease(platformSerialNumber);
            }
            IOObjectRelease(platformExpertDevice);
        }
    }
    // dlclose(IOKit);
// }

    return serialNumber;
}

/**
 * Usage:
    CFStringRef imei = copy_device_imei();
 */
CFStringRef copy_device_imei() {
    CFMutableDictionaryRef matching;
    io_service_t service;
    CFDataRef imeiData;
    const void *imeiDataPtr;
    CFStringRef imeiString;

    matching = IOServiceNameMatching("baseband");
    service = IOServiceGetMatchingService(kIOMasterPortDefault, matching);

    if (!service) {
        printf("unable to find baseband service\n");
        return NULL;
    }

    imeiData = (CFDataRef)IORegistryEntryCreateCFProperty(service, CFSTR("device-imei"), kCFAllocatorDefault, 0);
    if (!imeiData) {
        printf("unable to find device-imei property\n");
        IOObjectRelease(service);
        return NULL;
    }

    imeiDataPtr = CFDataGetBytePtr(imeiData);
    imeiString = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)imeiDataPtr, kCFStringEncodingUTF8);

    CFRelease(imeiData);
    IOObjectRelease(service);

    return imeiString;
}

CFStringRef copy_devicetree_option(CFStringRef key) {
    io_registry_entry_t entry;
    CFStringRef option;

    entry = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
    if (!entry) {
        printf("unable to get registry entry for IODeviceTree:/options\n");
        return NULL;
    }

    option = (CFStringRef)IORegistryEntryCreateCFProperty(entry, key, kCFAllocatorDefault, 0);
    IOObjectRelease(entry);

    return option;
}

CFStringRef copy_hardware_platform() {
    io_service_t service;
    CFStringRef platform;
    char *platformPtr;

    service = get_io_service("IOPlatformExpertDevice");
    if (!service) {
        printf("unable to find IOPlatformExpertDevice service\n");
        return NULL;
    }

    platform = (CFStringRef)IORegistryEntryCreateCFProperty(service, CFSTR("platform-name"), kCFAllocatorDefault, 0);
    if (platform == NULL) {
        printf("platform-name not found in device tree\n");
        IOObjectRelease(service);
        return NULL;
    }

    platformPtr = (char *)calloc(1, CFStringGetLength(platform) + 1);
    if (!CFStringGetCString(platform, platformPtr, CFStringGetLength(platform) + 1, kCFStringEncodingUTF8)) {
        printf("unable to obtain platform-name string\n");
        IOObjectRelease(service);
        return NULL;
    }

    printf("platform-name = %s\n", platformPtr);
    free(platformPtr);

    return platform;
}

CFStringRef copy_bluetooth_mac_address() {
    io_service_t service;
    CFDataRef macaddrData;
    CFStringRef macaddr;
    unsigned char macaddrBytes[6];

    service = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceNameMatching("bluetooth"));
    if (!service) {
        printf("unable to find bluetooth service\n");
        return NULL;
    }

    macaddrData = (CFDataRef)IORegistryEntryCreateCFProperty(service, CFSTR("local-mac-address"), kCFAllocatorDefault, 0);
    if (macaddrData == NULL) {
        printf("bluetooth local-mac-address not found\n");
        IOObjectRelease(service);
        return NULL;
    }
    CFDataGetBytes(macaddrData, CFRangeMake(0, 6), macaddrBytes);

    macaddr = CFStringCreateWithFormat(kCFAllocatorDefault,
                                       NULL,
                                       CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"),
                                       macaddrBytes[0],
                                       macaddrBytes[1],
                                       macaddrBytes[2],
                                       macaddrBytes[3],
                                       macaddrBytes[4],
                                       macaddrBytes[5]);

    return macaddr;
}

void search_wifi_mac_callback(void** context, io_iterator_t iterator) {
    unsigned char macaddrBytes[6];
    io_iterator_t iterator2 = 0;
    io_object_t obj2 = 0;
    io_name_t name;
    CFDataRef t1 = 0;
    io_object_t next;

    while ((next = IOIteratorNext(iterator)) != 0)
    {
        if (!IORegistryEntryCreateIterator(next, "IOService", 3, &iterator2))
        {
            while ((obj2 = IOIteratorNext(iterator2)) != 0)
            {
                if (!IORegistryEntryGetName(obj2, name))
                {
                    if (!strcmp(name, "sdio") || !strcmp(name, "wlan"))
                    {
                        if ((t1 = (CFDataRef)IORegistryEntryCreateCFProperty(obj2, CFSTR("local-mac-address"), kCFAllocatorDefault, 0)) != 0)
                        {
                            CFDataGetBytes(t1, CFRangeMake(0, 6), macaddrBytes);
                            *context = (void*) CFStringCreateWithFormat(kCFAllocatorDefault,
                                       NULL,
                                       CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"),
                                       macaddrBytes[0],
                                       macaddrBytes[1],
                                       macaddrBytes[2],
                                       macaddrBytes[3],
                                       macaddrBytes[4],
                                       macaddrBytes[5]);
                            CFRelease(t1);
                        }
                    }
                }

            }
            IOObjectRelease(iterator2);
        }
        IOObjectRelease(next);
        if (*context != NULL)
            break;
    }
}

CFStringRef lookup_mac_address(const char* serviceName)
{
    unsigned char macaddrBytes[6];
    CFStringRef res = NULL;

    io_service_t service = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceNameMatching(serviceName));

    if (service)
    {
        CFDataRef macData = (CFDataRef)IORegistryEntryCreateCFProperty(service, CFSTR("local-mac-address"), kCFAllocatorDefault, 0);
        if (macData != NULL)
        {
            CFDataGetBytes(macData, CFRangeMake(0, 6), macaddrBytes);

            res = CFStringCreateWithFormat(kCFAllocatorDefault,
                                           NULL,
                                           CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"),
                                           macaddrBytes[0],
                                           macaddrBytes[1],
                                           macaddrBytes[2],
                                           macaddrBytes[3],
                                           macaddrBytes[4],
                                           macaddrBytes[5]);
            CFRelease(macData);
        }
        IOObjectRelease(service);
    }
    return res;
}

CFStringRef copy_wifi_mac_address() {
    CFStringRef wifimac = NULL;
    IONotificationPortRef notify_port = 0;
    io_iterator_t iterator = 0;

    wifimac = lookup_mac_address("sdio");
    if (wifimac != NULL)
        return wifimac;

    wifimac = lookup_mac_address("wlan");
    if (wifimac != NULL)
        return wifimac;

    notify_port = IONotificationPortCreate(kIOMasterPortDefault);

    CFRunLoopSourceRef  runLoopSource = IONotificationPortGetRunLoopSource(notify_port);

    CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, kCFRunLoopDefaultMode);

    if (!IOServiceAddMatchingNotification( notify_port,
                                           kIOMatchedNotification,
                                           IOServiceMatching("IONetworkController"),
                                           (IOServiceMatchingCallback) search_wifi_mac_callback,
                                           &wifimac,
                                           &iterator
                                         ))
    {
        search_wifi_mac_callback((void**)&wifimac, iterator);
        while ( wifimac == NULL)
        {
            if ( CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0, TRUE) != kCFRunLoopRunHandledSource)
            {
                printf("giving up on wifi mac address\n");
                break;
            }
        }
    }
    IONotificationPortDestroy(notify_port);
    return wifimac;
}

