#import <Foundation/Foundation.h>

#import "SquareMatrix.h"
#import "SquareMatrixView.h"

@interface SquareMatrixPresenter : NSObject <SquareMatrixSizeChangeObserver>
- (id)initWithModel:(id <SquareMatrix>)model andView:(id <SquareMatrixView>)view;
@end