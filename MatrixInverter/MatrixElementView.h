@protocol MatrixElementInputChangeObserver

- (void)inputChanged;

@end

@protocol MatrixElementView

- (NSString *)displayValue;

- (void)addInputChangeObserver:(id <MatrixElementInputChangeObserver>)observer;

- (void)removeInputChangeObserver:(id <MatrixElementInputChangeObserver>)observer;

@end
