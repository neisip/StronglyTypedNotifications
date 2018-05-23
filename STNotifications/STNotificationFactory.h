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
+ (instancetype _Nullable)factoryWithNotificationName:(NSNotificationName __nonnull )name;

- (STNotificationObserver<PayloadType> *__nullable)makeObserverWithOnRecievedBlock:(void (^__nonnull)(STNotification<PayloadType>  * _Nullable))recievedBlock;
- (STNotificationObserver<PayloadType> *__nonnull)makeObserverWithQueue:(NSOperationQueue *__nullable)queue
                                                                   sender:(id __nullable)sender
                                                          onRecievedBlock:(void (^__nonnull)(STNotification<PayloadType>  * __nullable))recievedBlock;

- (STNotification<PayloadType> *__nonnull)makeNotificationWithPayload:(PayloadType __nullable)payload;
- (STNotification<PayloadType> *__nonnull)makeNotificationWithPayload:(PayloadType __nullable)payload sender:(id __nullable)sender;
@end
