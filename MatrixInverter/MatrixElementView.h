extern NSString *const MatrixElementInputChanged;

@protocol MatrixElementInputChangeObserver
- (void)inputChanged;

@end


@protocol MatrixElementView

- (NSString *)displayValue;

- (void)addInputChangeObserver:(id <MatrixElementInputChangeObserver>)observer;

@end