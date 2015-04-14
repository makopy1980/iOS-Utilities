//
//  NSMutableArray+VirtualStack.h
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (VirtualStack)

- (id)pop;
- (void)push:(id)anObject;

@end
