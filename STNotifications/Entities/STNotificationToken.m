//
//  NotificationToken.m
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "STNotificationToken.h"

@interface STNotificationToken ()
@property (nonatomic, strong, readwrite) id<NSObject> _Nonnull token;
@property (nonatomic, strong, readwrite) NSNotificationCenter *_Nonnull center;
@end

@implementation STNotificationToken

- (instancetype _Nonnull )initWithToken:(id<NSObject> _Nonnull)token center:(NSNotificationCenter *_Nonnull)center {
    NSParameterAssert(token && center);
    if (self = [super init]) {
        _token = token;
        _center = center;
    }
    return self;
}

- (void)dealloc
{
    [_center removeObserver:_token];
}

@end

