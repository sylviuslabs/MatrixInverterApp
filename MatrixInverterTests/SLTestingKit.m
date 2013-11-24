#import "SLTestingKit.h"

void usingDependencyInjection(void (^block)(void)) {

    context(nil, ^{

        __block JSObjectionInjector *previousInjector;
        beforeAll(^{
            previousInjector = [JSObjection defaultInjector];
        });

        afterAll(^{
            [JSObjection setDefaultInjector:previousInjector];
        });

        beforeEach(^{
            [JSObjection setDefaultInjector:[JSObjection createInjector]];
        });

        context(nil, block);
    });
}

id injectMock(Class classToMock) {
    __block id mockObject = mock(classToMock);

    JSObjectionModule *const module = [[JSObjectionModule alloc] init];
    [module bind:mockObject toClass:classToMock];

    NSCAssert([JSObjection defaultInjector] != nil, @"Default injector should not be nil when injecting mocks! "
            "Did you forget usingDependencyInjection()?");

    JSObjectionInjector *const injector = [[JSObjection defaultInjector] withModule:module];
    [JSObjection setDefaultInjector:injector];
    return mockObject;
}
