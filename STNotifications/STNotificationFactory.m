//
//  TypedNotificationFactory.m
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "STNotificationFactory.h"
#import "STNotificationObserver+Protected.h"

@interface STNotificationFactory ()
@property (copy, nonatomic) NSNotificationName name;
@end

@implementation STNotificationFactory

+ (instancetype)factoryWithNotificationName:(NSNotificationName)name {
    return [[self alloc] initWithNotificationName:name];
}

- (instancetype)initWithNotificationName:(NSNotificationName)name {
    NSParameterAssert(name.length > 0);
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (STNotificationObserver<id> *)makeObserverWithOnRecievedBlock:(void (^)(id))recievedBlock {
    STNotificationObserver *observer = [[STNotificationObserver alloc] initWithName:self.name];
    [observer setOnRecievedBlock:recievedBlock];
    return observer;
}


- (STNotificationObserver<id> *)makeObserverWithQueue:(NSOperationQueue *)queue sender:(id)sender onRecievedBlock:(void (^)(id))recievedBlock {
    STNotificationObserver *observer = [self makeObserverWithOnRecievedBlock:recievedBlock];
    [observer setQueue:queue];
    [observer setSender:sender];
    return observer;
}

- (STNotification<id> *)makeNotificationWithPayload:(id)payload {
    return [[STNotification alloc] initWithName:self.name payload:payload];
}

@end
