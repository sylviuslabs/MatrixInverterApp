#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    const struct CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    UIWindow *const window = [[UIWindow alloc] initWithFrame:mainScreenBounds];
    [self setWindow:window];
    return YES;
}

@end
