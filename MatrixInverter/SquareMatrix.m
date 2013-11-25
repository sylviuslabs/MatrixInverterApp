#import "SquareMatrix.h"

@interface SquareMatrix () {
    NSMutableArray *_observers;
}

@end

@implementation SquareMatrix {
    int _size;
}

- (instancetype)init {
    self = [super init];
    _observers = [[NSMutableArray alloc] init];
    _size = 3;
    return self;
}

- (void)setMatrixSize:(int)newSize {
    _size = newSize;
    for (id <SquareMatrixSizeChangeObserver> observer in _observers) {
        [observer matrixSizeChanged];
    }
}

- (int)matrixSize {
    return _size;
}

- (void)addSizeChangeObserver:(id <SquareMatrixSizeChangeObserver>)observer {
    [_observers addObject:observer];

}

@end
