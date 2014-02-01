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

/**
 * Fetches calendar event data from the event store using an NSPredicate. Formats
 * the calendar data into minutes and hours.
 */
- (void)requestEventStoreAccessWithType:(EKEntityType)entityType
{
    if(!_eventStore) {
        _eventStore = [EKEventStore new];
    }
    
    [_eventStore requestAccessToEntityType:entityType completion:^(BOOL granted, NSError *error) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        // Create start date components (yesterday)
        NSDateComponents *yesterdayComponents = [[NSDateComponents alloc] init];
        yesterdayComponents.day = -1;
        NSDate *yesterday = [calendar dateByAddingComponents:yesterdayComponents
                                                      toDate:[NSDate date]
                                                     options:0];
        
        // Create end date components (a week)
        NSDateComponents *aWeekComponents = [[NSDateComponents alloc] init];
        aWeekComponents.day = 7;
        NSDate *aWeek = [calendar dateByAddingComponents:aWeekComponents
                                                  toDate:[NSDate date]
                                                 options:0];
        
        // Create the predicate from the event store's instance method
        NSPredicate *predicate = [_eventStore predicateForEventsWithStartDate:yesterday
                                                                      endDate:aWeek
                                                                    calendars:nil];
        
        // Fetch all events that match the predicate
        NSArray *events = [_eventStore eventsMatchingPredicate:predicate];
    }];
}


#pragma mark - Helpers

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
