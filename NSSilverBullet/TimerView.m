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

@property (weak, nonatomic) IBOutlet UILabel *timeCountdown;
@property (weak, nonatomic) IBOutlet UILabel *eventTitle;

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
        self.backgroundColor = [UIColor whiteColor];
        _timeCountdown.backgroundColor = [UIColor clearColor];
    }
    
    
    
    return self;
}

- (void)didMoveToSuperview
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    [self updateTime];
}

- (NSString *)timeFormatForInterval:(NSTimeInterval)interval
{
    interval = fabs(interval);
    interval = floor(interval);
    //NSLog(@"Seconds: %f", interval);
//    NSLog(@"Seconds: %ld", lround(interval) % 60);
//    NSLog(@"Minutes: %ld", lround(floor(interval / 60.)) % 60);
//    NSLog(@"Hours: %ld", lround(interval / 3600.) % 100);
    return [NSString stringWithFormat:@"%02li:%02li:%02li",
            lround(floor(interval / 3600.)) % 100,     // hours
            lround(floor(interval / 60.)) % 60, // minutes
            lround(floor(interval)) % 60];      // seconds
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
    if (interval < 0) {
        self.backgroundColor = [UIColor redColor];
    } else if (interval > 0) {
        self.backgroundColor = [UIColor greenColor];
    }
    _timeCountdown.text = [self timeFormatForInterval:interval];
    _eventTitle.text = _nextEvent;
}

- (void)drawRect:(CGRect)rect
{

}


@end
