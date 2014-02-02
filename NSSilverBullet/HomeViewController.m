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
#import "NearbyPeopleViewController.h"
#import "TimerView.h"
#import "ScheduleViewController.h"

@interface HomeViewController ()

@property (nonatomic) TimerView *timerView;
@property (strong) NearbyPeopleViewController *nbpvc;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Create and add timer view
    _timerView = [TimerView newTimerView];
    [_timerView setFrame:CGRectMake(0., 20., [UIScreen mainScreen].bounds.size.width, _timerView.frame.size.height)];
    
    [self.view addSubview:_timerView];
    
    // Create SVC, request calendar data and set appropriate referenceDate
    ScheduleViewController *scheduleViewController = [ScheduleViewController new];
    [scheduleViewController requestEventStoreAccessWithType:EKEntityTypeEvent completion:^(NSArray *events) {
        _timerView.referenceDate = [[events firstObject] startDate];
        _timerView.nextEvent = [[events firstObject]title];
    }];

	// Load Multipeer
    _nbpvc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"NearbyPeopleViewController"];
    _nbpvc.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, 320, 320);
    [MultipeerManager.sharedManager setDelegate:_nbpvc];
    [MultipeerManager.sharedManager start];
    [self addChildViewController:_nbpvc];
    [self.view addSubview:_nbpvc.view];

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
