#import "SquareMatrixPresenter.h"


@implementation SquareMatrixPresenter {
    id <SquareMatrix> _model;
    id <SquareMatrixView> _view;
}
- (instancetype)initWithModel:(id <SquareMatrix>)model andView:(id <SquareMatrixView>)view {
    self = [super init];
    _model = model;
    _view = view;

    [_model addSizeChangeObserver:self];

    return self;
}

- (void)matrixSizeChanged {
    [_view changeToSize:[_model matrixSize]];
}

@end