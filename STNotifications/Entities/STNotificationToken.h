//
//  NotificationToken.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STNotificationToken : NSObject
@property (nonatomic, strong, readonly) id<NSObject> _Nonnull token;
- (instancetype _Nonnull )initWithToken:(id<NSObject> _Nonnull)token center:(NSNotificationCenter *_Nonnull)center;
- (instancetype _Nonnull )init NS_UNAVAILABLE;
+ (instancetype _Nonnull )new NS_UNAVAILABLE;
@end
