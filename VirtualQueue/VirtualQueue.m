//
//  VirtualQueue.m
//

#import "VirtualQueue.h"

@implementation VirtualQueue

#pragma mark - Initialize

- (id)init {
    
    self = [super init];
    
    if (self) {
        [self initQueueIfNeeded];
    }
    
    return self;
}

- (void)initQueueIfNeeded {
    
    if (queue == nil) {
        queue = [[NSMutableArray alloc] init];
        _count = 0;
    }
}

#pragma mark - Handle Queue Structure

- (void)enqueue:(id)anObject {
    
    @synchronized(queue) {
        if (anObject != nil) {
            [queue addObject:anObject];
        }
        _count = [queue count];
    }   // @synchronized(queue)
}

- (id)dequeue {
    
    id headObject;
     @synchronized(queue) {
         if ([queue count] == 0) {
             _count = 0;
             return nil;
         }
         
         headObject = [queue objectAtIndex:0];
         
         if (headObject != nil) {
             [queue removeObjectAtIndex:0];
         }
         
         _count = [queue count];
     }  //@synchronized(queue)
    
    return headObject;
}

#pragma mark - Description

- (NSString *)debugDescription {
    
    NSMutableString *description = [[NSMutableString alloc] init];
    [description appendString:@"\n===== Queue description =====\n"];
    
    if (queue == nil) {
        [description appendString:@"Queue is nil...\n"];
    } else if ([queue count] == 0) {
        [description appendString:@"Queue is empty...\n"];
    } else {
        [description appendFormat:@"Count:%ld\n", [queue count]];
        
        int queueCnt = (int)[queue count];
        
        for (int i = 0; i < queueCnt; i++) {
            id obj = [queue objectAtIndex:i];
            [description appendFormat:@"%@\n", [obj description]];
        }
    }
    
    return [description copy];
}

@end
