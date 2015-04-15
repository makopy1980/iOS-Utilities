//
//  NSString+Ex.h
//

#import <Foundation/Foundation.h>

@interface  NSString (Ex)

#pragma mark - Check String
- (BOOL)isWhiteSpaceOnly;
- (BOOL)canConvertToInt;
- (BOOL)canConvertToInteger;
#pragma mark - Length
- (NSUInteger)realLength;

@end
