#import "SLTestingKit.h"
#import "MatrixElement.h"
#import "MatrixElementView.h"
#import "MatrixElementPresenter.h"

SPEC_BEGIN(MatrixElementPresenterSpec)

        describe(@"Matrix element presenter", ^{

            __block id <MatrixElement> model;
            __block id <MatrixElementView> view;
            __block MatrixElementPresenter *presenter;

            beforeEach(^{
                model = mockProtocol(@protocol(MatrixElement));
                view = mockProtocol(@protocol(MatrixElementView));
                presenter = [[MatrixElementPresenter alloc] initWithModel:model andView:view];
            });

            it(@"should observe the input text for changes", ^{
                [verify(view) addInputChangeObserver:presenter];
            });

            it(@"should update matrix element value to 62 when user types 62", ^{
                [given([view displayValue]) willReturn:@"62"];
                [presenter inputChanged];
                [verify(model) setNumericValue:equalTo([NSNumber numberWithInt:62])];
            });

            it(@"should update matrix element value to 8347 when user types 8347", ^{
                [given([view displayValue]) willReturn:@"8347"];
                [presenter inputChanged];
                [verify(model) setNumericValue:equalTo([NSNumber numberWithInt:8347])];
            });
        });


        SPEC_END
