#import <UIKit/UIKit.h>
#import "SLTestingKit.h"
#import "SquareMatrixView.h"

static NSArray *getTextFieldSubviewsOf(UIView *view);

static NSValue *getOriginOf(UIView *view);

static NSValue *makePoint(CGFloat x, CGFloat y);

SPEC_BEGIN(SquareMatrixViewSpec)

        describe(@"square matrix view", ^{

            __block SquareMatrixView *view;
            beforeEach(^{
                view = [[SquareMatrixView alloc] init];
            });

            it(@"should be a UIView", ^{
                assertThat(view, instanceOf([UIView class]));
            });

            it(@"should implement the SquareMatrixView protocol", ^{
                assertThat(view, conformsTo(@protocol(SquareMatrixView)));
            });

            it(@"should have 9 text fields after changing to size 3", ^{
                [view changeToMatrixSize:3];
                NSArray *const textFields = getTextFieldSubviewsOf(view);
                assertThat(textFields, hasCountOf(9));
            });

            it(@"should have 25 text fields after changing to size 5", ^{
                [view changeToMatrixSize:5];
                NSArray *const textFields = getTextFieldSubviewsOf(view);
                assertThat(textFields, hasCountOf(25));
            });

            it(@"should set the size of each text field so they fill the view's bounds", ^{
                [view setBounds:CGRectMake(0, 0, 120, 90)];
                NSValue *const expectedSize = [NSValue valueWithCGSize:CGSizeMake(40, 30)];
                [view changeToMatrixSize:3];
                NSArray *const textFields = getTextFieldSubviewsOf(view);
                for (UITextField *textField in textFields) {
                    NSValue *const actualSize = [NSValue valueWithCGSize:[textField frame].size];
                    assertThat(actualSize, equalTo(expectedSize));
                }

            });

            it(@"should place the fields correctly in the view when size is 3x3", ^{
                [view setBounds:CGRectMake(0, 0, 150, 300)];
                [view changeToMatrixSize:3];
                NSArray *const textFields = getTextFieldSubviewsOf(view);
                assertThat(getOriginOf(textFields[0]), equalTo(makePoint(0, 0)));
                assertThat(getOriginOf(textFields[1]), equalTo(makePoint(50, 0)));
                assertThat(getOriginOf(textFields[2]), equalTo(makePoint(100, 0)));
                assertThat(getOriginOf(textFields[3]), equalTo(makePoint(0, 100)));
                assertThat(getOriginOf(textFields[4]), equalTo(makePoint(50, 100)));
                assertThat(getOriginOf(textFields[5]), equalTo(makePoint(100, 100)));
                assertThat(getOriginOf(textFields[6]), equalTo(makePoint(0, 200)));
                assertThat(getOriginOf(textFields[7]), equalTo(makePoint(50, 200)));
                assertThat(getOriginOf(textFields[8]), equalTo(makePoint(100, 200)));
            });

            it(@"should place the fields correctly in the view when size is 2x2", ^{
                [view setBounds:CGRectMake(0, 0, 32, 10)];
                [view changeToMatrixSize:2];
                NSArray *const textFields = getTextFieldSubviewsOf(view);
                assertThat(getOriginOf(textFields[0]), equalTo(makePoint(0, 0)));
                assertThat(getOriginOf(textFields[1]), equalTo(makePoint(16, 0)));
                assertThat(getOriginOf(textFields[2]), equalTo(makePoint(0, 5)));
                assertThat(getOriginOf(textFields[3]), equalTo(makePoint(16, 5)));
            });

            it(@"should clear old views when changing to different size", ^{
                [view changeToMatrixSize:6];
                [view changeToMatrixSize:3];

                NSArray *const textFields = getTextFieldSubviewsOf(view);
                assertThat(textFields, hasCountOf(9));
            });

        });

        SPEC_END

static NSArray *getTextFieldSubviewsOf(UIView *view) {
    return getSubviewsOfType([UITextField class], view);
}

static NSValue *getOriginOf(UIView *view) {
    return [NSValue valueWithCGPoint:[view frame].origin];
}

static NSValue *makePoint(CGFloat x, CGFloat y) {
    return [NSValue valueWithCGPoint:CGPointMake(x, y)];
}


