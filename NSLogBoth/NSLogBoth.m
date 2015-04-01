//
//  NSLogBoth.m
//

#import "NSLogBoth.h"

#define LOGFILE_PREFIX          @"log_"
#define LOGFILE_EXTENSION       @".txt"
#define LOGFILE_EXPIRATION_DAY  3

@implementation NSLogBoth

void NSLogCF(NSString *format, ...) {
    
    NSString *iOSVerStr = [[UIDevice currentDevice] systemVersion];
    NSArray *verArray = [iOSVerStr componentsSeparatedByString:@"."];
    int iOSVer = [[verArray objectAtIndex:0] intValue];
    
    NSString *calendarId;
    
    if (iOSVer < 8) {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        calendarId = NSGregorianCalendar;
#pragma clang diagnostic pop
        
    } else {
        calendarId = NSCalendarIdentifierGregorian;
    }
    
    NSCalendar *fmtCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:calendarId];
    NSLocale *fmtLocation = [NSLocale currentLocale];
    
    // Formatter for file name
    NSDateFormatter *fileNameDateFormatter = [[NSDateFormatter alloc] init];
    [fileNameDateFormatter setCalendar:fmtCalendar];
    [fileNameDateFormatter setLocale:fmtLocation];
    [fileNameDateFormatter setDateFormat:@"yyyyMMdd"];
    
    // Formatter for log date
    NSDateFormatter *logDateFormatter = [[NSDateFormatter alloc] init];
    [logDateFormatter setCalendar:fmtCalendar];
    [logDateFormatter setLocale:fmtLocation];
    [logDateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss.SSS"];
    
    NSDate *now = [NSDate dateWithTimeIntervalSinceNow:
                   [[NSTimeZone systemTimeZone] secondsFromGMT]];
    
    NSString *fileNameDate = [fileNameDateFormatter stringFromDate:now];
    NSString *logDate = [logDateFormatter stringFromDate:now];
    
    // FilePath
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask,
                                                         YES);
    
    NSFileManager *fileManager  = [NSFileManager defaultManager];
    NSString *filename = [NSString stringWithFormat:@"%@%@%@",
                          LOGFILE_PREFIX, fileNameDate, LOGFILE_EXTENSION];
    
    NSString *docRootDir = [paths objectAtIndex:0];
    NSString *logDir = [docRootDir stringByAppendingString:@"/logFiles"];
    if (![fileManager fileExistsAtPath:logDir]) {
        [fileManager createDirectoryAtPath:logDir
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    }
    
    // Remove old files
    NSError *error;
    NSArray *files = [fileManager contentsOfDirectoryAtPath:logDir
                                                      error:&error];
    
    if (!error) {
        
        for (NSString *file in files) {
            
            NSString *dateStr = [file substringWithRange:NSMakeRange([LOGFILE_PREFIX length], [fileNameDate length])];
            NSDate *tmpDate = [fileNameDateFormatter dateFromString:dateStr];
            NSTimeInterval since = [now timeIntervalSinceDate:tmpDate];
            
            if((int)((int)since / (60*60*24)) > LOGFILE_EXPIRATION_DAY ){
                
                NSError *error;
                [fileManager removeItemAtPath:[NSString stringWithFormat:@"%@/%@",logDir,file]
                                        error:&error];
            }
        }
    }
    
    // Open file
    static FILE *file;
    NSString *path = [logDir stringByAppendingPathComponent:filename];
    file = fopen([path cStringUsingEncoding:NSASCIIStringEncoding], "a+");
    
    va_list args;
    va_start(args, format);
    
    // Create log content
    NSString *logContent = [[NSString alloc] initWithFormat:format
                                                  arguments:args];
    
    // To console(Stderr)
    NSLog(@"%@", logContent);
    
    // Process ID
    NSProcessInfo *processInfo = [NSProcessInfo processInfo];
    int processID = [processInfo processIdentifier];
    // Thread ID
    mach_port_t mach = pthread_mach_thread_np(pthread_self());
    
    // Format Like NSLog
    NSString *logLine = [NSString stringWithFormat:@"%@ [%d:%x] %@\n", logDate, processID, mach, logContent];
    
    fputs([logLine cStringUsingEncoding:NSUTF8StringEncoding],file);
    fflush(file);
    
    va_end(args);
}

@end
