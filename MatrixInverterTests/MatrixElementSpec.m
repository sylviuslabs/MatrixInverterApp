#import "SLTestingKit.h"
#import "MatrixElement.h"

SPEC_BEGIN(MatrixElementSpec)

        describe(@"matrix elements", ^{

            __block MatrixElement *element;

            beforeEach(^{
                element = [[MatrixElement alloc] init];
            });

            it(@"should implement the MatrixElement protocol", ^{
                assertThat(element, conformsTo(@protocol(MatrixElement)));
            });

            it(@"should be able to set numeric value to 357", ^{
                [element setNumericValue:[NSNumber numberWithInt:347]];
                assertThat([element numericValue], equalTo([NSNumber numberWithInt:347]));
            });

            it(@"should be able to set numeric value to 12", ^{
                [element setNumericValue:[NSNumber numberWithInt:12]];
                assertThat([element numericValue], equalTo([NSNumber numberWithInt:12]));
            });

        });

        SPEC_END
