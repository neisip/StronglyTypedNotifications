//
//  STNotificationFactory+YourCustomNotifications.h
//  STNotifications-Example
//
//  Created by Alexander Kazartsev on 17.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <STNotifications/STNotifications.h>
@class Payload;

@interface STNotificationFactory (YourCustomNotifications)
+ (STNotificationFactory<Payload *> *)payloadFactory;
@end
