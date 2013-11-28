#import "SquareMatrixView.h"

@implementation SquareMatrixView

- (void)changeToSize:(int)newSize {

    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];

    const struct CGSize boundsSize = [self bounds].size;
    CGFloat fieldWidth = boundsSize.width / newSize;
    CGFloat fieldHeight = boundsSize.height / newSize;

    for (int row = 0; row < newSize; row++) {
        for (int column = 0; column < newSize; column++) {
            UITextField *const newField = [[UITextField alloc] init];
            [newField setFrame:CGRectMake(column * fieldWidth, row * fieldHeight, fieldWidth, fieldHeight)];
            [newField setBorderStyle:UITextBorderStyleLine];
            [[newField layer] setBorderColor:[[UIColor yellowColor] CGColor]];
            [[newField layer] setBorderWidth:2.0];
            [newField setKeyboardType:UIKeyboardTypeDecimalPad];
            [self addSubview:newField];
        }
    }
}

@end
