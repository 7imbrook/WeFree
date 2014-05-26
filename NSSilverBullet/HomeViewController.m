//
//  HomeViewController.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/30/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//
#import <MultipeerConnectivity/MultipeerConnectivity.h>
#import "HomeViewController.h"
#import "MultipeerManager.h"
#import "TimerView.h"
#import "ScheduleViewController.h"
#import "WFEvent.h"
#import "EventStoreManager.h"

@interface HomeViewController ()

@property (nonatomic) TimerView *timerView;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create and add timer view
    _timerView = [TimerView newTimerView];
    [_timerView setFrame:CGRectMake(0., 60., [UIScreen mainScreen].bounds.size.width, _timerView.frame.size.height)];
    [self.view addSubview:_timerView];
    
    // EventStoreManager to fetch events
    EventStoreManager *eventStoreManager = [EventStoreManager new];
    [eventStoreManager requestEventStoreAccessWithCompletion:^(NSArray *events) {
        _timerView.referenceDate = [[events firstObject] startDate];
        _timerView.nextEvent = [[events firstObject] title];
    }];

}

- (void)viewDidAppear:(BOOL)animated
{

}

- (void)viewDidDisappear:(BOOL)animated
{

}

#pragma mark - Helpers

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    
}

@end
