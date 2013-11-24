@protocol MatrixElement

- (void)setNumericValue:(NSNumber *)number;

@end

@interface MatrixElement : NSObject <MatrixElement>

- (NSNumber *)numericValue;

@end
