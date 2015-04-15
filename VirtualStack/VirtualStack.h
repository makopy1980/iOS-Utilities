//
//  VirtualStack.h
//

#import <Foundation/Foundation.h>

@interface VirtualStack : NSObject {
    
    NSMutableArray *stack;
}

@property (readonly) NSUInteger count;

#pragma mark - Handle Stack Structure
- (void)push:(id)anObject;
- (id)pop;

@end
