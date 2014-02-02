//
//  ScheduleViewController.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/30/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

@import EventKit;

#import "ScheduleViewController.h"
#import "HomeViewController.h"

@interface ScheduleViewController ()

@property (nonatomic) EKEventStore *eventStore;

@end

@implementation ScheduleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
    UISwipeGestureRecognizer *oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc]
                                                      initWithTarget:self
                                                      action:@selector(oneFingerSwipeRight:)];
    [oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:oneFingerSwipeRight];
    
}

- (void)oneFingerSwipeRight:(UITapGestureRecognizer *)recognizer
{
    [self.navigationController popViewControllerAnimated:YES];
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
- (void)requestEventStoreAccessWithType:(EKEntityType)entityType completion:(void (^)(NSArray *eventArray))completion
{
    if(!_eventStore) {
        _eventStore = [EKEventStore new];
    }
    
    [_eventStore requestAccessToEntityType:entityType completion:^(BOOL granted, NSError *error) {
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        // Create end date components (a week)
        NSDateComponents *aWeekComponents = [NSDateComponents new];
        aWeekComponents.day = 7;
        NSDate *aWeek = [calendar dateByAddingComponents:aWeekComponents toDate:[NSDate date] options:0];
        
        // Create the predicate from the event store's instance method
        NSPredicate *predicate = [_eventStore predicateForEventsWithStartDate:[NSDate date]
                                                                      endDate:aWeek
                                                                    calendars:nil];
        
        // Fetch all events that match the predicate
        NSArray *events = [_eventStore eventsMatchingPredicate:predicate];
        
        // Pass the events array to the HVC completion block
        completion(events);
    }];
}

#pragma mark - Helpers

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
