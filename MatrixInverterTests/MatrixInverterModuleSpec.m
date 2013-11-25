#import "SLTestingKit.h"
#import "MatrixInverterModule.h"
#import "SquareMatrix.h"
#import "SquareMatrixView.h"

SPEC_BEGIN(MatrixInverterModuleSpec)

        describe(@"dependency injection module", ^{

            __block MatrixInverterModule *module;
            __block JSObjectionInjector *injector;
            beforeEach(^{
                module = [[MatrixInverterModule alloc] init];
                injector = [JSObjection createInjector:module];
            });

            it(@"should be an instance of JSObjectionModule", ^{
                assertThat(module, instanceOf([JSObjectionModule class]));
            });

            it(@"should bind the SquareMatrix protocol to the SquareMatrix class", ^{
                assertThat([injector getObject:@protocol(SquareMatrix)], instanceOf([SquareMatrix class]));
            });

            it(@"should bind the SquareMatrixView protocol to the SquareMatrixView class", ^{
                assertThat([injector getObject:@protocol(SquareMatrixView)], instanceOf([SquareMatrixView class]));
            });

        });

        SPEC_END
