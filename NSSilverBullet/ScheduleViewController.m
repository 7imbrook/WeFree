//
//  ScheduleViewController.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/30/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

@import EventKit;

#import "ScheduleViewController.h"

@interface ScheduleViewController ()

@property (nonatomic) EKEventStore *eventStore;

@end

@implementation ScheduleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - EventStore methods

- (void)checkEventStoreAccessForType:(EKEntityType)type
{
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:type];
    
    if(status == EKAuthorizationStatusNotDetermined) {
        NSLog(@"Not Determined...");
    }
    else if(status == EKAuthorizationStatusRestricted) {
        NSLog(@"Restricted access.");
    }
    else if(status == EKAuthorizationStatusDenied) {
        NSLog(@"Status denied.");
    }
    else if(status == EKAuthorizationStatusAuthorized) {
        NSLog(@"Status authorized.");
    }
}

#pragma mark - Helpers

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
