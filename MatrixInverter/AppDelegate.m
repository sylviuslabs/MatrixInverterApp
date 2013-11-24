#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *const window = [self buildWindow];

    MainViewController *const mainViewController = [[MainViewController alloc] init];
    [window setRootViewController:mainViewController];

    [self setWindow:window];
    return YES;
}

- (UIWindow * const)buildWindow {
    const struct CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    UIWindow *const window = [[UIWindow alloc] initWithFrame:mainScreenBounds];
    return window;
}

@end
