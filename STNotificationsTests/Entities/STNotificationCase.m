//
//  TypedNotificationCase.m
//  TypedNotificationsTests
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "STNotification.h"
#import "Constants.h"

@interface STNotificationCase : XCTestCase
@property (strong, nonatomic) STNotification<NSString *> *sut;
@end

@implementation STNotificationCase

- (void)tearDown {
    self.sut = nil;
    [super tearDown];
}

- (void)testThatItSetsNameOnCreation {

    //when
    self.sut = [[STNotification alloc] initWithName:stn_stubNotificationName];
    
    //then
    XCTAssert(self.sut.name.length > 0);
}

- (void)testThatItSetsNameAndPayloadOnCreation {
    //given
    NSString * stubPayload = @"stub";
    
    //when
    self.sut = [[STNotification<NSString *> alloc] initWithName:stn_stubNotificationName payload:stubPayload];
    
    //then
    XCTAssert(self.sut.name.length > 0 && self.sut.payload.length >0);
}


@end
