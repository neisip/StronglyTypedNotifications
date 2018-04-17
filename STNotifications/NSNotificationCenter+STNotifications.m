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

- (STNotificationToken * _Nonnull)stn_addNotificationObserver:(STNotificationObserver * _Nonnull)observer {
    id<NSObject> token = [self addObserverForName:observer.name object:observer.sender queue:observer.queue usingBlock:^(NSNotification * _Nonnull note) {
        observer.onRecievedBlock(note.object);
    }];
    return [[STNotificationToken alloc] initWithToken:token center:self];
}

- (void)stn_postNotification:(STNotification * _Nonnull)notification {
     [self postNotificationName:notification.name object:notification.payload];
}

@end
