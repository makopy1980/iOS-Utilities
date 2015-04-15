//
//  NSBundle+Ex.m
//

#import "NSBundle+Ex.h"

@implementation NSBundle (Ex)

// ローカライズ対応言語以外英語で表示する
- (NSString *)HCLocalizedString:(NSString *)key {
    
    // ==========================
    // 英語 - @"en"
    // 日本語 - @"ja"
    // フランス語 - @"fr"
    // ドイツ語 - @"de"
    // イタリア語 - @"it"
    // スペイン語 - @"es"
    // ポルトガル語 - @"pt"
    // 韓国語 - @"ko"
    //==========================
    
    NSString *localizedStr = nil;
    
    NSString *pLang = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    if ([pLang isEqualToString:@"en"]
        || [pLang isEqualToString:@"ja"]) {
        localizedStr = NSLocalizedString(key, nil);
    } else {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"en"
                                                         ofType:@"lproj"];
        NSBundle *languageBundle = [NSBundle bundleWithPath:path];
        
        localizedStr = [languageBundle localizedStringForKey:key
                                                       value:@""
                                                       table:nil];
    }
    
    return localizedStr;
}

@end