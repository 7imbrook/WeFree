//
//  HomeViewController.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/30/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "HomeViewController.h"
#import "TimerView.h"
#import "ScheduleViewController.h"

@interface HomeViewController ()

@property (nonatomic) TimerView *timerView;
@property ScheduleViewController *svc;

@end

typedef void (^myCompletion)(BOOL);

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _timerView = [TimerView newTimerView];
    _timerView.referenceDate = [NSDate date];
    [self.view addSubview:_timerView];
    
    _svc = [ScheduleViewController new];
    [_svc requestEventStoreAccessWithType:EKEntityTypeEvent completion:^(NSDate *nextDate) {
        _timerView.referenceDate = nextDate;
    }];
}

- (IBAction)unwindToHome:(UIStoryboardSegue *)unwindSegue
{
    
}

#pragma mark - Helpers

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
