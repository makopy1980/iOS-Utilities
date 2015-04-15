//
//  NSMutableArray+VirtualStack.m
//

#import "NSMutableArray+VirtualStack.h"

@implementation NSMutableArray (VirtualStack)

- (id)pop {
    
    id lastObject = [self lastObject];
    
    if (lastObject != nil) {
        [self removeLastObject];
    }
    
    return lastObject;
}

- (void)push:(id)anObject {
    
    if (anObject != nil) {
        [self addObject:anObject];
    }
}


@end
