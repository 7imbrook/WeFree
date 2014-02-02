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

- (void)requestEventStoreAccessWithType:(EKEntityType)entityType completion:(void (^)(NSMutableArray *eventArray))completion;

@end
