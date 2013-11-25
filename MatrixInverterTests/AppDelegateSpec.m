#import "SLTestingKit.h"
#import "AppDelegate.h"
#import "MainViewController.h"

SPEC_BEGIN(AppDelegateSpec)

        describe(@"application delegate", ^{

            it(@"shoud conform to UIApplicationDelegate protocol", ^{
                assertThat([[AppDelegate alloc] init], conformsTo(@protocol(UIApplicationDelegate)));
            });

        });

        usingDependencyInjection(^{

            describe(@"launching the app", ^{

                __block AppDelegate *appDelegate;
                __block MainViewController *mainViewController;

                beforeEach(^{
                    mainViewController = injectMock([MainViewController class]);

                    appDelegate = [[AppDelegate alloc] init];
                    [appDelegate application:nil didFinishLaunchingWithOptions:nil];
                });

                it(@"should create a window when launching", ^{
                    assertThat([appDelegate window], instanceOf([UIWindow class]));
                });

                it(@"should have a window that fills the bounds of the screen", ^{
                    NSValue *const windowFrame = [NSValue valueWithCGRect:[[appDelegate window] frame]];
                    NSValue *const mainScreenBounds = [NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]];
                    assertThat(windowFrame, equalTo(mainScreenBounds));
                });

                it(@"should make its window the key window so it gets focus", ^{
                    assertThatBool([[appDelegate window] isKeyWindow], equalToBool(YES));
                });

                it(@"should have a window that is visible", ^{
                    assertThatBool([[appDelegate window] isHidden], equalToBool(NO));
                });

                it(@"should set up MainViewController as the root view of the window", ^{
                    assertThat([[appDelegate window] rootViewController], equalTo(mainViewController));
                });

            });
        });

        describe(@"before launching the app", ^{

            __block JSObjectionInjector *previousInjector;
            beforeAll(^{
                previousInjector = [JSObjection defaultInjector];
            });
            afterAll(^{
                [JSObjection setDefaultInjector:previousInjector];
            });

            beforeEach(^{
                [JSObjection setDefaultInjector:nil];
                [[[AppDelegate alloc] init] application:nil willFinishLaunchingWithOptions:nil];
            });

            it(@"should create the default injector", ^{
                assertThat([JSObjection defaultInjector], notNilValue());
            });

        });

        SPEC_END
