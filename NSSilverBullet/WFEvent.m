//
//  WFEvent.m
//  NSSilverBullet
//
//  Created by Piper Chester on 2/2/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "WFEvent.h"

@implementation WFEvent

- (id)initWithEvent:(EKEvent *)event
{
    self = [super init];
    
    if (self){
        self = [WFEvent new];
        self.duration = [[event endDate] timeIntervalSinceDate:[event startDate]] / 3600;
    }
    return self;
}

@end
