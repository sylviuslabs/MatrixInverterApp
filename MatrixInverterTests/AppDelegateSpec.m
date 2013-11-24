#import "SLTestingKit.h"
#import "AppDelegate.h"
#import "MainViewController.h"

SPEC_BEGIN(AppDelegateSpec)

        describe(@"Application delegate", ^{

            __block AppDelegate *appDelegate;

            beforeEach(^{
                appDelegate = [[AppDelegate alloc] init];
                [appDelegate application:nil didFinishLaunchingWithOptions:nil];
            });


            it(@"shoud conform to UIApplicationDelegate protocol", ^{
                assertThat(appDelegate, conformsTo(@protocol(UIApplicationDelegate)));
            });

            it(@"shoud create a window when launching", ^{
                assertThat([appDelegate window], instanceOf([UIWindow class]));
            });

            it(@"should have a window that fills the bounds of the screen", ^{
                NSValue *const windowFrame = [NSValue valueWithCGRect:[[appDelegate window] frame]];
                NSValue *const mainScreenBounds = [NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]];
                assertThat(windowFrame, equalTo(mainScreenBounds));
            });

            it(@"should set up MainViewController as the root view of the window", ^{
                assertThat([[appDelegate window] rootViewController], instanceOf([MainViewController class]));
            });

        });

        SPEC_END
