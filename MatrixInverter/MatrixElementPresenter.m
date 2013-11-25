#import <Objection/Objection.h>
#import "MatrixElementPresenter.h"

@interface MatrixElementPresenter ()

@property id <MatrixElement> model;
@property id <MatrixElementView> view;
@end

@implementation MatrixElementPresenter

objection_initializer(initWithModel:view:)

- (instancetype)initWithModel:(id <MatrixElement>)model view:(id <MatrixElementView>)view {
    self = [super init];
    if (self) {
        [self setModel:model];
        [self setView:view];
    }

    return self;
}

- (void)awakeFromObjection {
    [[self view] addInputChangeObserver:self];
}

- (void)inputChanged {
    const NSInteger value = [[[self view] displayValue] integerValue];
    [[self model] setNumericValue:[NSNumber numberWithInt:value]];
}

@end
