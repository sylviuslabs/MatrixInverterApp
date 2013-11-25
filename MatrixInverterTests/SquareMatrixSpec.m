#import "SLTestingKit.h"
#import "SquareMatrix.h"

SPEC_BEGIN(SquareMatrixSpec)

        describe(@"square matrix", ^{

            __block SquareMatrix *matrix;

            beforeEach(^{
                matrix = [[SquareMatrix alloc] init];
            });

            it(@"should implement the SquareMatrix protocol", ^{
                assertThat(matrix, conformsTo(@protocol(SquareMatrix)));
            });

            it(@"should have default size of 3", ^{
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
                [matrix setMatrixSize:8];
                id const observer = [KWMock mockForProtocol:@protocol(SquareMatrixSizeChangeObserver)];
                [observer stub:@selector(matrixSizeChanged) withBlock:^id(NSArray *params) {
                    assertThatInt([matrix matrixSize], equalToInt(5));
                    return nil;
                }];
                [matrix addSizeChangeObserver:observer];
                [matrix setMatrixSize:5];
            });

        });

        SPEC_END




