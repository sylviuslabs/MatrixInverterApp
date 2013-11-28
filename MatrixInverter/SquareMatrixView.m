#import "SquareMatrixView.h"

@implementation SquareMatrixView

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [[self layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[self layer] setBorderWidth:2.0];
}

- (void)changeToMatrixSize:(int)newSize {
    [self removeAllSubviews];

    const struct CGSize boundsSize = [self bounds].size;
    const struct CGSize fieldSize = CGSizeMake(boundsSize.width / newSize, boundsSize.height / newSize);

    for (int row = 0; row < newSize; row++) {
        for (int column = 0; column < newSize; column++) {
            UITextField *const newField = [self makeFieldForRow:row column:column withSize:fieldSize];
            [self addSubview:newField];
        }
    }
}

- (void)removeAllSubviews {
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (UITextField * const)makeFieldForRow:(int)row column:(int)column withSize:(struct CGSize const)fieldSize {
    UITextField *const newField = [[UITextField alloc] init];
    [newField setFrame:CGRectMake(column * fieldSize.width, row * fieldSize.height, fieldSize.width, fieldSize.height)];
    [newField setBorderStyle:UITextBorderStyleLine];
    [[newField layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[newField layer] setBorderWidth:1.0];
    [newField setKeyboardType:UIKeyboardTypeNumberPad];
    [newField setTextAlignment:NSTextAlignmentCenter];
    return newField;
}

@end
