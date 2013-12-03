#import "MatrixCell.h"

@interface MatrixCell ()

@property NSMutableArray *observers;
@end

@implementation MatrixCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setObservers:[[NSMutableArray alloc] init]];
        [self addTarget:self action:@selector(editingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
    }
    return self;
}

- (NSString *)displayValue {
    return [self text];
}

- (void)editingDidEnd {
    [[self observers] makeObjectsPerformSelector:@selector(inputChanged)];
}

- (void)addInputChangeObserver:(id <MatrixElementInputChangeObserver>)observer {
    [[self observers] addObject:observer];
}

- (void)removeInputChangeObserver:(id <MatrixElementInputChangeObserver>)observer {
    [[self observers] removeObject:observer];
}

@end
