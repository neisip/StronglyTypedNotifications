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

- (STNotificationObserver<id> *__nullable)makeObserverWithOnRecievedBlock:(void (^__nonnull)(STNotification<id>  * __nullable))recievedBlock {
    NSParameterAssert(recievedBlock);
    STNotificationObserver *observer = [[STNotificationObserver alloc] initWithName:self.name];
    [observer setOnRecievedBlock:recievedBlock];
    return observer;
}

- (STNotificationObserver<id> *__nonnull)makeObserverWithQueue:(NSOperationQueue *__nullable)queue
                                                                sender:(id __nullable)sender
                                                       onRecievedBlock:(void (^__nonnull)(STNotification<id>  * __nullable))recievedBlock {
    STNotificationObserver *observer = [self makeObserverWithOnRecievedBlock:recievedBlock];
    [observer setQueue:queue];
    [observer setSender:sender];
    return observer;
}


- (STNotification<id> * __nonnull)makeNotificationWithPayload:(id __nullable)payload {
    return [[STNotification alloc] initWithName:self.name payload:payload];
}

- (STNotification<id> * __nonnull)makeNotificationWithPayload:(id __nullable)payload sender:(id __nullable)sender {
    return [[STNotification alloc] initWithName:self.name payload:payload sender:sender];
}
@end
