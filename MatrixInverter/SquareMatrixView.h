#import <UIKit/UIKit.h>

@protocol SquareMatrixView

- (void)changeToSize:(int)newSize;
@end

@interface SquareMatrixView : UIView <SquareMatrixView>

@end
