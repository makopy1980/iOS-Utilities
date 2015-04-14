//
//  NSURL+DefaultApp.h
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSURL (DefaultApp)

+ (NSURL *)settingsURL NS_AVAILABLE_IOS(8_0);
+ (NSURL *)photosURL;
+ (NSURL *)mapsURL;
+ (NSURL *)mapsURLWithSearchQuery:(NSString *)query;

@end
