//
//  STEAlertNotificationFactory.h
//  STNotifications-Example
//
//  Created by Alexander Kazartsev on 17.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <STNotifications/STNotifications.h>
#import "Alert.h"

@interface AlertNotificationFactory : STNotificationFactory <Alert *>
- (instancetype)init;
+ (instancetype)factory;
@end
