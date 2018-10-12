
  ![STNotifications: Strongly Typed Notifications for Objective C](https://raw.githubusercontent.com/neisip/StronglyTypedNotifications/master/STNotifications.png)

<p align="center">
  <a href="https://travis-ci.org/neisip/StronglyTypedNotifications"><img alt="Build status" src="https://travis-ci.org/neisip/StronglyTypedNotifications.svg?branch=master"/></a>
  <a href="http://codecov.io/github/neisip/StronglyTypedNotifications"><img alt="Code coverage status" src="http://codecov.io/github/neisip/StronglyTypedNotifications/coverage.svg?branch=master"/></a>
  <a href="https://cocoapods.org/pods/STNotifications"><img alt="CocoaPods" src="https://img.shields.io/cocoapods/v/STNotifications.svg"/></a>
    <a href="https://github.com/Carthage/Carthage"><img alt="Carthage" src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"/></a>
</p>

STNotifications is Objective-C library for Strongly Typed Notifications

- [Features](#features)
- [Usage](#usage)
- [Installation](#installation)

## Features

- [x] Strongly typed payload (using safe api around Objective-C lightweight generics)
- [x] Makes sure only one NSNotificationName exists for Notification and Observer
- [x] You have pointer to sender from recieved notification!
- [x] Interoperable with Swift!
- [x] Autounsubscribtion on NotificationToken deallocation!


## Usage

# Create factory method
```
#import <STNotifications/STNotifications.h>
@class Alert;

@interface STNotificationFactory (YourCustomNotifications)
+ (STNotificationFactory<Payload *> *)payloadFactory;
@end

@implementation STNotificationFactory (YourCustomNotifications)
+ (STNotificationFactory<Payload *> *)payloadFactory {
    return [STNotificationFactory factoryWithNotificationName:@"Notification payload"];
}
@end

```

# or your own subclass:

```
#import <STNotifications/STNotifications.h>
#import "Alert.h"

@interface AlertNotificationFactory : STNotificationFactory <Alert *>
- (instancetype)init;
+ (instancetype)factory;
@end

@implementation AlertNotificationFactory

- (instancetype)init {
    return self = [super initWithNotificationName:@"AlertNotification"];
}
+ (instancetype)factory {
    return [[AlertNotificationFactory alloc] init];
}
@end

```

*That's it! Now your NotificationName and Payload Type can be no longer be messed up!*

# Start observing

*Autocompletion will insert payload type you specified in factory same way as it's in NSArray!*
  ![STNotifications: Strongly Typed Notifications for Objective C](https://raw.githubusercontent.com/neisip/StronglyTypedNotifications/master/TypedAutoCompletion.png)

```
  @property (strong, nonatomic) STNotificationToken *token; // < ---- Auto Unsubscription on deallocation!
  ...
  let factory = [AlertNotificationFactory new];
  let alertObserver = [factory makeObserverWithOnRecievedBlock:^(STNotification<Alert *> * _Nullable notification) {
    NSLog(@"%@", notification.payload.message);
    NSLog(@"%@", notification.sender);
  }];
  self.alertToken = [[NSNotificationCenter defaultCenter] stn_addNotificationObserver:alertObserver];
```
*You can track down sender of notification!*
*STNotificationToken has autounsubscription feature on deallocation!*

# Post notification

*You can no longer mess up payload type!*
  ![STNotifications: Strongly Typed Notifications for Objective C](https://raw.githubusercontent.com/neisip/StronglyTypedNotifications/master/IncompatiblePointerType.png)

```
  var alert = [Alert new];
  alert.message = @"ALARM!!!";

  let alertFactory = [AlertNotificationFactory new];
  let alertNotification = [alertFactory makeNotificationWithPayload:alert sender:self];
  [[NSNotificationCenter defaultCenter] stn_postNotification:alertNotification];
```

## Installation

### CocoaPods

```ruby
target '<Your Target Name>' do
    pod 'STNotifications', '~> 1.1.5.1'
end
```

### Carthage

```
github "neisip/StronglyTypedNotifications"
```

## License

STNotifications is released under the MIT license. [See LICENSE](https://github.com/neisip/StronglyTypedNotifications/blob/master/LICENSE) for details.
