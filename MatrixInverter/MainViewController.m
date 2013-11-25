#import <Objection/Objection.h>
#import "MainViewController.h"
#import "SquareMatrixPresenter.h"


@interface MainViewController ()

@property JSObjectFactory *objectFactory;
@end

@implementation MainViewController

objection_requires_sel(@selector(objectFactory))

- (void)viewDidLoad {
    [super viewDidLoad];

    [[self objectFactory] getObject:[SquareMatrixPresenter class]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
