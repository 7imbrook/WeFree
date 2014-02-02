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

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create and add timer view
    _timerView = [TimerView newTimerView];
    [self.view addSubview:_timerView];
    
    // Create SVC, request calendar data and set appropriate referenceDate
    ScheduleViewController *scheduleViewController = [ScheduleViewController new];
    [scheduleViewController requestEventStoreAccessWithType:EKEntityTypeEvent completion:^(NSArray *events) {
        _timerView.referenceDate = [[events firstObject] startDate];
        _timerView.nextEvent = [[events firstObject]title];
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
