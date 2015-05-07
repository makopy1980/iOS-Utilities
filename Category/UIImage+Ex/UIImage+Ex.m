//
//  UIImage+Ex.m
//

#import "UIImage+Ex.h"
#import <AVFoundation/AVFoundation.h>

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

+ (UIImage *)imageFromWindow {
    
    UIImage *image;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (UIWindow *aWindow in [[UIApplication sharedApplication] windows]) {
        [aWindow.layer renderInContext:context];
    }
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - Generate CGImageRef

+ (CGImageRef)CGImageFromView:(UIView *)view {
    
    return [[self imageFromView:view] CGImage];
}

+ (CGImageRef)CGImageFromWindow {
    
    return [[self imageFromWindow] CGImage];
}

#pragma mark - Generate CVPixelBufferRef

+ (CVPixelBufferRef)pixelBufferForH264FromView:(UIView *)view {
    
    CGSize size = view.bounds.size;
    
    CVPixelBufferRef pxbuffer = NULL;
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             @YES, kCVPixelBufferCGImageCompatibilityKey,
                             @YES, kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    CVPixelBufferCreate(kCFAllocatorDefault, size.width, size.height, kCVPixelFormatType_32ARGB,
                        (__bridge CFDictionaryRef)options, &pxbuffer);
    
    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pxdata, size.width, size.height, 8, 4 * size.width,
                                                 colorSpace, (CGBitmapInfo)kCGImageAlphaNoneSkipFirst);
    
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    [view.layer renderInContext:context];
    
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    
    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);
    
    return pxbuffer;
}

+ (CVPixelBufferRef)pixelBufferForH264FromWindow {
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    CGSize size = window.bounds.size;
    
    CVPixelBufferRef pxbuffer = NULL;
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             @YES, kCVPixelBufferCGImageCompatibilityKey,
                             @YES, kCVPixelBufferCGBitmapContextCompatibilityKey,
                             nil];
    CVPixelBufferCreate(kCFAllocatorDefault, size.width, size.height, kCVPixelFormatType_32ARGB,
                        (__bridge CFDictionaryRef)options, &pxbuffer);
    
    CVPixelBufferLockBaseAddress(pxbuffer, 0);
    
    void *pxdata = CVPixelBufferGetBaseAddress(pxbuffer);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(pxdata, size.width, size.height, 8, 4 * size.width,
                                                 colorSpace, (CGBitmapInfo)kCGImageAlphaNoneSkipFirst);
    
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    for (UIWindow *aWindow in [[UIApplication sharedApplication] windows]) {
        [aWindow.layer renderInContext:context];
    }
    
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);
    
    CVPixelBufferUnlockBaseAddress(pxbuffer, 0);
    
    return pxbuffer;
}

@end
