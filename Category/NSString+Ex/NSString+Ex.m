//
//  NSString+Ex.m
//

#import "NSString+Ex.h"

@implementation NSString (Ex)

#pragma mark - Check String

- (BOOL)isWhiteSpaceOnly {
    
    BOOL ret = NO;
    
    if (self == nil) {
        ret = YES;
    } else if ([self length] == 0){
        ret = YES;
    } else {
        NSString *chkStr = [self stringByTrimmingCharactersInSet:
                            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([chkStr length] == 0) {
            ret = YES;
        }
    }
    
    return ret;
}

- (BOOL)canConvertToInt {
    
    // nil or 空文字 or 空白文字のみ
    if ([self isWhiteSpaceOnly]) {
        return NO;
    } else {
        // selfとintValueした値の文字列チェック
        if (![self isEqualToString:[NSString stringWithFormat:@"%d", [self intValue]]]) {
            
            // 救済措置(00001のような場合)
            int len = (int)[self length];
            
            for (int i = 0; i < len; i++) {
                
                unichar c = [self characterAtIndex:i];
                
                if (!isdigit(c)) {
                    return NO;
                }
            }
        }
    }
    
    // 最終チェック(値がintの範囲を超えていないかどうか)
    long long value = [self longLongValue];
    
    if (value < INT_MIN || value > INT_MAX) {
        return NO;
    }
    
    return YES;
}

- (BOOL)canConvertToInteger {
    
    // nil or 空文字 or 空白文字のみ
    if ([self isWhiteSpaceOnly]) {
        return NO;
    } else {
        // selfとintValueした値の文字列チェック
        if (![self isEqualToString:[NSString stringWithFormat:@"%ld", [self integerValue]]]) {
            
            // 救済措置(00001のような場合)
            int len = (int)[self length];
            
            for (int i = 0; i < len; i++) {
                
                unichar c = [self characterAtIndex:i];
                
                if (!isdigit(c)) {
                    return NO;
                }
            }
        }
    }
    
    // 最終チェック(値がNSIntegerの範囲を超えていないかどうか)
    long long value = [self longLongValue];
    
    if (value < NSIntegerMin || value > NSIntegerMax) {
        return NO;
    }
    
    return YES;
}

#pragma mark - Length

- (NSUInteger)realLength {
    
    NSUInteger count = 0;
    
    if (self == nil) {
        return count;
    }
    
    int length = (int)[self length];
    
    for (int i = 0; i < length; i++) {
        unichar uchar = [self characterAtIndex:i];
        if (CFStringIsSurrogateHighCharacter(uchar)) {
            // サロゲートペア:上位サロゲート i++;
            ++count;
        } else if (CFStringIsSurrogateLowCharacter(uchar)) {
            // サロゲートペア:下位サロゲート // 無視(何もしない)
        } else {
            ++count;
        }
    }
    
    return count;
}

@end
