//
//  UIImage+Ex.m
//

#import "UIImage+Ex.h"

@implementation UIImage (Ex)

#pragma mark - Generate UIImage

+ (UIImage *)imageFromView:(UIView *)view {
    
    UIImage *image;
    
    //UIGraphicsBeginImageContext(view.frame.size);
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageFromWindow:(UIWindow *)window {
    
    UIImage *image;
    
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (UIWindow *aWindow in [[UIApplication sharedApplication] windows]) {
        [aWindow.layer renderInContext:context];
    }
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageFromKeyWindow {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    return [self imageFromWindow:window];
}

#pragma mark - Generate CGImageRef

+ (CGImageRef)CGImageFromView:(UIView *)view {
    
    return [[self imageFromView:view] CGImage];
}

+ (CGImageRef)CGImageFromWindow:(UIWindow *)window {
    
    return [[self imageFromWindow:window] CGImage];
}

+ (CGImageRef)CGImageFromKeyWindow {
    
    return [[self imageFromKeyWindow] CGImage];
}

@end
