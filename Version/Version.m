//
// Version.m
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Version.h"

#define ToBOOL(value)              ((value) ? YES : NO)
#define COMP(operator,number)    ToBOOL(_number operator number)

@implementation Version {
    
    int _major;
    int _minor;
    int _micro;
    int _number;
    NSString *_description;
}

#pragma mark - iOS Version

+ (Version *)iOSVersion {
    
    return [Version versionWithString:[[UIDevice currentDevice] systemVersion]];
}

#pragma mark - Private Methods

- (void)checkRange:(int)aValue {
    
    if (aValue < 0 || 255 < aValue) {
        @throw NSInvalidArgumentException;
    }
}

- (void)checkNil:(id)object {
    
    if (object == nil) {
        @throw NSInvalidArgumentException;
    }
}

- (int)generateNumberWithMajor:(int)major minor:(int)minor micro:(int)micro {
    
    return (major << 16) | (minor << 8) | micro;
}

- (int)checkAndGenerateNumberWithMajor:(int)major minor:(int)minor micro:(int)micro {
    
    [self checkRange:major];
    [self checkRange:minor];
    [self checkRange:micro];

    return [self generateNumberWithMajor:major
                                   minor:minor
                                   micro:micro];
}

- (NSString *)generateDescriptionWithMajor:(int)major minor:(int)minor micro:(int)micro {
    
    return [NSString stringWithFormat:@"%d.%d.%d", major, minor, micro];
}

- (void)update {
    
    _number = [self generateNumberWithMajor:_major
                                      minor:_minor
                                      micro:_micro];
    _description = [self generateDescriptionWithMajor:_major
                                                minor:_minor
                                                micro:_micro];
}

- (int)parseInt:(NSString *)string formatter:(NSNumberFormatter *)formatter {
    
    NSNumber *number = [formatter numberFromString:string];
    
    if (number == nil) {
        @throw NSInvalidArgumentException;
    }
    
    return [number intValue];
}

#pragma mark - Initialize

- (id)init {
    
    return [self initWithMajor:0
                         minor:0
                         micro:0];
}

- (id)initWithMajor:(int)major {
    
    return [self initWithMajor:major
                         minor:0
                         micro:0];
}

- (id)initWithMajor:(int)major minor:(int)minor {
    
    return [self initWithMajor:major
                         minor:minor
                         micro:0];
}

- (id)initWithMajor:(int)major minor:(int)minor micro:(int)micro {
    
    self = [super init];

    if (self == nil) {
        return nil;
    }

    [self checkRange:major];
    [self checkRange:minor];
    [self checkRange:micro];

    _major  = major;
    _minor  = minor;
    _micro  = micro;

    [self update];

    return self;
}

- (id)initWithString:(NSString *)string {
    
    if (string == nil || [string length] == 0) {
        @throw NSInvalidArgumentException;
    }

    NSArray *components = [string componentsSeparatedByString:@"."];

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];

    int major = 0;
    int minor = 0;
    int micro = 0;

    switch ([components count]) {
            
        case 3:
            micro = [self parseInt:[components objectAtIndex:2]
                         formatter:formatter];

        case 2:
            minor = [self parseInt:[components objectAtIndex:1]
                         formatter:formatter];

        case 1:
            major = [self parseInt:[components objectAtIndex:0]
                         formatter:formatter];
            break;

        default:
            @throw NSInvalidArgumentException;
    }

    return [self initWithMajor:major
                         minor:minor
                         micro:micro];
}

#pragma mark - Getter

- (int)major {
    
    return _major;
}

- (int)minor {
    
    return _minor;
}

- (int)micro {
    
    return _micro;
}

- (int)number {
    
    return _number;
}

- (NSString *)description {
    
    return _description;
}

#pragma mark Setter

- (void)setMajor:(int)major {
    
    [self setMajor:major minor:_minor micro:_micro];
}

- (void)setMajor:(int)major minor:(int)minor {
    
    [self setMajor:major minor:minor micro:_micro];
}

- (void)setMajor:(int)major minor:(int)minor micro:(int)micro {
    
    [self checkRange:major];
    [self checkRange:minor];
    [self checkRange:micro];

    if ((_major != major) || (_minor != minor) || (_micro != micro)) {
        
        _major = major;
        _minor = minor;
        _micro = micro;

        [self update];
    }
}

- (void)setMinor:(int)minor {
    
    [self setMajor:_major
             minor:minor
             micro:_micro];
}

- (void)setMinor:(int)minor micro:(int)micro {
    
    [self setMajor:_major
             minor:minor
             micro:micro];
}

- (void)setMicro:(int)micro {
    
    [self setMajor:_major
             minor:_minor
             micro:micro];
}

#pragma mark - Compare

- (NSComparisonResult)compareToMajor:(int)major {
    
    return [self compareToMajor:major
                          minor:0
                          micro:0];
}

- (NSComparisonResult)compareToMajor:(int)major minor:(int)minor {
    
    return [self compareToMajor:major
                          minor:minor
                          micro:0];
}

- (NSComparisonResult)compareToMajor:(int)major minor:(int)minor micro:(int)micro {

    int number = [self checkAndGenerateNumberWithMajor:major
                                                 minor:minor
                                                 micro:micro];

    return [self compareToNumber:number];
}

- (NSComparisonResult)compareToNumber:(int)number {
    
    if (_number < number) {
        return NSOrderedAscending;
    } else if (_number == number) {
        return NSOrderedSame;
    } else {
        return NSOrderedDescending;
    }
}

- (NSComparisonResult)compareTo:(Version *)aVersion {
    
    [self checkNil:aVersion];

    return [self compareToNumber:[aVersion number]];
}

#pragma mark Equal to

- (BOOL)isEqualToMajor:(int)major
{
    return [self isEqualToMajor:major minor:0 micro:0];
}

- (BOOL)isEqualToMajor:(int)major minor:(int)minor
{
    return [self isEqualToMajor:major minor:minor micro:0];
}

- (BOOL)isEqualToMajor:(int)major minor:(int)minor micro:(int)micro
{
    int number = [self checkAndGenerateNumberWithMajor:major
                                                 minor:minor
                                                 micro:micro];

    return [self isEqualToNumber:number];
}

- (BOOL)isEqualToNumber:(int)number {
    
    return COMP(==, number);
}

- (BOOL)isEqualTo:(Version *)aVersion {
    
    [self checkNil:aVersion];

    return [self isEqualToNumber:[aVersion number]];
}

#pragma mark Not Equal to

- (BOOL)isNotEqualToMajor:(int)major {
    
    return [self isNotEqualToMajor:major
                             minor:0
                             micro:0];
}

- (BOOL)isNotEqualToMajor:(int)major minor:(int)minor {
    
    return [self isNotEqualToMajor:major
                             minor:minor
                             micro:0];
}

- (BOOL)isNotEqualToMajor:(int)major minor:(int)minor micro:(int)micro {
    
    int number = [self checkAndGenerateNumberWithMajor:major
                                                 minor:minor
                                                 micro:micro];

    return [self isNotEqualToNumber:number];
}

- (BOOL)isNotEqualToNumber:(int)number {
    
    return COMP(!=, number);
}

- (BOOL)isNotEqualTo:(Version *)aVersion {
    
    [self checkNil:aVersion];

    return [self isNotEqualToNumber:[aVersion number]];
}

#pragma mark Less than

- (BOOL)isLessThanMajor:(int)major {
    
    return [self isLessThanMajor:major
                           minor:0
                           micro:0];
}

- (BOOL)isLessThanMajor:(int)major minor:(int)minor {
    
    return [self isLessThanMajor:major
                           minor:minor
                           micro:0];
}

- (BOOL)isLessThanMajor:(int)major minor:(int)minor micro:(int)micro {
    
    int number = [self checkAndGenerateNumberWithMajor:major
                                                 minor:minor
                                                 micro:micro];

    return [self isLessThanNumber:number];
}

- (BOOL)isLessThanNumber:(int)number {
    
    return COMP(<, number);
}

- (BOOL)isLessThan:(Version *)aVersion {
    
    [self checkNil:aVersion];

    return [self isLessThanNumber:[aVersion number]];
}

#pragma mark Less than or equal to

- (BOOL)isLessThanOrEqualToMajor:(int)major {
    
    return [self isLessThanOrEqualToMajor:major
                                    minor:0
                                    micro:0];
}

- (BOOL)isLessThanOrEqualToMajor:(int)major minor:(int)minor {
    
    return [self isLessThanOrEqualToMajor:major
                                    minor:minor
                                    micro:0];
}

- (BOOL)isLessThanOrEqualToMajor:(int)major minor:(int)minor micro:(int)micro {
    
    int number = [self checkAndGenerateNumberWithMajor:major
                                                 minor:minor
                                                 micro:micro];

    return [self isLessThanOrEqualToNumber:number];
}

- (BOOL)isLessThanOrEqualToNumber:(int)number {
    
    return COMP(<=, number);
}

- (BOOL)isLessThanOrEqualTo:(Version *)aVersion {
    
    [self checkNil:aVersion];

    return [self isLessThanOrEqualToNumber:[aVersion number]];
}

#pragma mark Greater than

- (BOOL)isGreaterThanMajor:(int)major {
    
    return [self isGreaterThanMajor:major
                              minor:0
                              micro:0];
}

- (BOOL)isGreaterThanMajor:(int)major minor:(int)minor {
    
    return [self isGreaterThanMajor:major
                              minor:minor
                              micro:0];
}

- (BOOL)isGreaterThanMajor:(int)major minor:(int)minor micro:(int)micro {
    
    int number = [self checkAndGenerateNumberWithMajor:major
                                                 minor:minor
                                                 micro:micro];

    return [self isGreaterThanNumber:number];
}

- (BOOL)isGreaterThanNumber:(int)number {
    
    return COMP(>, number);
}

- (BOOL)isGreaterThan:(Version *)aVersion {
    
    [self checkNil:aVersion];

    return [self isGreaterThanNumber:[aVersion number]];
}

#pragma mark Greater than or equal to

- (BOOL)isGreaterThanOrEqualToMajor:(int)major {
    
    return [self isGreaterThanOrEqualToMajor:major
                                       minor:0
                                       micro:0];
}

- (BOOL)isGreaterThanOrEqualToMajor:(int)major minor:(int)minor {
    
    return [self isGreaterThanOrEqualToMajor:major
                                       minor:minor
                                       micro:0];
}

- (BOOL)isGreaterThanOrEqualToMajor:(int)major minor:(int)minor micro:(int)micro {
    
    int number = [self checkAndGenerateNumberWithMajor:major
                                                 minor:minor
                                                 micro:micro];

    return [self isGreaterThanOrEqualToNumber:number];
}

- (BOOL)isGreaterThanOrEqualToNumber:(int)number {
    
    return COMP(>=, number);
}

- (BOOL)isGreaterThanOrEqualTo:(Version *)aVersion {
    
    [self checkNil:aVersion];

    return [self isGreaterThanOrEqualToNumber:[aVersion number]];
}

#pragma mark Constructor

+ (Version *)versionWithMajor:(int)major {
    
    return [[Version alloc] initWithMajor:major];
}

+ (Version *)versionWithMajor:(int)major minor:(int)minor {
    
    return [[Version alloc] initWithMajor:major
                                    minor:minor];
}

+ (Version *)versionWithMajor:(int)major minor:(int)minor micro:(int)micro {
    
    return [[Version alloc] initWithMajor:major
                                    minor:minor
                                    micro:micro];
}

+ (Version *)versionWithString:(NSString *)string {
    
    return [[Version alloc] initWithString:string];
}

@end
