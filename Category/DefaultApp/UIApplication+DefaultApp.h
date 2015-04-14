//
//  UIApplication+DefaultApp.h
//

#import <UIKit/UIKit.h>
#import "NSURL+DefaultApp.h"

@interface UIApplication (DefaultApp)

- (void)openSettings NS_AVAILABLE_IOS(8_0);
- (void)openPhotos;
- (void)openMaps;
- (void)openMapsWithSearchQuery:(NSString *)query;

@end
