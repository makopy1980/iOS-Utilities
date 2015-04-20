//
//  UIColor+SNS.m
//

#import "UIColor+SNS.h"

@implementation UIColor (SNS)

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

#pragma mark - Guileline color of Social Network Services

#pragma mark Facebook(#3B5998)

+ (UIColor *)FacebookColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"3B5998" alpha:alpha];
}

+ (UIColor *)FacebookColor {
    
    return [self FacebookColorWithAlpha:1.0f];
}

#pragma mark Twitter(#55ACEE)

+ (UIColor *)TwitterColorWithAlpha:(CGFloat)alpha {
 
    return [self colorWithHexString:@"55ACEE" alpha:alpha];
}

+ (UIColor *)TwitterColor {
    
    return [self TwitterColorWithAlpha:1.0f];
}

#pragma mark Google+(#DD4B39)

+ (UIColor *)GooglePlusColorWithAlpha:(CGFloat)alpha {
 
    return [self colorWithHexString:@"DD4B39" alpha:alpha];
}

+ (UIColor *)GooglePlusColor {
    
    return [self GooglePlusColorWithAlpha:1.0f];
}

#pragma mark Foursquare(#0CBADF)

+ (UIColor *)FoursquareColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"0CBADF" alpha:alpha];
}

+ (UIColor *)FoursquareColor {
    
    return [self FoursquareColorWithAlpha:1.0f];
}

#pragma mark YouTube(#FF3333)

+ (UIColor *)YouTubeColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"FF3333" alpha:alpha];
}

+ (UIColor *)YouTubeColor {
    
    return [self YouTubeColorWithAlpha:1.0f];
}

#pragma mark Tumblr(#2C4762)

+ (UIColor *)TumblrColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"2C4762" alpha:alpha];
}

+ (UIColor *)TumblrColor {
 
    return [self TumblrColorWithAlpha:1.0f];
}

#pragma mark Vimeo(#1AB7EA)

+ (UIColor *)VimeoColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"1AB7EA" alpha:alpha];
}

+ (UIColor *)VimeoColor {
    
    return [self VimeoColorWithAlpha:1.0f];
}

#pragma mark Flick(#FF0084)

+ (UIColor *)FlickrColorWithAlpha:(CGFloat)alpha {
    
    return [self colorWithHexString:@"FF0084" alpha:alpha];
}

+ (UIColor *)FlickrColor {
    
    return [self FlickrColorWithAlpha:1.0f];
}

@end
