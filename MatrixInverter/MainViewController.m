#import <Objection/Objection.h>
#import "MainViewController.h"
#import "SquareMatrixPresenter.h"

@interface MainViewController ()

@property(weak, nonatomic) IBOutlet SquareMatrixView *inputMatrixView;
@property JSObjectFactory *objectFactory;
@end

@implementation MainViewController

objection_requires_sel(@selector(objectFactory))

- (void)viewDidLoad {
    [[self inputMatrixView] changeToMatrixSize:3];
}

@end
