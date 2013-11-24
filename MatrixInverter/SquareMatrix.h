@protocol SquareMatrixSizeChangeObserver
- (void)matrixSizeChanged;
@end

@protocol SquareMatrix

- (int)matrixSize;

- (void)addSizeChangeObserver:(id <SquareMatrixSizeChangeObserver>)observer;
@end
