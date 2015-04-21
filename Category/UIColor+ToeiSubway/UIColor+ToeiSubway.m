//
//  UIColor+ToeiSubway.m
//

#import "UIColor+ToeiSubway.h"

@implementation UIColor (ToeiSubway)

+ (UIColor *)colorWithHexString:(NSString *)hex alpha:(CGFloat)alpha {
    
    NSScanner *colorScanner = [NSScanner scannerWithString:hex];
    
    unsigned int color;
    
    if (![colorScanner scanHexInt:&color]) {
        
        return nil;
    }
    
    CGFloat R = ((color & 0xFF0000) >> 16) / 255.0f;
    CGFloat G = ((color & 0x00FF00) >> 8) / 255.0f;
    CGFloat B = (color & 0x0000FF) / 255.0f;
    
    return [UIColor colorWithRed:R green:G blue:B alpha:alpha];
}

#pragma mark - Asakusa Line(#E85298)

+ (UIColor *)ToeiAsakusaLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"E85298" alpha:alpha];
}

+ (UIColor *)ToeiAsakusaLineColor {
    
    return [self ToeiAsakusaLineColorWithAlpha:1.0f];
}

#pragma mark - Mita Line(#0079C2)

+ (UIColor *)ToeiMitaLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"0079C2" alpha:alpha];
}

+ (UIColor *)ToeiMitaLineColor {
    
    return [self ToeiMitaLineColorWithAlpha:1.0f];
}

#pragma mark - Shinjuku Line(#6CBB5A)

+ (UIColor *)ToeiShinjukuLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"6CBB5A" alpha:alpha];
}

+ (UIColor *)ToeiShinjukuLineColor {
    
    return [self ToeiShinjukuLineColorWithAlpha:1.0f];
}

#pragma mark - Oedo Line(#B6007A)

+ (UIColor *)ToeiOedoLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"B6007A" alpha:alpha];
}

+ (UIColor *)ToeiOedoLineColor {
    
    return [self ToeiOedoLineColorWithAlpha:1.0f];
}

@end
