//
//  UIDevice+Hardware.h
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

typedef enum {
    
    UIDeviceFamilyiPhone,
    UIDeviceFamilyiPod,
    UIDeviceFamilyiPad,
    UIDeviceFamilyAppleTV,
    UIDeviceFamilyUnknown,
    
} UIDeviceFamily;

@interface UIDevice (Hardware)

- (NSString *)hardInfoDescription;
#pragma mark - Model
- (NSString *)modelIdentifier;
- (NSString *)modelName;
- (UIDeviceFamily)deviceFamily;
#pragma mark  - sysctlbyname
- (NSString *) platform;
- (NSString *) hwmodel;
#pragma mark - sysctl
- (NSUInteger) cpuFrequency;
- (NSUInteger) busFrequency;
- (NSUInteger) cpuCount;
- (NSUInteger) totalMemory;
- (NSUInteger) userMemory;
- (NSUInteger) maxSocketBufferSize;
#pragma mark - File System
- (NSNumber *) totalDiskSpace;
- (NSNumber *) freeDiskSpace;
#pragma mark - etc...
- (BOOL) hasRetinaDisplay;
- (NSString *) macAddress;
@end
