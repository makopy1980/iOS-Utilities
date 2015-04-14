//
//  NSURL+DefaultApp.m
//

#import "NSURL+DefaultApp.h"

@implementation NSURL (DefaultApp)

+ (NSURL *)settingsURL {
    
    return [NSURL URLWithString:UIApplicationOpenSettingsURLString];
}

+ (NSURL *)photosURL {
    
    return [NSURL URLWithString:@"photos-redirect:"];
}

+ (NSURL *)mapsURL {
    
    return [NSURL URLWithString:@"maps://"];
}

+ (NSURL *)mapsURLWithSearchQuery:(NSString *)query {
    
    NSString *urlStr = [NSString stringWithFormat:@"maps://search?q=%@", query];
    
    return [NSURL URLWithString:urlStr];
}


@end
