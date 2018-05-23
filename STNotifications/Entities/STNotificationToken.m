//
//  NotificationToken.m
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "STNotificationToken.h"

@interface STNotificationToken ()
@property (nonatomic, strong, readwrite) id<NSObject> __nonnull token;
@property (nonatomic, weak, readwrite) NSNotificationCenter *__nullable center;
@end

@implementation STNotificationToken

- (instancetype __nonnull)initWithToken:(id<NSObject> __nonnull)token center:(NSNotificationCenter *__nonnull)center {
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

