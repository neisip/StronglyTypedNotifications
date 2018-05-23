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
@property (nonatomic, weak, readwrite) id __nullable sender;
@property (nonatomic, copy, readwrite) void (^ __nullable onRecievedBlock)(STNotification<id> * __nullable);
@end

@implementation STNotificationObserver

- (instancetype __nullable)initWithName:(NSNotificationName __nonnull )name {
    NSParameterAssert(name.length > 0);
    if (self = [super init]) {
        _queue = [NSOperationQueue mainQueue];
        _name = name;
    }
    return self;
}

@end
