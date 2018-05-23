//
//  NSNotificationCenter+TypedNotifications.m
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "NSNotificationCenter+STNotifications.h"
#import "STNotificationToken.h"
#import "STNotificationObserver.h"
#import "STNotification.h"

@implementation NSNotificationCenter (STNotifications)

- (STNotificationToken * __nonnull)stn_addNotificationObserver:(STNotificationObserver * __nonnull)observer {
    NSParameterAssert(observer);
    id<NSObject> token = [self addObserverForName:observer.name object:observer.sender queue:observer.queue usingBlock:^(NSNotification * __nonnull note) {
        observer.onRecievedBlock(note.object);
    }];
    return [[STNotificationToken alloc] initWithToken:token center:self];
}

- (void)stn_postNotification:(STNotification * __nonnull)notification {
    NSParameterAssert(notification);
    [self postNotificationName:notification.name object:notification];
}

@end
