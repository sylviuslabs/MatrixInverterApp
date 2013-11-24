@protocol SquareMatrixSizeChangeObserver
- (void)matrixSizeChanged;
@end

@protocol SquareMatrix

- (int)matrixSize;

- (void)setMatrixSize:(int)newSize;

- (void)addSizeChangeObserver:(id <SquareMatrixSizeChangeObserver>)observer;

@end

@interface SquareMatrix : NSObject <SquareMatrix>

@end
