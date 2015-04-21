//
//  UIColor+ToeiSubway.h
//

#import <UIKit/UIKit.h>

@interface UIColor (ToeiSubway)

#pragma mark - Asakusa Line(#E85298)
+ (UIColor *)ToeiAsakusaLineColorWithAlpha:(CGFloat)alpha;
+ (UIColor *)ToeiAsakusaLineColor;
#pragma mark - Mita Line(#0079C2)
+ (UIColor *)ToeiMitaLineColorWithAlpha:(CGFloat)alpha;
+ (UIColor *)ToeiMitaLineColor;
#pragma mark - Shinjuku Line(#6CBB5A)
+ (UIColor *)ToeiShinjukuLineColorWithAlpha:(CGFloat)alpha;
+ (UIColor *)ToeiShinjukuLineColor;
#pragma mark - Oedo Line(#B6007A)
+ (UIColor *)ToeiOedoLineColorWithAlpha:(CGFloat)alpha;
+ (UIColor *)ToeiOedoLineColor;

@end
