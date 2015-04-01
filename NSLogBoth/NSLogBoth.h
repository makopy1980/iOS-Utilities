//
//  NSLogBoth.h
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <pthread.h>

@interface NSLogBoth : NSObject

void NSLogCF(NSString *format, ...);

@end
