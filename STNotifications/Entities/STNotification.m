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
@property (weak, nonatomic, readwrite) id _Nullable sender;
@end

@implementation STNotification

- (instancetype _Nullable)initWithName:(NSNotificationName)name payload:(id _Nullable)payload sender:(id _Nullable)sender{
    NSParameterAssert(name.length > 0);
    if(self = [super init]) {
        _name = name;
        _payload = payload;
        _sender = sender;
    }
    return self;
}

- (instancetype _Nullable)initWithName:(NSNotificationName _Nonnull )name payload:(id _Nullable)payload {
    return [self initWithName:name payload:payload sender:nil];
}

- (instancetype _Nullable)initWithName:(NSNotificationName _Nonnull )name {
    return [self initWithName:name payload:nil];
}
@end
