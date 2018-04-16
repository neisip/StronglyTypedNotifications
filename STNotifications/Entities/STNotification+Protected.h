//
//  TypedNotification+Protected.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "STNotification.h"

@interface STNotification (Protected)
- (void)setPayload:(id)payload;
- (void)setName:(NSNotificationName)name;
@end
