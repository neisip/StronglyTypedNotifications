//
//  TypedNotificationObserver.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STNotificationNameProvider.h"

@interface STNotificationObserver<PayloadType> : NSObject <STNotificationNameProvider>
@property (nonatomic, strong, readonly) NSOperationQueue * __nonnull queue;
@property (nonatomic, weak, readonly) id _Nullable sender;
@property (nonatomic, copy, readonly) void (^ _Nullable onRecievedBlock)(PayloadType _Nullable );

- (instancetype _Nullable )init NS_UNAVAILABLE;
+ (instancetype _Nullable )new NS_UNAVAILABLE;
@end
