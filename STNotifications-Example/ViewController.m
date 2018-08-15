//
//  ViewController.m
//  STNotifications-Example
//
//  Created by Alexander Kazartsev on 17.04.2018.
//  Copyright © 2018 Alexander Kazartsev. All rights reserved.
//

#import "ViewController.h"
#import "STNotificationFactory+YourCustomNotifications.h"
#import "Payload.h"
#import "AlertNotificationFactory.h"

#define let __auto_type const
#define var __auto_type

@interface ViewController ()
@property (strong, nonatomic) STNotificationToken *token; // < ---- Auto Unsubscription on deallocation!
@property (strong, nonatomic) STNotificationToken *alertToken; // < ---- Auto Unsubscription on deallocation!
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    let factory = [STNotificationFactory payloadFactory];
    let observer = [factory makeObserverWithOnRecievedBlock:^(STNotification<Payload * > *notification) {
        NSLog(@"%@", notification.payload.message);
    }];
    self.token = [[NSNotificationCenter defaultCenter] stn_addNotificationObserver:observer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    let factory = [AlertNotificationFactory new];
    let alertObserver = [factory makeObserverWithOnRecievedBlock:^(STNotification<Alert *> * _Nullable notification) {
        NSLog(@"%@", notification.payload.message);
        NSLog(@"%@", notification.sender);
    }];
    self.alertToken = [[NSNotificationCenter defaultCenter] stn_addNotificationObserver:alertObserver];
}


- (IBAction)notify:(UIButton *)sender {
    
    var payload = [Payload new];
    payload.message = @"Hi there!";
    
    let payloadFactory = [STNotificationFactory payloadFactory];
    let notification = [payloadFactory makeNotificationWithPayload:payload];
    [[NSNotificationCenter defaultCenter] stn_postNotification:notification];
    
    var alert = [Alert new];
    alert.message = @"ALARM!!!";
    
    let alertFactory = [AlertNotificationFactory new];
    let alertNotification = [alertFactory makeNotificationWithPayload:alert sender:self];
    [[NSNotificationCenter defaultCenter] stn_postNotification:alertNotification];
}

@end
