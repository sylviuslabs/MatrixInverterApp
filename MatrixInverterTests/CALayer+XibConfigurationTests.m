#import "SLTestingKit.h"
#import "CALayer+XibConfiguration.h"

@interface CALayerXibConfigurationTests : SLTestCase
@end

@implementation CALayerXibConfigurationTests {
    CALayer *_layer;
}

- (void)setUp {
    _layer = [[CALayer alloc] init];
}

- (void)tearDown {
    _layer = nil;
}

- (void)testSetBorderUIColorSetsBorderColor {
    [_layer setBorderUIColor:[UIColor orangeColor]];
    assertThat([UIColor colorWithCGColor:[_layer borderColor]], equalTo([UIColor orangeColor]));
}

- (void)testGetBorderUIColorGetsBorderColorAsUIColor {
    [_layer setBorderColor:[[UIColor magentaColor] CGColor]];
    assertThat([_layer borderUIColor], equalTo([UIColor magentaColor]));
}

@end
