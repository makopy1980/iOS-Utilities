//
//  NSDate+Ex.m
//

#import "NSDate+Ex.h"

@implementation NSDate (Ex)

+ (NSDate *)dateLocal {
    
    return [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone] secondsFromGMT]];
}

@end
