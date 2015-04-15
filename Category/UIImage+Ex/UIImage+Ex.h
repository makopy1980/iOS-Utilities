//
//  UIImage+Ex.h
//

#import <UIKit/UIKit.h>

@interface UIImage (Ex)

#pragma mark - Generate UIImage
+ (UIImage *)imageFromView:(UIView *)view;
+ (UIImage *)imageFromWindow:(UIWindow *)window;
+ (UIImage *)imageFromKeyWindow;
#pragma mark - Generate CGImageRef
+ (CGImageRef)CGImageFromView:(UIView *)view;
+ (CGImageRef)CGImageFromWindow:(UIWindow *)window;
+ (CGImageRef)CGImageFromKeyWindow;

@end
