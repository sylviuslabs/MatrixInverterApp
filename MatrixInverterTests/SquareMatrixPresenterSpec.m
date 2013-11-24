#import "SLTestingKit.h"
#import "SquareMatrix.h"
#import "SquareMatrixView.h"
#import "SquareMatrixPresenter.h"

SPEC_BEGIN(SquareMatrixPresenterSpec)

        usingDependencyInjection(^{

            describe(@"square matrix presenter", ^{

                __block id <SquareMatrix> model;
                __block id <SquareMatrixView> view;
                __block SquareMatrixPresenter *presenter;

                beforeEach(^{
                    model = injectMockProtocol(@protocol(SquareMatrix));
                    view = injectMockProtocol(@protocol(SquareMatrixView));
                    presenter = getObjectWithDependencies([SquareMatrixPresenter class]);
                });

                it(@"should observe the square matrix for changes in size", ^{
                    [verify(model) addSizeChangeObserver:presenter];
                });

                it(@"should set the view size to 4 when the matrix size is 4", ^{
                    [given([model matrixSize]) willReturnInt:4];
                    [presenter matrixSizeChanged];
                    [verify(view) changeToSize:4];
                });

                it(@"should set the view size to 8 when the matrix size is 8", ^{
                    [given([model matrixSize]) willReturnInt:8];
                    [presenter matrixSizeChanged];
                    [verify(view) changeToSize:8];
                });





            });
        });

        SPEC_END
