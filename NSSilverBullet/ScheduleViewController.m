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

	// Do any additional setup after loading the view.
    UISwipeGestureRecognizer *oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc]
                                                      initWithTarget:self
                                                      action:@selector(oneFingerSwipeRight:)];
    [oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:oneFingerSwipeRight];
    
}

- (void)oneFingerSwipeRight:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe right
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
- (void)requestEventStoreAccessWithType:(EKEntityType)entityType completion:(void (^)(NSDate *nextDate))completion
{
    if(!_eventStore) {
        _eventStore = [EKEventStore new];
    }
    
    if(!_nextDate) {
        _nextDate = [NSDate new];
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
        
        // Events are chronologically added to the array
        _nextDate = [[events firstObject] startDate];
        
        // Set the reference point for the event comparison
        _nextDateHours = [[NSDate distantFuture] timeIntervalSinceDate:[NSDate date]];
        
        for (EKEvent *event in events){
            if ((_nextDateHours > [[event startDate] timeIntervalSinceDate:[NSDate date]] / 3600) &&
                [[event startDate] timeIntervalSinceDate:[NSDate date]] > 0){
                _nextDate = [event startDate];
                _nextDateHours = [[event startDate] timeIntervalSinceDate:[NSDate date]] / 3600;
                _nextDateMinutes = 60 * ([[event startDate] timeIntervalSinceDate:[NSDate date]] / 3600);
                completion(_nextDate);
            }
        }
    }];
}

#pragma mark - Helpers

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
