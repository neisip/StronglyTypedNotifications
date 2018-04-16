//
//  TypedNotificationFactory.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STNotificationObserver.h"
#import "STNotification.h"


@interface STNotificationFactory<PayloadType>: NSObject
+ (instancetype _Nullable)factoryWithNotificationName:(NSNotificationName _Nonnull )name;

- (STNotificationObserver<PayloadType> *_Nullable)makeObserverWithOnRecievedBlock:(void (^_Nonnull)(PayloadType _Nullable ))recievedBlock;
- (STNotificationObserver<PayloadType> *_Nonnull)makeObserverWithQueue:(NSOperationQueue *_Nullable)queue
                                                                   sender:(id _Nullable )sender
                                                          onRecievedBlock:(void (^_Nullable)(PayloadType _Nullable ))recievedBlock;

- (STNotification<PayloadType> *_Nonnull)makeNotificationWithPayload:(PayloadType _Nullable )payload;
@end
