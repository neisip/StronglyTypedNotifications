//
//  TypedNotificationFactoryCase.m
//  TypedNotificationsTests
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "STNotificationFactory.h"
#import "STNotificationObserver.h"
#import "STNotification.h"
#import "Constants.h"

@interface STNotificationFactoryCase : XCTestCase
@property (strong, nonatomic) STNotificationFactory<NSString *> *sut;
@end

@implementation STNotificationFactoryCase

- (void)setUp {
    [super setUp];
    self.sut = [STNotificationFactory factoryWithNotificationName:stn_stubNotificationName];
}

- (void)tearDown {
    _sut = nil;
    [super tearDown];
}


- (void)testThatItCreatesObserverWithSetReceivedBlockAndName {
    //given
    void (^onRecieved)(STNotification<NSString *> *) = ^void(STNotification<NSString *> *payload){};
    //when
    STNotificationObserver<NSString *> *observer = [self.sut makeObserverWithOnRecievedBlock:onRecieved];
    
    //then
    XCTAssert(observer.onRecievedBlock != nil && observer.name.length > 0);
}

- (void)testThatItCreatesObserverWithSetReceivedBlockNameQueueSender {
    //given
    id sender = [NSObject new];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    void (^onRecieved)(STNotification<NSString *> *) = ^void(STNotification<NSString *> *payload){};
    
    //when
    STNotificationObserver<NSString *> *observer = [self.sut makeObserverWithQueue:queue sender:sender onRecievedBlock:onRecieved];
    
    //then
    XCTAssert(observer.onRecievedBlock != nil && observer.name.length > 0 && observer.sender && [observer.queue isEqual:queue]);
}

- (void)testThatItCreatesNotificationWithPayloadAndName {
    //given
    NSString *payload = @"payload";
    id sender = payload;
    //when
    STNotification<NSString *> *notification = [self.sut makeNotificationWithPayload:payload sender:sender];
    
    //then
    XCTAssert(notification.payload != nil && notification.name.length > 0 && notification.sender);
}


@end
