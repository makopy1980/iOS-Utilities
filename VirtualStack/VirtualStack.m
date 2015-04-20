//
//  VirtualStack.m
//

#import "VirtualStack.h"

@implementation VirtualStack

#pragma mark - Initialize

- (id)init {
    
    self = [super init];
    
    if (self) {
        [self initStackIfNeeded];
    }
    
    return self;
}

- (void)initStackIfNeeded {
    
    if (stack == nil) {
        stack = [[NSMutableArray alloc] init];
        _count = 0;
    }
}

#pragma mark - Handle Stack Structure

- (void)push:(id)anObject {
    
    @synchronized(stack) {
        if (anObject != nil) {
            [stack addObject:anObject];
        }
        _count = [stack count];
    }   // @synchronized(stack)
}

- (id)pop {
    
    id lastObject;
    
    @synchronized(stack) {
        if (stack == nil) {
            _count = 0;
            return nil;
        }
        
        lastObject = [stack lastObject];
        
        if (lastObject != nil) {
            [stack removeLastObject];
        }
        
        _count = [stack count];
    }   // @synchronized(stack)
    
    return lastObject;
}

#pragma mark - debugDescription

- (NSString *)debugDescription {
    
    NSMutableString *description = [[NSMutableString alloc] init];
    [description appendString:@"\n===== Stack description =====\n"];
    
    if (stack == nil) {
        [description appendString:@"Stack is nil...\n"];
    } else if ([stack count] == 0) {
        [description appendString:@"Stack is empty...\n"];
    } else {
        [description appendFormat:@"Count:%ld\n", [stack count]];
        
        int stackCnt = (int)[stack count];
        for (int i = stackCnt-1; i >= 0; i--) {
            id obj = [stack objectAtIndex:i];
            [description appendFormat:@"%@\n", [obj description]];
        }
    }
    
    return [description copy];
}

@end
