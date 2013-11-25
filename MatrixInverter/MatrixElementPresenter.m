#import <Objection/Objection.h>
#import "MatrixElementPresenter.h"

@interface MatrixElementPresenter ()

@property id <MatrixElement> model;
@property id <MatrixElementView> view;
@end

@implementation MatrixElementPresenter

objection_requires_sel(@selector(model), @selector(view))

- (void)awakeFromObjection {
    [[self view] addInputChangeObserver:self];
}

- (void)inputChanged {
    const NSInteger value = [[_view displayValue] integerValue];
    [[self model] setNumericValue:[NSNumber numberWithInt:value]];
}

@end
