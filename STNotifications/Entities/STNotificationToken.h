//
//  NotificationToken.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STNotificationToken : NSObject
@property (nonatomic, strong, readonly) id<NSObject> __nonnull token;
- (instancetype __nonnull)initWithToken:(id<NSObject> __nonnull)token center:(NSNotificationCenter *__nonnull)center;
- (instancetype __nonnull)init NS_UNAVAILABLE;
+ (instancetype __nonnull)new NS_UNAVAILABLE;
@end
