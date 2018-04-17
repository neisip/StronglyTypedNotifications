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

@interface ViewController ()
@property (strong, nonatomic) STNotificationToken *token; // < ---- Auto Unsubscription on deallocation!
@property (strong, nonatomic) STNotificationToken *alertToken; // < ---- Auto Unsubscription on deallocation!
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    STNotificationObserver * observer = [[STNotificationFactory payloadFactory] makeObserverWithOnRecievedBlock:^(Payload * _Nullable payload) {
        NSLog(@"%@", payload.message);
    }];
    self.token = [[NSNotificationCenter defaultCenter] stn_addNotificationObserver:observer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    STNotificationObserver * alertObserver = [[AlertNotificationFactory factory] makeObserverWithOnRecievedBlock:^(Alert * _Nullable alert) {
        NSLog(@"%@", alert.message);
    }];
    self.alertToken = [[NSNotificationCenter defaultCenter] stn_addNotificationObserver:alertObserver];
}


- (IBAction)notify:(UIButton *)sender {
    
    Payload *payload = [Payload new];
    payload.message = @"Hi there!";
    STNotification *notification = [[STNotificationFactory payloadFactory] makeNotificationWithPayload:payload];
    [[NSNotificationCenter defaultCenter] stn_postNotification:notification];
    
    
    Alert *alert = [Alert new];
    alert.message = @"ALARM!!!";
    STNotification *alertNotification = [[AlertNotificationFactory factory] makeNotificationWithPayload:alert];
    [[NSNotificationCenter defaultCenter] stn_postNotification:alertNotification];
}

@end
