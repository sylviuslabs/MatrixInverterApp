#import "MatrixInverterModule.h"
#import "SquareMatrix.h"
#import "SquareMatrixView.h"


@implementation MatrixInverterModule

- (void)configure {
    [self bindClass:[SquareMatrix class] toProtocol:@protocol(SquareMatrix)];
    [self bindClass:[SquareMatrixView class] toProtocol:@protocol(SquareMatrixView)];
}
@end
