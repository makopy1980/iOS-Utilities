//
//  NSBundle+Ex.h
//

#import <Foundation/Foundation.h>

#define LSTR(s) [[NSBundle mainBundle] HCLocalizedString:(s)]

@interface NSBundle (Ex)

- (NSString *)HCLocalizedString:(NSString *)key;

@end