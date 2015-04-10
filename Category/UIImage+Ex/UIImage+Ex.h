//
//  UIImage+Ex.h
//

#import <UIKit/UIKit.h>

@interface UIImage (Ex)

+ (UIImage *)imageFromView:(UIView *)view;
+ (UIImage *)imageFromWindow:(UIWindow *)window;
+ (UIImage *)imageFromKeyWindow;

@end
