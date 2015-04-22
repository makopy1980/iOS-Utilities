//
//  UIViewController+Belong.m
//

#import "UIViewController+Belong.h"

@implementation UIViewController (Belong)

- (BOOL)isBelongingToNavigation {
    
    if ([self navigationController]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isBelongingToTab {
    
    if ([self tabBarController]) {
        return YES;
    } else {
        return NO;
    }
}

@end
