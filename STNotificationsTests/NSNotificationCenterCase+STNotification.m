//
//  NSNotificationCenterCase+TypedNotification.m
//  TypedNotificationsTests
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNotificationCenter+STNotifications.h"
#import "STNotificationToken.h"
#import "STNotificationObserver.h"
#import "STNotificationFactory.h"
#import "Constants.h"
#import "STNotification.h"

@interface NSNotificationCenterCase_STNotification : XCTestCase
@property (strong, nonatomic) NSNotificationCenter *sut;
@property (strong, nonatomic) STNotificationFactory<NSString *> *notificationFactory;
@end

@implementation NSNotificationCenterCase_STNotification

- (void)setUp {
    [super setUp];
    self.sut = [[NSNotificationCenter alloc] init];
    self.notificationFactory = [STNotificationFactory factoryWithNotificationName:stn_stubNotificationName];
}

- (void)tearDown {
    _sut = nil;
    [super tearDown];
}

- (void)testThatItReturnsNotificationTokenOnAddingObserver {
    //given
    STNotificationObserver<NSString *> *observer = [self.notificationFactory makeObserverWithOnRecievedBlock:^void(STNotification<NSString *> *notification){ }];
    //when
    STNotificationToken *token = [self.sut stn_addNotificationObserver:observer];
    //then
    XCTAssert(token);
}

- (void)testThatItCallsBlockOnRecievedNotificationWithPayload {
    
    //given
    __block BOOL hasRecievedMessage = NO;
    STNotificationObserver<NSString *> *observer = [self.notificationFactory makeObserverWithOnRecievedBlock:^void(STNotification<NSString *> *notification) {
        hasRecievedMessage = notification.payload.length > 0;
    }];
    STNotification<NSString *> *notification = [self.notificationFactory makeNotificationWithPayload:@"stubPayload"];
    
    //when
    STNotificationToken * __unused token = [self.sut stn_addNotificationObserver:observer];
    [self.sut stn_postNotification:notification];
    
    //then
    XCTAssert(hasRecievedMessage);
  
    
}

- (void)testThatItHasSenderInNotification {
    //given
    __block STNotification<NSString *> *sutNotification;
    STNotificationObserver<NSString *> *observer = [self.notificationFactory makeObserverWithOnRecievedBlock:^void(STNotification<NSString *> *notification) {
        sutNotification = notification;
    }];
    
    STNotification<NSString *> *notification = [self.notificationFactory makeNotificationWithPayload:@"stubPayload" sender:observer];
    
    //when
    STNotificationToken * __unused token = [self.sut stn_addNotificationObserver:observer];
    [self.sut stn_postNotification:notification];
    //then
    XCTAssert(sutNotification.sender);
}

@end
