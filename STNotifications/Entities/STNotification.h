//
//  TypedNotification.h
//  TypedNotifications
//
//  Created by Alexander Kazartsev on 12.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STNotificationNameProvider.h"

@interface STNotification<PayloadType: id>: NSObject <STNotificationNameProvider>
@property (nonatomic, weak, readonly) id __nullable sender;
@property (nonatomic, strong, readonly) PayloadType __nullable payload;
- (instancetype __nullable)initWithName:(NSNotificationName __nonnull )name payload:(PayloadType __nullable)payload sender:(id __nullable)sender NS_DESIGNATED_INITIALIZER;
- (instancetype __nullable)initWithName:(NSNotificationName __nonnull )name payload:(PayloadType __nullable)payload;
- (instancetype __nullable )init NS_UNAVAILABLE;
+ (instancetype __nullable )new NS_UNAVAILABLE;
@end
