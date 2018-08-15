//
//  STEAlertNotificationFactory.m
//  STNotifications-Example
//
//  Created by Alexander Kazartsev on 17.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "AlertNotificationFactory.h"

@implementation AlertNotificationFactory

- (instancetype)init {
    return self = [super initWithNotificationName:@"AlertNotification"];
}
+ (instancetype)factory {
    return [[AlertNotificationFactory alloc] init];
}
@end
