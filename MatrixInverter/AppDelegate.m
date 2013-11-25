#import <Objection/JSObjection.h>
#import <Objection/Objection.h>
#import "AppDelegate.h"
#import "MainViewController.h"
#import "MatrixInverterModule.h"

@interface AppDelegate ()

@property(nonatomic, retain) MainViewController *mainViewController;
@end

@implementation AppDelegate

objection_requires_sel(@selector(mainViewController))

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeDependencyInjector];
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[JSObjection defaultInjector] injectDependencies:self];
    UIWindow *const window = [self buildWindow];

    [window setRootViewController:[self mainViewController]];
    [window makeKeyAndVisible];

    [self setWindow:window];
    return YES;
}

- (void)initializeDependencyInjector {
    if (![JSObjection defaultInjector]) {
        [JSObjection setDefaultInjector:[JSObjection createInjector:[[MatrixInverterModule alloc] init]]];
    }
}

- (UIWindow * const)buildWindow {
    const struct CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    UIWindow *const window = [[UIWindow alloc] initWithFrame:mainScreenBounds];
    return window;
}

@end
