//
//  WFEvent.h
//  NSSilverBullet
//
//  Created by Piper Chester on 2/2/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <Foundation/Foundation.h>

@import EventKit;

@interface WFEvent : NSObject

@property NSTimeInterval duration;

- (id)initWithEvent:(EKEvent *)event;

@end
