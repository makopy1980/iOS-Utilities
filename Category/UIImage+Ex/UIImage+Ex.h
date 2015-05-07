//
//  UIImage+Ex.h
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface UIImage (Ex)

#pragma mark - Generate UIImage
+ (UIImage *)imageFromView:(UIView *)view;
+ (UIImage *)imageFromWindow;
#pragma mark - Generate CGImageRef
+ (CGImageRef)CGImageFromView:(UIView *)view;
+ (CGImageRef)CGImageFromWindow;
#pragma mark - Generate CVPixelBufferRef
+ (CVPixelBufferRef)pixelBufferForH264FromView:(UIView *)view;
+ (CVPixelBufferRef)pixelBufferForH264FromWindow;

@end
