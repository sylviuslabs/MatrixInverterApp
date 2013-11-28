#define HC_SHORTHAND
#define MOCKITO_SHORTHAND

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>
#import <Objection/Objection.h>
#import <Kiwi/Kiwi.h>

@class UIView;

OBJC_EXTERN void usingDependencyInjection(void (^block)(void));

OBJC_EXTERN id injectMock(Class classToMock);

OBJC_EXTERN id injectMockProtocol(Protocol *protocolToMock);

OBJC_EXTERN id getObjectWithDependencies(Class classToGet, NSArray *argumentList);

OBJC_EXTERN NSArray *getSubviewsOfType(Class subviewClass, UIView *view);
