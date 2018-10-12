//
//  TypedNotificationObserver.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STNotificationNameProvider.h"
#import "STNotification.h"

@interface STNotificationObserver<PayloadType: id> : NSObject <STNotificationNameProvider>
@property (nonatomic, strong, readonly) NSOperationQueue * __nonnull queue;
@property (nonatomic, weak, readonly) id __nullable sender;
@property (nonatomic, copy, readonly) void (^ __nullable onRecievedBlock)(STNotification<PayloadType> * __nullable);

- (instancetype __nullable)init NS_UNAVAILABLE;
+ (instancetype __nullable)new NS_UNAVAILABLE;
@end
