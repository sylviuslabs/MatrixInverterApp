#import "CALayer+XibConfiguration.h"


@implementation CALayer (XibConfiguration)

- (void)setBorderUIColor:(UIColor *)color {
    [self setBorderColor:[color CGColor]];
}

- (UIColor *)borderUIColor {
    return [UIColor colorWithCGColor:[self borderColor]];
}

@end
