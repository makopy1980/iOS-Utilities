//
// Version.h
//

#import <Foundation/Foundation.h>

@interface Version : NSObject

#pragma mark - iOS Version
+ (Version *)iOSVersion;

#pragma mark - Initialize
- (id)init;
- (id)initWithMajor:(int)major;
- (id)initWithMajor:(int)major minor:(int)minor;
- (id)initWithMajor:(int)major minor:(int)minor micro:(int)micro;
- (id)initWithString:(NSString *)string;

#pragma mark - Getter
- (int)major;
- (int)minor;
- (int)micro;
- (int)number;
- (NSString *)description;

#pragma mark - Setter
- (void)setMajor:(int)major;
- (void)setMajor:(int)major minor:(int)minor;
- (void)setMajor:(int)major minor:(int)minor micro:(int)micro;
- (void)setMinor:(int)minor;
- (void)setMinor:(int)minor micro:(int)micro;
- (void)setMicro:(int)micro;

#pragma mark - Compare
- (NSComparisonResult)compareToMajor:(int)major;
- (NSComparisonResult)compareToMajor:(int)major minor:(int)minor;
- (NSComparisonResult)compareToMajor:(int)major minor:(int)minor micro:(int)micro;
- (NSComparisonResult)compareToNumber:(int)number;
- (NSComparisonResult)compareTo:(Version *)aVersion;

#pragma mark Equal to
- (BOOL)isEqualToMajor:(int)major;
- (BOOL)isEqualToMajor:(int)major minor:(int)minor;
- (BOOL)isEqualToMajor:(int)major minor:(int)minor micro:(int)micro;
- (BOOL)isEqualToNumber:(int)number;
- (BOOL)isEqualTo:(Version *)aVersion;

#pragma mark Not Equal to
- (BOOL)isNotEqualToMajor:(int)major;
- (BOOL)isNotEqualToMajor:(int)major minor:(int)minor;
- (BOOL)isNotEqualToMajor:(int)major minor:(int)minor micro:(int)micro;
- (BOOL)isNotEqualToNumber:(int)number;
- (BOOL)isNotEqualTo:(Version *)aVersion;

#pragma mark Less than
- (BOOL)isLessThanMajor:(int)major;
- (BOOL)isLessThanMajor:(int)major minor:(int)minor;
- (BOOL)isLessThanMajor:(int)major minor:(int)minor micro:(int)micro;
- (BOOL)isLessThanNumber:(int)number;
- (BOOL)isLessThan:(Version *)aVersion;

#pragma mark Less than or equal to
- (BOOL)isLessThanOrEqualToMajor:(int)major;
- (BOOL)isLessThanOrEqualToMajor:(int)major minor:(int)minor;
- (BOOL)isLessThanOrEqualToMajor:(int)major minor:(int)minor micro:(int)micro;
- (BOOL)isLessThanOrEqualToNumber:(int)number;
- (BOOL)isLessThanOrEqualTo:(Version *)aVersion;

#pragma mark Greater than
- (BOOL)isGreaterThanMajor:(int)major;
- (BOOL)isGreaterThanMajor:(int)major minor:(int)minor;
- (BOOL)isGreaterThanMajor:(int)major minor:(int)minor micro:(int)micro;
- (BOOL)isGreaterThanNumber:(int)number;
- (BOOL)isGreaterThan:(Version *)aVersion;

#pragma mark Greater than or equal to
- (BOOL)isGreaterThanOrEqualToMajor:(int)major;
- (BOOL)isGreaterThanOrEqualToMajor:(int)major minor:(int)minor;
- (BOOL)isGreaterThanOrEqualToMajor:(int)major minor:(int)minor micro:(int)micro;
- (BOOL)isGreaterThanOrEqualToNumber:(int)number;
- (BOOL)isGreaterThanOrEqualTo:(Version *)aVersion;

#pragma mark Constructor
+ (Version *)versionWithMajor:(int)major;
+ (Version *)versionWithMajor:(int)major minor:(int)minor;
+ (Version *)versionWithMajor:(int)major minor:(int)minor micro:(int)micro;
+ (Version *)versionWithString:(NSString *)string;
@end
