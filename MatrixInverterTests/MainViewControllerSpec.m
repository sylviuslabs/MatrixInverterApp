#import "SLTestingKit.h"
#import "MainViewController.h"
#import "SquareMatrixPresenter.h"

SPEC_BEGIN(MainViewControllerSpec)

        usingDependencyInjection(^{

            describe(@"Main view controller", ^{

                __block JSObjectFactory *objectFactory;
                __block MainViewController *mainViewController;
                beforeEach(^{
                    objectFactory = injectMock([JSObjectFactory class]);
                    mainViewController = getObjectWithDependencies([MainViewController class]);
                    [mainViewController viewDidLoad];
                });

                it(@"should create a SquareMatrixPresenter for input", ^{
                    [verify(objectFactory) getObject:[SquareMatrixPresenter class]];
                });

            });

        });

        SPEC_END
