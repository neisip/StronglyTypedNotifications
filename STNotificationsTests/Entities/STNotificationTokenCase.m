//
//  NotificationTokenCase.m
//  TypedNotificationsTests
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "STNotificationToken.h"

@interface STNotificationTokenCase : XCTestCase
@property (strong, nonatomic) STNotificationToken *sut;
@property (strong, nonatomic) NSNotificationCenter *stubCenter;
@end

@implementation STNotificationTokenCase

- (void)tearDown {
    _sut = nil;
    [super tearDown];
}

- (void)testThatItStoresTokenOnCreation {
    //given
    id<NSObject> stubToken = @"stubToken";
    NSNotificationCenter *stubCenter = [[NSNotificationCenter alloc] init];
    
    //when
    self.sut = [[STNotificationToken alloc] initWithToken:stubToken center:stubCenter];
    
    //then
    XCTAssert(self.sut.token);
}

- (void)testThatItUnsubscribesFromNotificationsAfterDeallocation {
    //given
    id<NSObject> stubToken = @"stubToken";
    id mockedCenter = OCMClassMock([NSNotificationCenter class]);
    
    //when
    self.sut = [[STNotificationToken alloc] initWithToken:stubToken center:mockedCenter];
    self.sut = nil;
    //then
    
    OCMVerify([mockedCenter removeObserver:[OCMArg any]]);
}

@end
