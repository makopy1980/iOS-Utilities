//
//  UncaughtExceptionHandler.h
//

/*
    Include this header, and set handler in AppDelegate.
 
    [Usage]
    (in AppDelegate.m - didFinshLaunchingWithOption)
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
 */

#import <Foundation/Foundation.h>

@interface UncaughtExceptionHandler : NSObject

void uncaughtExceptionHandler(NSException *exception);

@end
