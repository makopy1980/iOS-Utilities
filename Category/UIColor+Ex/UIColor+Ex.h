//
//  UIColor+Ex.h
//

#import <UIKit/UIKit.h>

@interface UIColor (Ex)

+ (UIColor *)colorWithHexString:(NSString *)hex;
+ (UIColor *)colorWithHexString:(NSString *)hex alpha:(CGFloat)alpha;

@end
