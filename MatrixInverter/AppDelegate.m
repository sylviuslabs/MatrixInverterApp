#import <Objection/JSObjection.h>
#import <Objection/Objection.h>
#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()
@property(nonatomic, retain) MainViewController *mainViewController;
@end

@implementation AppDelegate

objection_requires_sel(@selector(mainViewController))

- (instancetype)init {
    self = [super init];
    [[JSObjection defaultInjector] injectDependencies:self];
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *const window = [self buildWindow];

    [window setRootViewController:[self mainViewController]];

    [self setWindow:window];
    return YES;
}

- (UIWindow * const)buildWindow {
    const struct CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    UIWindow *const window = [[UIWindow alloc] initWithFrame:mainScreenBounds];
    return window;
}

@end
