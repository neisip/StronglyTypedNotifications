//
//  TypedNotificationObserver+Protected.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "STNotificationObserver.h"

@interface STNotificationObserver (Protected)
- (void)setQueue:(NSOperationQueue * __nonnull)queue;
- (void)setSender:(id __nonnull)sender;
- (void)setOnRecievedBlock:(void (^ _Nullable)(STNotification<id>  * _Nullable))onRecievedBlock;
@end

