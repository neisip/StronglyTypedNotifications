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

- (STNotificationObserver<id> *_Nullable)makeObserverWithOnRecievedBlock:(void (^_Nonnull)(STNotification<id>  * _Nullable))recievedBlock {
    STNotificationObserver *observer = [[STNotificationObserver alloc] initWithName:self.name];
    [observer setOnRecievedBlock:recievedBlock];
    return observer;
}

- (STNotificationObserver<id> *_Nonnull)makeObserverWithQueue:(NSOperationQueue *_Nullable)queue
                                                                sender:(id _Nullable )sender
                                                       onRecievedBlock:(void (^_Nonnull)(STNotification<id>  * _Nullable))recievedBlock {
    STNotificationObserver *observer = [self makeObserverWithOnRecievedBlock:recievedBlock];
    [observer setQueue:queue];
    [observer setSender:sender];
    return observer;
}


- (STNotification<id> *)makeNotificationWithPayload:(id)payload {
    return [[STNotification alloc] initWithName:self.name payload:payload];
}

- (STNotification<id> *)makeNotificationWithPayload:(id)payload sender:(id)sender {
    return [[STNotification alloc] initWithName:self.name payload:payload sender:sender];
}
@end
