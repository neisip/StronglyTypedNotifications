//
//  TypedNotification.m
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "STNotification.h"

@interface STNotification ()
@property (strong, nonatomic, readwrite) id __nullable payload;
@property (copy, nonatomic, readwrite) NSNotificationName __nonnull name;
@property (weak, nonatomic, readwrite) id __nullable sender;
@end

@implementation STNotification

- (instancetype __nullable)initWithName:(NSNotificationName)name payload:(id __nullable)payload sender:(id __nullable)sender{
    NSParameterAssert(name.length > 0);
    if(self = [super init]) {
        _name = name;
        _payload = payload;
        _sender = sender;
    }
    return self;
}

- (instancetype __nullable)initWithName:(NSNotificationName __nonnull )name payload:(id __nullable)payload {
    return [self initWithName:name payload:payload sender:nil];
}

- (instancetype __nullable)initWithName:(NSNotificationName _Nonnull )name {
    return [self initWithName:name payload:nil];
}
@end
