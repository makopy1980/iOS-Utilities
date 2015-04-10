//
//  UncaughtExceptionHandler.m
//

#import "UncaughtExceptionHandler.h"

@implementation UncaughtExceptionHandler

void uncaughtExceptionHandler(NSException *exception)
{
    
    NSString *exceptionOccur = @"\n***** Uncaught exception occured!*****";
    // Name of Exception
    NSString *exceptionName = [NSString stringWithFormat:@"exception name:%@",
                               [exception name]];
    // Reason of Exception
    NSString *exceptionReason = [NSString stringWithFormat:@"exception reason:%@",
                                 [exception reason]];
    // CallStack of Exception
    NSString *exceptionCallStack = [NSString stringWithFormat:@"exception callStackSymbols:\n%@\n",
                                    [exception callStackSymbols]];
    
    NSString *exceptionLog = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n",
                              exceptionOccur, exceptionName, exceptionReason, exceptionCallStack];
    
    NSString *exceptionLogDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,
                                                                     NSUserDomainMask, YES)
                                 objectAtIndex:0];
    
    NSString *exceptionLogPath = [exceptionLogDir
                                  stringByAppendingPathComponent:@"uncaughtException.log"];
    
    NSError *error = nil;
    
    // Write to file.
    [exceptionLog writeToFile:exceptionLogPath
                   atomically:NO
                     encoding:NSUTF8StringEncoding
                        error:&error];
    
    if (error) {
#ifdef DEBUG
        NSLog(@"Cannot write exception log file!!");
        NSLog(@"reason->%@", [error description]);
#endif  // DEBUG
    }
}

@end
