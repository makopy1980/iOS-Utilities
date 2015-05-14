//
//  UIView+Constraint.h
//

#import <UIKit/UIKit.h>

@interface UIView (Constraint)

#pragma mark - Constraint
- (NSArray *)addConstraintFill;
- (NSArray *)addConstraintFillWithInsets:(UIEdgeInsets)insets;
- (NSArray *)addConstraintFromTop:(CGFloat)top toBottom:(CGFloat)bottom;
- (NSArray *)addConstraintFromLeft:(CGFloat)left toRight:(CGFloat)right;
- (NSLayoutConstraint *)addConstraintFromTop:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromBottom:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromLeft:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromRight:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintWidth:(CGFloat)width;
- (NSLayoutConstraint *)addConstraintHeight:(CGFloat)height;
- (NSArray *)addConstraintWidth:(CGFloat)width height:(CGFloat)height;
- (NSLayoutConstraint *)addConstraintCenteringX;
- (NSLayoutConstraint *)addConstraintCenteringY;
- (NSArray *)addConstraintCenteringXY;
- (NSLayoutConstraint *)addConstraintCenteringXWithOffset:(CGFloat)offsetX;
- (NSLayoutConstraint *)addConstraintCenteringYWithOffset:(CGFloat)offsetY;
- (NSArray *)addConstraintCenteringXYWithOffset:(UIOffset)offset;
- (NSLayoutConstraint *)addConstraintFromViewTop:(UIView *)fromView distance:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromViewBottom:(UIView *)fromView distance:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromViewLeft:(UIView *)fromView distance:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintFromViewRight:(UIView *)fromView distance:(CGFloat)distance;
- (NSLayoutConstraint *)addConstraintAlignViewTop:(UIView *)baseView offset:(CGFloat)offset;
- (NSLayoutConstraint *)addConstraintAlignViewBottom:(UIView *)baseView offset:(CGFloat)offset;
- (NSLayoutConstraint *)addConstraintAlignViewLeft:(UIView *)baseView offset:(CGFloat)offset;
- (NSLayoutConstraint *)addConstraintAlignViewRight:(UIView *)baseView offset:(CGFloat)offset;
- (void)removeAllConstraints;

@end
