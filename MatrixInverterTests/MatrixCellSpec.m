#import "SLTestingKit.h"
#import "MatrixElementView.h"
#import "MatrixCell.h"

SPEC_BEGIN(MatrixCellSpec)


        describe(@"matrix cell", ^{

            __block MatrixCell *matrixCell;

            beforeEach(^{
                matrixCell = [[MatrixCell alloc] init];
            });

            it(@"should implement the MatrixElementView protocol", ^{
                assertThat(matrixCell, conformsTo(@protocol(MatrixElementView)));
            });

            it(@"should be a text field", ^{
                assertThat(matrixCell, instanceOf([UITextField class]));
            });

            it(@"should return the current text as the displayValue", ^{
                [matrixCell setText:@"164"];
                assertThat([matrixCell displayValue], equalTo(@"164"));
            });

            it(@"should notify observers when input text changes", ^{
                id <MatrixElementInputChangeObserver> const observer1 = mockProtocol(@protocol
                        (MatrixElementInputChangeObserver));
                id <MatrixElementInputChangeObserver> const observer2 = mockProtocol(@protocol
                        (MatrixElementInputChangeObserver));
                [matrixCell addInputChangeObserver:observer1];
                [matrixCell addInputChangeObserver:observer2];
                [matrixCell sendActionsForControlEvents:UIControlEventEditingDidEnd];
                [verify(observer1) inputChanged];
                [verify(observer2) inputChanged];
            });

        });

        SPEC_END
