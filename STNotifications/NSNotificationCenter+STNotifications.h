//
//  NSNotificationCenter+TypedNotifications.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <Foundation/Foundation.h>

@class STNotificationToken, STNotification, STNotificationObserver;

@interface NSNotificationCenter (STNotifications)
- (STNotificationToken * _Nonnull)stn_addNotificationObserver:(STNotificationObserver * _Nonnull)observer;
- (void)stn_postNotification:(STNotification * _Nonnull)notification;
@end
