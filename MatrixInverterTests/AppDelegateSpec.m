#import "SLTestingKit.h"
#import "AppDelegate.h"

SPEC_BEGIN(AppDelegateSpec)

        describe(@"Application delegate", ^{

            __block AppDelegate *appDelegate;

            beforeEach(^{
                appDelegate = [[AppDelegate alloc] init];
            });

            it(@"shoud conform to UIApplicationDelegate protocol", ^{
                assertThat(appDelegate, conformsTo(@protocol(UIApplicationDelegate)));
            });

            it(@"shoud create a window when launching", ^{
                [appDelegate application:nil didFinishLaunchingWithOptions:nil];
                assertThat([appDelegate window], instanceOf([UIWindow class]));
            });

            it(@"should have a window that fills the bounds of the screen", ^{
                [appDelegate application:nil didFinishLaunchingWithOptions:nil];
                NSValue *const windowFrame = [NSValue valueWithCGRect:[[appDelegate window] frame]];
                NSValue *const mainScreenBounds = [NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]];
                assertThat(windowFrame, equalTo(mainScreenBounds));
            });

        });

        SPEC_END
