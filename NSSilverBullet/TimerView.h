//
//  TimerView.h
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/30/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerView : UIView

@property (strong) NSDate *referenceDate;

+ (instancetype)newTimerView;

@end
