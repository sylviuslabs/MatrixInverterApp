#import <UIKit/UIKit.h>
#import "SLTestingKit.h"
#import "MatrixView.h"
#import "MatrixViewController.h"

@interface MatrixViewControllerTests : XCTestCase
@end

@implementation MatrixViewControllerTests {
    MatrixViewController *_controller;
}

- (void)setUp {
    _controller = [[MatrixViewController alloc] initWithNibName:nil bundle:nil];
    [_controller view];
}

- (void)tearDown {
    _controller = nil;
}

- (void)testExtendsUIViewController {
    assertThat(_controller, instanceOf([UIViewController class]));
}

- (void)testConformsToMatrixViewProtocol {
    assertThat(_controller, conformsTo(@protocol(MatrixView)));
}

- (void)testHasNineDistinctTextFields {
    NSMutableSet *const setOfTextFields = [[NSMutableSet alloc] init];
    for (MatrixRow row = MatrixRowOne; row <= MatrixRowThree; row++) {
        for (MatrixColumn column = MatrixColumnOne; column <= MatrixColumnThree; column++) {
            [setOfTextFields addObject:[_controller getTextFieldForRow:row andColumn:column]];
        }
    }
    assertThat(setOfTextFields, hasCountOf(9));
}

- (void)testHasTextFieldForRowOneColumnOne {
    assertThat([_controller getTextFieldForRow:MatrixRowOne andColumn:MatrixColumnOne], is(notNilValue()));
}

- (void)testHasTextFieldForRowOneColumnTwo {
    assertThat([_controller getTextFieldForRow:MatrixRowOne andColumn:MatrixColumnTwo], is(notNilValue()));
}

- (void)testHasTextFieldForRowOneColumnThree {
    assertThat([_controller getTextFieldForRow:MatrixRowOne andColumn:MatrixColumnThree], is(notNilValue()));
}

- (void)testHasTextFieldForRowTwoColumnOne {
    assertThat([_controller getTextFieldForRow:MatrixRowTwo andColumn:MatrixColumnOne], is(notNilValue()));
}

- (void)testHasTextFieldForRowTwoColumnTwo {
    assertThat([_controller getTextFieldForRow:MatrixRowTwo andColumn:MatrixColumnTwo], is(notNilValue()));
}

- (void)testHasTextFieldForRowTwoColumnThree {
    assertThat([_controller getTextFieldForRow:MatrixRowTwo andColumn:MatrixColumnThree], is(notNilValue()));
}

- (void)testHasTextFieldForRowThreeColumnOne {
    assertThat([_controller getTextFieldForRow:MatrixRowThree andColumn:MatrixColumnOne], is(notNilValue()));
}

- (void)testHasTextFieldForRowThreeColumnTwo {
    assertThat([_controller getTextFieldForRow:MatrixRowThree andColumn:MatrixColumnTwo], is(notNilValue()));
}

- (void)testHasTextFieldForRowThreeColumnThree {
    assertThat([_controller getTextFieldForRow:MatrixRowThree andColumn:MatrixColumnThree], is(notNilValue()));
}


@end
