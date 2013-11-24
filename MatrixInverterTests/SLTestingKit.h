#define HC_SHORTHAND
#define MOCKITO_SHORTHAND

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>
#import <Objection/Objection.h>
#import <Kiwi/Kiwi.h>

extern void usingDependencyInjection(void (^block)(void));

extern id injectMock(Class classToMock);
