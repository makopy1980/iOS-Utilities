//
//  NSString+Ex.m
//

#import "NSString+Ex.h"

@implementation NSString (Ex)

- (NSUInteger)realLength {
    
    if (self == nil) {
        return 0;
    }
    
    NSUInteger count = 0;
    
    int length = (int)[self length];
    
    for (int i = 0; i < length; i++) {
        
        unichar uchar = [self characterAtIndex:i];
        
        if (CFStringIsSurrogateHighCharacter(uchar)) {
            i++;
            ++count;
        } else if (CFStringIsSurrogateLowCharacter(uchar)) {
            // Nothing to do...
        } else {
            ++count;
        }
    }
    
    return count;
}

- (BOOL)isWhiteSpaceOnly {
    
    BOOL ret = NO;
    
    if (self == nil) {
        ret = YES;
    } else {
        NSString *newStr = [self stringByTrimmingCharactersInSet:
                            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([newStr length] == 0) {
            ret = YES;
        }
    }
    
    return ret;
}

@end
