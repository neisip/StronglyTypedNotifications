//
//  TypedNotificationObserver.m
//  TypedNotificationsTests
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "STNotificationObserver.h"
#import "Constants.h"

@interface STNotificationObserverCase : XCTestCase
@property (strong, nonatomic) STNotificationObserver *sut;
@end

@implementation STNotificationObserverCase

- (void)testThatItCanBeCreatedWithNameAndHasMainQueue {
    //given
    //when
    self.sut = [[STNotificationObserver alloc] initWithName:stn_stubNotificationName];
    
    //then
    XCTAssert(self.sut.name.length > 0 && self.sut.queue);
}



@end
