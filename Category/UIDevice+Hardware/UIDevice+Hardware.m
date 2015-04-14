//
//  UIDevice+Hardware.m
//

#import "UIDevice+Hardware.h"

@implementation UIDevice (Hardware)

- (NSString *)hardInfoDescription {
    
    return [NSString stringWithFormat:@"\nModel: %@\niOS version: %@\nMAC Address: %@",
            [self modelName], [self systemVersion], [self macAddress]];
}

#pragma mark - Model

- (NSString *)modelIdentifier {
    
    return [self getSysInfoByName:"hw.machine"];
}

- (NSString *)modelName {
    
    return [self modelNameForModelIdentifier:[self modelIdentifier]];
}

- (NSString *)modelNameForModelIdentifier:(NSString *)modelIdentifier {
    
    if ([modelIdentifier isEqualToString:@"iPhone1,1"]) {
        return @"iPhone 1G";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone1,2"]){
        return @"iPhone 3G";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone2,1"]){
        return @"iPhone 3GS";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone3,1"]) {
        return @"iPhone 4 (GSM)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone3,2"]) {
        return @"iPhone 4 (GSM Rev A)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone3,3"]) {
        return @"iPhone 4 (CDMA)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone4,1"]) {
        return @"iPhone 4S";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone5,1"]) {
        return @"iPhone 5 (GSM)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone5,2"]) {
        return @"iPhone 5 (Global)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone5,3"]) {
        return @"iPhone 5c (GSM)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone5,4"]) {
       return @"iPhone 5c (Global)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone6,1"]) {
        return @"iPhone 5s (GSM)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone6,2"]) {
        return @"iPhone 5s (Global)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone7,1"]) {
        return @"iPhone 6 Plus";
    }
    
    if ([modelIdentifier isEqualToString:@"iPhone7,2"]) {
        return @"iPhone 6";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad1,1"]) {
        return @"iPad 1G";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad2,1"]) {
        return @"iPad 2 (Wi-Fi)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad2,2"]) {
        return @"iPad 2 (GSM)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad2,3"]) {
        return @"iPad 2 (CDMA)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad2,4"]) {
        return @"iPad 2 (Rev A)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad3,1"]) {
        return @"iPad 3 (Wi-Fi)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad3,2"]) {
        return @"iPad 3 (GSM)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad3,3"]) {
        return @"iPad 3 (Global)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad3,4"]) {
        return @"iPad 4 (Wi-Fi)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad3,5"]) {
        return @"iPad 4 (GSM)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad3,6"]) {
       return @"iPad 4 (Global)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad4,1"]) {
        return @"iPad Air (Wi-Fi)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad4,2"]) {
        return @"iPad Air (Cellular)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad5,3"]) {
       return @"iPad Air 2 (Wi-Fi)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad5,4"]) {
        return @"iPad Air 2 (Cellular)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad2,5"]) {
        return @"iPad mini 1G (Wi-Fi)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad2,6"]) {
       return @"iPad mini 1G (GSM)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad2,7"]) {
        return @"iPad mini 1G (Global)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad4,4"]) {
        return @"iPad mini 2G (Wi-Fi)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad4,5"]) {
        return @"iPad mini 2G (Cellular)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad4,7"]) {
        return @"iPad mini 3G (Wi-Fi)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad4,8"]) {
       return @"iPad mini 3G (Cellular)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPad4,9"]) {
        return @"iPad mini 3G (Cellular)";
    }
    
    if ([modelIdentifier isEqualToString:@"iPod1,1"]) {
       return @"iPod touch 1G";
    }
    
    if ([modelIdentifier isEqualToString:@"iPod2,1"]) {
        return @"iPod touch 2G";
    }
    
    if ([modelIdentifier isEqualToString:@"iPod3,1"]) {
        return @"iPod touch 3G";
    }
    
    if ([modelIdentifier isEqualToString:@"iPod4,1"]) {
        return @"iPod touch 4G";
    }
    
    if ([modelIdentifier isEqualToString:@"iPod5,1"]) {
       return @"iPod touch 5G"; 
    }
    
    // Simulator
    if ([modelIdentifier hasSuffix:@"86"]
        || [modelIdentifier isEqual:@"x86_64"]) {
        
        BOOL smallerScreen = ([[UIScreen mainScreen] bounds].size.width < 768.0f);
        return (smallerScreen ? @"iPhone Simulator" : @"iPad Simulator");
    }
    
    return modelIdentifier;
}

- (UIDeviceFamily)deviceFamily {
    
    NSString *modelIdentifier = [self modelIdentifier];
    
    if ([modelIdentifier hasPrefix:@"iPhone"]) {
       return UIDeviceFamilyiPhone;
    }
    if ([modelIdentifier hasPrefix:@"iPod"]) {
       return UIDeviceFamilyiPod;
    }
    if ([modelIdentifier hasPrefix:@"iPad"]) {
        return UIDeviceFamilyiPad;
    }
    
    return UIDeviceFamilyUnknown;
}


#pragma mark  - sysctlbyname

- (NSString *)getSysInfoByName:(char *)typeSpecifier {
    
    size_t size;
    sysctlbyname(typeSpecifier, NULL, &size, NULL, 0);
    
    char *answer = malloc(size);
    sysctlbyname(typeSpecifier, answer, &size, NULL, 0);
    
    NSString *results = [NSString stringWithCString:answer
                                           encoding: NSUTF8StringEncoding];
    
    free(answer);
    
    return results;
}


- (NSString *)platform {
    
    return [self getSysInfoByName:"hw.machine"];
}

- (NSString *)hwmodel {
    
    return [self getSysInfoByName:"hw.model"];
}

#pragma mark - sysctl

- (NSUInteger)getSysInfo:(uint)typeSpecifier {
    
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    
    return (NSUInteger) results;
}

- (NSUInteger)cpuFrequency {
    
    return [self getSysInfo:HW_CPU_FREQ];
}

- (NSUInteger)busFrequency {
    
    return [self getSysInfo:HW_BUS_FREQ];
}

- (NSUInteger)cpuCount {
    
    return [self getSysInfo:HW_NCPU];
}

- (NSUInteger)totalMemory {
    
    return [self getSysInfo:HW_PHYSMEM];
}

- (NSUInteger)userMemory {
    
    return [self getSysInfo:HW_USERMEM];
}

- (NSUInteger)maxSocketBufferSize {
    
    return [self getSysInfo:KIPC_MAXSOCKBUF];
}

#pragma mark - File System

- (NSNumber *)totalDiskSpace {
    
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory()
                                                                                        error:nil];
    return [fattributes objectForKey:NSFileSystemSize];
}

- (NSNumber *)freeDiskSpace {
    
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory()
                                                                                        error:nil];
    return [fattributes objectForKey:NSFileSystemFreeSize];
}

#pragma mark - etc...

- (BOOL)hasRetinaDisplay {
    
    return ([UIScreen mainScreen].scale == 2.0f);
}

- (NSString *) macAddress {
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Error: Memory allocation error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2\n");
        free(buf); // Thanks, Remy "Psy" Demerest
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X",
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    
    free(buf);
    
    return outstring;
}


@end
