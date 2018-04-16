//
//  NotificationNameProvider.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

@protocol STNotificationNameProvider
- (__nonnull NSNotificationName)name;
- (_Nullable instancetype)initWithName:(NSNotificationName __nonnull)name;
@end

