//
//  ScheduleViewController.h
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/30/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <UIKit/UIKit.h>

@import EventKit;

@interface ScheduleViewController : UICollectionViewController

@property  NSDate *nextDate;
@property  NSTimeInterval nextDateHours;
@property  NSTimeInterval nextDateMinutes;

- (void)requestEventStoreAccessWithType:(EKEntityType)entityType completion:(void (^)(NSDate *nextDate))completion;

@end
