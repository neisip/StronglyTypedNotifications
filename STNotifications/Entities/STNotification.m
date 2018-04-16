//
//  TypedNotification.m
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "STNotification.h"

@interface STNotification ()
@property (strong, nonatomic, readwrite) id _Nullable payload;
@property (copy, nonatomic, readwrite) NSNotificationName _Nonnull name;
@end

@implementation STNotification

- (instancetype _Nullable)initWithName:(NSNotificationName)name payload:(id _Nullable)payload {
    NSParameterAssert(name.length > 0);
    if(self = [super init]) {
        _name = name;
        _payload = payload;
    }
    return self;
}

- (instancetype _Nullable)initWithName:(NSNotificationName _Nonnull )name {
    return [self initWithName:name payload:nil];
}
@end
