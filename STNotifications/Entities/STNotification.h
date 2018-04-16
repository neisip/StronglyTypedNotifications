//
//  TypedNotification.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STNotificationNameProvider.h"

@interface STNotification<PayloadType>: NSObject <STNotificationNameProvider>
@property (nonatomic, strong, readonly) PayloadType __nullable payload;
- (instancetype _Nullable)initWithName:(NSNotificationName _Nonnull )name payload:(id _Nullable)payload NS_DESIGNATED_INITIALIZER;

- (instancetype _Nullable )init NS_UNAVAILABLE;
+ (instancetype _Nullable )new NS_UNAVAILABLE;
@end
