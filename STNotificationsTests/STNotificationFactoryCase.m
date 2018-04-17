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
    void (^onRecievedBlock)(NSString *) = ^ void(NSString *payload) {};
    
    //when
    STNotificationObserver<NSString *> *observer = [self.sut makeObserverWithOnRecievedBlock:onRecievedBlock];
    
    //then
    XCTAssert(observer.onRecievedBlock != nil && observer.name.length > 0);
}

- (void)testThatItCreatesObserverWithSetReceivedBlockNameQueueSender {
    //given
    void (^onRecievedBlock)(NSString *) = ^ void(NSString *payload) {};
    id sender = [NSObject new];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //when
    STNotificationObserver<NSString *> *observer = [self.sut makeObserverWithQueue:queue sender:sender onRecievedBlock:onRecievedBlock];
    
    //then
    XCTAssert(observer.onRecievedBlock != nil && observer.name.length > 0 && observer.sender && [observer.queue isEqual:queue]);
}

- (void)testThatItCreatesNotificationWithPayloadAndName {
    //given
    NSString *payload = @"payload";
    
    //when
    STNotification<NSString *> *notification = [self.sut makeNotificationWithPayload:payload];
    
    //then
    XCTAssert(notification.payload != nil && notification.name.length > 0);
}

@end
