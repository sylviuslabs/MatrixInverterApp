#import <Objection/Objection.h>
#import "SquareMatrixPresenter.h"

@interface SquareMatrixPresenter ()
@property id <SquareMatrix> model;
@property id <SquareMatrixView> view;
@end

@implementation SquareMatrixPresenter

objection_requires_sel(@selector(model), @selector(view));

- (void)awakeFromObjection {
    [[self model] addSizeChangeObserver:self];
}

- (void)matrixSizeChanged {
    [[self view] changeToSize:[[self model] matrixSize]];
}

@end