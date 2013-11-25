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

static void _checkForNullDefaultInjector() {
    NSCAssert([JSObjection defaultInjector] != nil, @"Default injector should not be nil when injecting mocks! "
            "Did you forget usingDependencyInjection()?");
}

static id _createModuleAndAddItToDefaultInjector(id (^createAndBindMock)(JSObjectionModule *module)) {
    _checkForNullDefaultInjector();
    JSObjectionModule *const module = [[JSObjectionModule alloc] init];
    id const mockObject = createAndBindMock(module);

    JSObjectionInjector *const injector = [[JSObjection defaultInjector] withModule:module];
    [JSObjection setDefaultInjector:injector];
    return mockObject;
}

id injectMock(Class classToMock) {
    return _createModuleAndAddItToDefaultInjector(^(JSObjectionModule *module) {
        id const mockObject = mock(classToMock);
        [module bind:mockObject toClass:classToMock];
        return mockObject;
    });
}

id injectMockProtocol(Protocol *protocolToMock) {
    return _createModuleAndAddItToDefaultInjector(^(JSObjectionModule *module) {
        id const mockObject = mockProtocol(protocolToMock);
        [module bind:mockObject toProtocol:protocolToMock];
        return mockObject;
    });
}

id getObjectWithDependencies(Class classToGet, NSArray *argumentList) {
    _checkForNullDefaultInjector();
    return [[JSObjection defaultInjector] getObject:classToGet argumentList:argumentList];
}
