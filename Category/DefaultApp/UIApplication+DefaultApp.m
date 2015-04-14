//
//  UIApplication+DefaultApp.m
//

#import "UIApplication+DefaultApp.h"


@implementation UIApplication (DefaultApp)

- (void)openSettings {
    
    if ([self canOpenURL:[NSURL settingsURL]]) {
        [self openURL:[NSURL settingsURL]];
    } else {
#ifdef DEBUG
        NSLog(@"Cannot open 'Settings'!");
#endif
    }
}

- (void)openPhotos {
    
    [self openURL:[NSURL photosURL]];
}

- (void)openMaps {
    
    if ([self canOpenURL:[NSURL mapsURL]]) {
        [self openURL:[NSURL mapsURL]];
    } else {
#ifdef DEBUG
        NSLog(@"Cannot open 'Maps'!");
#endif
    }
}

- (void)openMapsWithSearchQuery:(NSString *)query {
    
    if ([self canOpenURL:[NSURL mapsURLWithSearchQuery:query]]) {
        [self openURL:[NSURL mapsURLWithSearchQuery:query]];
    } else {
#ifdef DEBUG
        NSLog(@"Cannot open 'Maps' with Query!");
#endif
        [self openMaps];
    }
}

@end
