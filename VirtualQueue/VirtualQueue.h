//
//  VirtualQueue.h
//

#import <Foundation/Foundation.h>

@interface VirtualQueue : NSObject {
    
    NSMutableArray *queue;
}

@property (readonly) NSUInteger count;

#pragma mark - Handle Queue Structure
- (void)enqueue:(id)anObject;
- (id)dequeue;

@end
