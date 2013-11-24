#import "SLTestingKit.h"
#import "SquareMatrix.h"
#import "SquareMatrixView.h"
#import "SquareMatrixPresenter.h"

SPEC_BEGIN(SquareMatrixPresenterSpec)

        describe(@"square matrix presenter", ^{

            __block id <SquareMatrix> model;
            __block id <SquareMatrixView> view;
            __block SquareMatrixPresenter *presenter;

            beforeEach(^{
                model = mockProtocol(@protocol(SquareMatrix));
                view = mockProtocol(@protocol(SquareMatrixView));
                presenter = [[SquareMatrixPresenter alloc] initWithModel:model andView:view];
            });

            it(@"should observe the square matrix for changes in size", ^{
                [verify(model) addSizeChangeObserver:presenter];
            });

            it(@"should set the view size to 3 when the matrix size is 3", ^{
                [given([model matrixSize]) willReturnInt:3];
                [presenter matrixSizeChanged];
                [verify(view) changeToSize:3];
            });

            it(@"should set the view size to 8 when the matrix size is 8", ^{
                [given([model matrixSize]) willReturnInt:8];
                [presenter matrixSizeChanged];
                [verify(view) changeToSize:8];
            });

        });

        SPEC_END
