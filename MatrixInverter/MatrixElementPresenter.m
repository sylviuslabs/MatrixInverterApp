#import "MatrixElementPresenter.h"


@implementation MatrixElementPresenter {
    id <MatrixElement> _model;
    id <MatrixElementView> _view;
}
- (instancetype)initWithModel:(id <MatrixElement>)model andView:(id <MatrixElementView>)view {
    self = [super init];
    _model = model;
    _view = view;

    [_view addInputChangeObserver:self];

    return self;
}

- (void)inputChanged {
    const NSInteger value = [[_view displayValue] integerValue];
    [_model setNumericValue:[NSNumber numberWithInt:value]];
}

@end