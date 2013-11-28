#import "SLTestingKit.h"
#import "MainViewController.h"
#import "SquareMatrixPresenter.h"

SPEC_BEGIN(MainViewControllerSpec)

        usingDependencyInjection(^{

            describe(@"Main view controller", ^{

                __block JSObjectFactory *objectFactory;
                __block MainViewController *mainViewController;
                beforeEach(^{
                    mainViewController = [[MainViewController alloc] initWithNibName:nil
                                                                              bundle:nil];
                    [mainViewController view];
                });

                it(@"should be a view controller", ^{
                    assertThat(mainViewController, instanceOf([UIViewController class]));
                });

                it(@"should have a square matrix view for input", ^{
                    NSArray *const squareMatrixViews = getSubviewsOfType([SquareMatrixView class], [mainViewController view]);
                    assertThat(squareMatrixViews, hasCountOf(1));
                });

                it(@"should set the inital square matrix size to three", ^{
                    NSArray *const squareMatrixViews = getSubviewsOfType([SquareMatrixView class], [mainViewController view]);
                    assertThat([squareMatrixViews[0] subviews], hasCountOf(9));
                });

            });

        });

        SPEC_END
