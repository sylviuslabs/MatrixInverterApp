#import <Objection/Objection.h>
#import "MainViewController.h"
#import "SquareMatrixPresenter.h"

@interface MainViewController ()

@property JSObjectFactory *objectFactory;
@end

@implementation MainViewController

objection_requires_sel(@selector(objectFactory))

- (void)loadView {
    [self setView:[[UIView alloc] init]];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    SquareMatrixView *const squareMatrixView = [[SquareMatrixView alloc] init];
//    [squareMatrixView setFrame:CGRectMake(50, 50, 200, 200)];
    [squareMatrixView changeToSize:3];
    [[self view] addSubview:squareMatrixView];
}

@end
