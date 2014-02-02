//
//  TimerView.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/30/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <NSDate+RelativeTime/NSDate+RelativeTime.h>

#import "TimerView.h"

@interface TimerView ()

@property (weak, nonatomic) IBOutlet UILabel *timeOutlet;
@property (weak, nonatomic) IBOutlet UILabel *relitiveTime;

@end

@implementation TimerView

+ (instancetype)newTimerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"TimerView" owner:self options:nil] firstObject];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)didMoveToSuperview
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [self updateTime];
}

- (NSString *)timeFormateForInterval:(NSTimeInterval)interval
{
    interval = fabs(interval);
    return [NSString stringWithFormat:@"%02li:%02li:%02li",
            lround(floor(interval / 3600.)) % 100,
            lround(floor(interval / 60.)) % 60,
            lround(floor(interval)) % 60];
}

- (void)updateTime
{
    // Hide timer if event is in the past
    if ([_referenceDate timeIntervalSinceDate:[NSDate date]] <= 0) {
        [self setAlpha:0];
    } else {
        [UIView animateWithDuration:.35 animations:^(void){
            [self setAlpha:1];
        }];
    }
    NSTimeInterval interval = [_referenceDate timeIntervalSinceNow];
    _relitiveTime.text = [_referenceDate relativeTime];
    _timeOutlet.text = [self timeFormateForInterval:interval];
}

- (void)drawRect:(CGRect)rect
{

}


@end
