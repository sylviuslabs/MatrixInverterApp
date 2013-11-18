#import "MatrixViewController.h"

@implementation MatrixViewController {

    __weak IBOutlet UITextField *textFieldA;
    __weak IBOutlet UITextField *textFieldB;
    __weak IBOutlet UITextField *textFieldC;
    __weak IBOutlet UITextField *textFieldD;
    __weak IBOutlet UITextField *textFieldE;
    __weak IBOutlet UITextField *textFieldF;
    __weak IBOutlet UITextField *textFieldG;
    __weak IBOutlet UITextField *textFieldH;
    __weak IBOutlet UITextField *textFieldI;

    UITextField *_textFields[3][3];

}

- (void)viewDidLoad {
    _textFields[MatrixRowOne][MatrixColumnOne] = textFieldA;
    _textFields[MatrixRowOne][MatrixColumnTwo] = textFieldB;
    _textFields[MatrixRowOne][MatrixColumnThree] = textFieldC;

    _textFields[MatrixRowTwo][MatrixColumnOne] = textFieldD;
    _textFields[MatrixRowTwo][MatrixColumnTwo] = textFieldE;
    _textFields[MatrixRowTwo][MatrixColumnThree] = textFieldF;

    _textFields[MatrixRowThree][MatrixColumnOne] = textFieldG;
    _textFields[MatrixRowThree][MatrixColumnTwo] = textFieldH;
    _textFields[MatrixRowThree][MatrixColumnThree] = textFieldI;
}

- (UITextField *)getTextFieldForRow:(MatrixRow)row andColumn:(MatrixColumn)column {
    return _textFields[row][column];
}

@end
