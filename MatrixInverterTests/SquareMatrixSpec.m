#import "SLTestingKit.h"
#import "SquareMatrix.h"

@interface SizeCheckingChangeObserver : NSObject <SquareMatrixSizeChangeObserver> {
    int _expectedSize;
    SquareMatrix *_matrix;
}
@end

@implementation SizeCheckingChangeObserver

- (instancetype)initWithExpectedSize:(int)expectedSize ofMatrix:(SquareMatrix *)matrix {
    _expectedSize = expectedSize;
    _matrix = matrix;
    return self;
}

- (void)matrixSizeChanged {
    assertThatInt([_matrix matrixSize], equalToInt(_expectedSize));
}

@end

SPEC_BEGIN(SquareMatrixSpec)

        describe(@"square matrix", ^{

            __block SquareMatrix *matrix;

            beforeEach(^{
                matrix = [[SquareMatrix alloc] init];
            });

            it(@"should implement the SquareMatrix protocoal", ^{
                assertThat(matrix, conformsTo(@protocol(SquareMatrix)));
            });

            it(@"should be able to set its size to 3", ^{
                [matrix setMatrixSize:3];
                assertThatInt([matrix matrixSize], equalToInt(3));
            });

            it(@"should be able to set its size to 2", ^{
                [matrix setMatrixSize:2];
                assertThatInt([matrix matrixSize], equalToInt(2));
            });

            it(@"should be able to set its size to 5", ^{
                [matrix setMatrixSize:5];
                assertThatInt([matrix matrixSize], equalToInt(5));
            });

            it(@"should notify observers when its size changes", ^{
                id <SquareMatrixSizeChangeObserver> const observer1 = mockProtocol(@protocol
                        (SquareMatrixSizeChangeObserver));
                id <SquareMatrixSizeChangeObserver> const observer2 = mockProtocol(@protocol
                        (SquareMatrixSizeChangeObserver));
                [matrix addSizeChangeObserver:observer1];
                [matrix addSizeChangeObserver:observer2];

                [matrix setMatrixSize:6];
                [verify(observer1) matrixSizeChanged];
                [verify(observer2) matrixSizeChanged];
            });

            it(@"should set the new size before notifying observers", ^{
                id <SquareMatrixSizeChangeObserver> observer = [[SizeCheckingChangeObserver alloc]
                        initWithExpectedSize:5 ofMatrix:matrix];
                [matrix addSizeChangeObserver:observer];
                [matrix setMatrixSize:5];
            });

        });

        SPEC_END




