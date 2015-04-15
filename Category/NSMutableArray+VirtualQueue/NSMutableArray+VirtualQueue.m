//
//  NSMutableArray+VirtualQueue.m
//

#import "NSMutableArray+VirtualQueue.h"

@implementation NSMutableArray (VirtualQueue)

- (id)dequeue {
    
    id headObject = [self objectAtIndex:0];
    
    if (headObject != nil) {
        
        [self removeObjectAtIndex:0];
    }
    
    return headObject;
}

- (void)enqueue:(id)anObject {
    
    if (anObject != nil) {
        [self addObject:anObject];
    }
}

@end
