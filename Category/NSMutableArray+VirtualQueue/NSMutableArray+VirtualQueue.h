//
//  NSMutableArray+VirtualQueue.h
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (VirtualQueue)

- (id)dequeue;
- (void)enqueue:(id)anObject;

@end
