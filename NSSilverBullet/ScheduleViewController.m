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

#pragma mark - Helpers

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
