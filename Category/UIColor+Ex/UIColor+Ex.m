//
//  UIColor+Ex.m
//

#import "UIColor+Ex.h"

@implementation UIColor (Ex)

+ (UIColor *)colorWithHexString:(NSString *)hex {
    
    return [self colorWithHexString:hex alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)hex alpha:(CGFloat)alpha {
    
    NSScanner *colorScanner = [NSScanner scannerWithString:hex];
    
    unsigned int color;
    
    if (![colorScanner scanHexInt:&color]) {
        
        return nil;
    }
    
    CGFloat R = ((color & 0xFF0000) >> 16) / 255.0f;
    CGFloat G = ((color & 0x00FF00) >> 8) / 255.0f;
    CGFloat B = (color & 0x0000FF) / 255.0f;
    
    return [UIColor colorWithRed:R
                           green:G
                            blue:B
                           alpha:alpha];
    
}

@end
