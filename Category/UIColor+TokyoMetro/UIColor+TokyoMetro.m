//
//  UIColor+TokyoMetro.m
//

#import "UIColor+TokyoMetro.h"

@implementation UIColor (TokyoMetro)

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

#pragma mark - Ginza Line(#F39700)

+ (UIColor *)GinzaLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"F39700" alpha:alpha];
}

+ (UIColor *)GinzaLineColor {
    
    return [self GinzaLineColorWithAlpha:1.0f];
}

#pragma mark - Marunouchi Line(#E60012)

+ (UIColor *)MarunouchiLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"E60012" alpha:alpha];
}

+ (UIColor *)MarunouchiLineColor {
    
    return [self MarunouchiLineColorWithAlpha:1.0f];
}

#pragma mark - Hibiya Line(#9CAEB7)

+ (UIColor *)HibiyaLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"9CAEB7" alpha:alpha];
}

+ (UIColor *)HibiyaLineColor {
    
    return  [self HibiyaLineColorWithAlpha:1.0f];
}

#pragma mark - Tozai Line(#00A7DB)

+ (UIColor *)TozaiLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"00A7DB" alpha:alpha];
}

+ (UIColor *)TozaiLineColor {
    
    return [self TozaiLineColorWithAlpha:1.0f];
}

#pragma mark - Chiyoda Line(#009944)

+ (UIColor *)ChiyodaLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"009944" alpha:alpha];
}

+ (UIColor *)ChiyodaLineColor {
    
    return [self ChiyodaLineColorWithAlpha:1.0f];
}

#pragma mark - Yurakucho Line(#D7C447)

+ (UIColor *)YurakuchoLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"D7C447" alpha:alpha];
}

+ (UIColor *)YurakuchoLineColor {
    
    return [self YurakuchoLineColorWithAlpha:1.0f];
}

#pragma mark - Hanzomon Line(#9B7CB6)

+ (UIColor *)HanzomonLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"9B7CB6" alpha:alpha];
}

+ (UIColor *)HanzomonLineColor {
    
    return [self HanzomonLineColorWithAlpha:1.0f];
}

#pragma mark - Namboku Line(#00ADA9)

+ (UIColor *)NambokuLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"00ADA9" alpha:alpha];
}

+ (UIColor *)NambokuLineColor {
    
    return [self NambokuLineColorWithAlpha:1.0f];
}

#pragma mark - Fukutoshin Line(#BB641D)

+ (UIColor *)FukutoshinLineColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"BB641D" alpha:alpha];
}

+ (UIColor *)FukutoshinLineColor {
    
    return [self FukutoshinLineColorWithAlpha:1.0f];
}

@end
