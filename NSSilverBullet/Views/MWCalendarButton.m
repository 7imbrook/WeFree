//
//  MWCalendarButton.m
//  NSSilverBullet
//
//  Created by Brandon Littell on 2/2/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <Colours/UIColor+Colours.h>

#import "MWCalendarButton.h"

@implementation MWCalendarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    //// Color Declarations
    UIColor* color0 = [UIColor charcoalColor];
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 108, 116);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 37.33, CGRectGetMinY(frame) + 45)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 50.27, CGRectGetMinY(frame) + 45)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 50.27, CGRectGetMinY(frame) + 58)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37.33, CGRectGetMinY(frame) + 58)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37.33, CGRectGetMinY(frame) + 45)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 56.73, CGRectGetMinY(frame) + 45)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 69.67, CGRectGetMinY(frame) + 45)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 69.67, CGRectGetMinY(frame) + 58)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56.73, CGRectGetMinY(frame) + 58)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56.73, CGRectGetMinY(frame) + 45)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 76.13, CGRectGetMinY(frame) + 45)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 89.07, CGRectGetMinY(frame) + 45)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 89.07, CGRectGetMinY(frame) + 58)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 76.13, CGRectGetMinY(frame) + 58)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 76.13, CGRectGetMinY(frame) + 45)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 17.93, CGRectGetMinY(frame) + 84)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.87, CGRectGetMinY(frame) + 84)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.87, CGRectGetMinY(frame) + 97)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.93, CGRectGetMinY(frame) + 97)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.93, CGRectGetMinY(frame) + 84)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 37.33, CGRectGetMinY(frame) + 84)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 50.27, CGRectGetMinY(frame) + 84)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 50.27, CGRectGetMinY(frame) + 97)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37.33, CGRectGetMinY(frame) + 97)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37.33, CGRectGetMinY(frame) + 84)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 56.73, CGRectGetMinY(frame) + 84)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 69.67, CGRectGetMinY(frame) + 84)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 69.67, CGRectGetMinY(frame) + 97)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56.73, CGRectGetMinY(frame) + 97)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56.73, CGRectGetMinY(frame) + 84)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 37.33, CGRectGetMinY(frame) + 64.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 50.27, CGRectGetMinY(frame) + 64.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 50.27, CGRectGetMinY(frame) + 77.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37.33, CGRectGetMinY(frame) + 77.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 37.33, CGRectGetMinY(frame) + 64.5)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 56.73, CGRectGetMinY(frame) + 64.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 69.67, CGRectGetMinY(frame) + 64.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 69.67, CGRectGetMinY(frame) + 77.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56.73, CGRectGetMinY(frame) + 77.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 56.73, CGRectGetMinY(frame) + 64.5)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 76.13, CGRectGetMinY(frame) + 64.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 89.07, CGRectGetMinY(frame) + 64.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 89.07, CGRectGetMinY(frame) + 77.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 76.13, CGRectGetMinY(frame) + 77.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 76.13, CGRectGetMinY(frame) + 64.5)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 17.93, CGRectGetMinY(frame) + 64.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.87, CGRectGetMinY(frame) + 64.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.87, CGRectGetMinY(frame) + 77.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.93, CGRectGetMinY(frame) + 77.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.93, CGRectGetMinY(frame) + 64.5)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 89.07, CGRectGetMinY(frame) + 6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 89.07, CGRectGetMinY(frame) + 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 76.13, CGRectGetMinY(frame) + 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 76.13, CGRectGetMinY(frame) + 6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.87, CGRectGetMinY(frame) + 6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.87, CGRectGetMinY(frame) + 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.93, CGRectGetMinY(frame) + 12.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.93, CGRectGetMinY(frame) + 6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 5, CGRectGetMinY(frame) + 6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 5, CGRectGetMinY(frame) + 110)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 102, CGRectGetMinY(frame) + 110)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 102, CGRectGetMinY(frame) + 6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 89.07, CGRectGetMinY(frame) + 6)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 95.53, CGRectGetMinY(frame) + 103.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 11.47, CGRectGetMinY(frame) + 103.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 11.47, CGRectGetMinY(frame) + 32)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 95.53, CGRectGetMinY(frame) + 32)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 95.53, CGRectGetMinY(frame) + 103.5)];
    [bezierPath closePath];
    bezierPath.miterLimit = 4;
    
    [color0 setFill];
    [bezierPath fill];
    
    
}


@end
