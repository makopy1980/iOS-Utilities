//
//  NSLocale+Ex.m
//

#import "NSLocale+Ex.h"

@implementation NSLocale (Ex)

+ (NSString *)userLanguageCode {
    
    return [[self preferredLanguages] objectAtIndex:0];
}

@end
