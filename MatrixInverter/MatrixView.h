#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MatrixRow) {
    MatrixRowOne,
    MatrixRowTwo,
    MatrixRowThree
};

typedef NS_ENUM(NSInteger, MatrixColumn) {
    MatrixColumnOne,
    MatrixColumnTwo,
    MatrixColumnThree
};

@protocol MatrixView

-(UITextField *) getTextFieldForRow:(MatrixRow) row andColumn:(MatrixColumn) column;

@end