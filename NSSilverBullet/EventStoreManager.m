//
//  EventStoreManager.m
//  NSSilverBullet
//
//  Created by Piper Chester on 2/13/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

@import EventKit;

#import "EventStoreManager.h"

@interface EventStoreManager ()

@property EKEventStore *eventStore;

@end

@implementation EventStoreManager

- (void)checkEventStoreAccess
{
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    
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
- (void)requestEventStoreAccessWithCompletion:(void (^)(NSMutableArray *eventArray))completion
{
    if(!_eventStore) {
        _eventStore = [EKEventStore new];
    }
    
    [_eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
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
        NSMutableArray *events = [NSMutableArray arrayWithArray:[_eventStore eventsMatchingPredicate:predicate]];
        NSMutableArray *pastEvents = [NSMutableArray array];
        
        // Remove past events, including events happening now
        for (EKEvent *event in events){
            if ([event.startDate timeIntervalSinceDate:[NSDate date]] <= 0){
                [pastEvents addObject:event];
            }
        }
        [events removeObjectsInArray:pastEvents];
        
        // Pass the events array to the HVC completion block
        completion(events);
    }];
}

@end
