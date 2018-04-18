//
//  TypedNotificationObserver.m
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "STNotificationObserver.h"

@interface STNotificationObserver ()
@property (nonatomic, copy, readwrite) NSNotificationName __nonnull name;
@property (nonatomic, strong, readwrite) NSOperationQueue * __nonnull queue;
@property (nonatomic, weak, readwrite) id _Nullable sender;
@property (nonatomic, copy, readwrite) void (^ _Nullable onRecievedBlock)(STNotification<id> * _Nullable);
@end

@implementation STNotificationObserver

- (instancetype _Nullable)initWithName:(NSNotificationName _Nonnull )name {
    if (self = [super init]) {
        _queue = [NSOperationQueue mainQueue];
        _name = name;
    }
    return self;
}

@end
