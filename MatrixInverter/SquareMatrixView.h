#import <UIKit/UIKit.h>

@protocol SquareMatrixView

- (void)changeToMatrixSize:(int)newSize;
@end

@interface SquareMatrixView : UIView <SquareMatrixView>

@end
