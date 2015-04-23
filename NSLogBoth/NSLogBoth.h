//
//  NSLogBoth.h
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <pthread.h>

@interface NSLogBoth : NSObject

////////// Debug Log Macros //////////

#ifdef DEBUG
#define LOG(...)                NSLogCF(__VA_ARGS__)
#define LOG_METHOD              NSLogCF(@"%s", __PRETTY_FUNCTION__)
#define LOG_METHOD_S            NSLogCF(@"Start%s", __PRETTY_FUNCTION__)
#define LOG_METHOD_E            NSLogCF(@"End%s", __PRETTY_FUNCTION__)
#define LOG_METHOD_AND_ABORT    LOG_METHOD; abort()
#else
#define LOG(...)
#define LOG_METHOD
#define LOG_METHOD_S
#define LOG_METHOD_E
#define LOG_METHOD_AND_ABORT
#endif

#ifdef DEBUG
#define LOG_POINT(p)            NSLogCF(@"%@", CGPointCreateDictionaryRepresentation(p))
#define LOG_SIZE(s)             NSLogCF(@"%@", CGSizeCreateDictionaryRepresentation(s))
#define LOG_RECT(r)             NSLogCF(@"%@", CGRectCreateDictionaryRepresentation(r))
#define LOG_POINT_VIEW(v)       LOG_POINT(v.frame.origin)
#define LOG_SIZE_VIEW(v)        LOG_SIZE(v.frame.size)
#define LOG_RECT_VIEW(v)        LOG_RECT(v.frame)
#else
#define LOG_POINT(p)
#define LOG_SIZE(s)
#define LOG_RECT(r)
#define LOG_POINT_VIEW(v)
#define LOG_SIZE_VIEW(v)
#define LOG_RECT_VIEW(v)
#endif

#ifndef DEBUG
#define NSLog(...)
//#define NSLogCF(...)
#endif

//////////////////////////////////////

void NSLogCF(NSString *format, ...);

@end
