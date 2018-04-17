//
//  STNotificationFactory+YourCustomNotifications.m
//  STNotifications-Example
//
//  Created by Alexander Kazartsev on 17.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "STNotificationFactory+YourCustomNotifications.h"
#import "Payload.h"

@implementation STNotificationFactory (YourCustomNotifications)
+ (STNotificationFactory<Payload *> *)payloadFactory {
    return [STNotificationFactory factoryWithNotificationName:@"Notification payload"];
}
@end
