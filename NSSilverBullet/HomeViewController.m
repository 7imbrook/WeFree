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

    _timerView = [TimerView newTimerView];
    _timerView.referenceDate = [NSDate date];
    
    [self.view addSubview:_timerView];
    
    ScheduleViewController *svc = [ScheduleViewController new];
    _timerView.referenceDate = [svc fetchNextDate];
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
