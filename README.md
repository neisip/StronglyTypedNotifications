
  ![STNotifications: Strongly Typed Notifications for Objective C](https://raw.githubusercontent.com/neisip/StronglyTypedNotifications/master/STNotifications.png)

<p align="center">
  <a href="https://travis-ci.org/neisip/StronglyTypedNotifications"><img alt="Build status" src="https://travis-ci.org/neisip/StronglyTypedNotifications.svg?branch=master"/></a>
  <a href="http://codecov.io/github/neisip/StronglyTypedNotifications"><img alt="Code coverage status" src="http://codecov.io/github/neisip/StronglyTypedNotifications/coverage.svg?branch=master"/></a>
  <a href="https://cocoapods.org/pods/STNotifications"><img alt="CocoaPods" src="https://img.shields.io/cocoapods/v/STNotifications.svg"/></a>
    <a href="https://github.com/Carthage/Carthage"><img alt="Carthage" src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"/></a>
</p>

STNotifications is a library for Strongly Typed Notifications for Objective-C

- [Features](#features)
- [Usage](#usage)
- [Installation](#installation)

## Features

- [x] Strongly typed payload (using safe api around Objective-C lightweight generics)
- [x] Makes sure only one NSNotificationName exists for Notification and Observer
- [x] Interoperable with Swift!
- [x] Autounsubscribtion on NotificationToken deallocation!


## Usage

# Creating factory
Write STNotificationsFactory - factory method 
```
#import <STNotifications/STNotifications.h>
@class Payload;

@interface STNotificationFactory (YourCustomNotifications)
+ (STNotificationFactory<Payload *> *)payloadFactory;
@end

@implementation STNotificationFactory (YourCustomNotifications)
+ (STNotificationFactory<Payload *> *)payloadFactory {
    return [STNotificationFactory factoryWithNotificationName:@"Notification payload"];
}
@end

```

or your own subclass:

```
#import <STNotifications/STNotifications.h>
#import "Alert.h"

@interface AlertNotificationFactory : STNotificationFactory <Alert *>
+ (instancetype)factory;
@end

#import "AlertNotificationFactory.h"

@implementation AlertNotificationFactory

+ (instancetype)factory {
    return [AlertNotificationFactory factoryWithNotificationName:@"AlertNotification"];
}
@end
```

*That's it! Now you NotificationName and payloadType can be no longer be messed up!*

# Start observing

```
[[STNotificationFactory payloadFactory] makeObserverWithOnRecievedBlock:<#^(Payload * _Nullable)recievedBlock#> 
```
*Look - type is already there! Same as in NSArray! : )*

```
@property (strong, nonatomic) STNotificationToken *alertToken; // < ---- Auto Unsubscription on deallocation!

STNotificationObserver * observer = [[AlertNotificationFactory factory] makeObserverWithOnRecievedBlock:^(Alert * _Nullable alert) {
        NSLog(@"%@", alert.message);
    }];

self.token = [[NSNotificationCenter defaultCenter] stn_addNotificationObserver:observer];
```
*STNotificationToken has autounsubscription feature on deallocation!*

# Posting

```
//STNotification *alertNotification = [[AlertNotificationFactory factory] makeNotificationWithPayload:<#(Alert * _Nullable)#>
//Same here! no more messing with payload!

  Alert *alert = [Alert new];
  alert.message = @"ALARM!!!";
  STNotification *alertNotification = [[AlertNotificationFactory factory] makeNotificationWithPayload:alert];

  [[NSNotificationCenter defaultCenter] stn_postNotification:alertNotification];
```

## Installation

### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'STNotification', '~> 1.0'
end
```

### Carthage

```
github "neisip/StronglyTypedNotifications"
```

## License

STNotifications is released under the MIT license. [See LICENSE](https://github.com/neisip/StronglyTypedNotifications/blob/master/LICENSE) for details.
