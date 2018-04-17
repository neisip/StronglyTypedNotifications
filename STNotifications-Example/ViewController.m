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
@interface ViewController ()
@property (strong, nonatomic) STNotificationToken *token; // < ---- Auto Unsubscription on deallocation!
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    STNotificationObserver * observer = [[STNotificationFactory payloadFactory] makeObserverWithOnRecievedBlock:^(Payload * _Nullable payload) {
        NSLog(@"%@", payload.message);
    }];
    self.token = [[NSNotificationCenter defaultCenter] stn_addNotificationObserver:observer];
}


- (IBAction)notify:(UIButton *)sender {
    Payload *payload = [Payload new];
    payload.message = @"Hi there!";
    STNotification *notification = [[STNotificationFactory payloadFactory] makeNotificationWithPayload:payload];
    [[NSNotificationCenter defaultCenter] stn_postNotification:notification];
}

@end
