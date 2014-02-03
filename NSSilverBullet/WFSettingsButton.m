//
//  WFSettingsButton.m
//  NSSilverBullet
//
//  Created by Brandon Littell on 2/2/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "WFSettingsButton.h"

@implementation WFSettingsButton

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
    UIColor* color0 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, 50, 50);
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 35, CGRectGetMinY(frame) + 26.88)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 35, CGRectGetMinY(frame) + 23.12)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 32.13, CGRectGetMinY(frame) + 22.65)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 31.71, CGRectGetMinY(frame) + 21.62) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 32.02, CGRectGetMinY(frame) + 22.29) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 31.87, CGRectGetMinY(frame) + 21.95)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33.4, CGRectGetMinY(frame) + 19.26)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.74, CGRectGetMinY(frame) + 16.6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 28.38, CGRectGetMinY(frame) + 18.29)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 27.35, CGRectGetMinY(frame) + 17.86) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 28.05, CGRectGetMinY(frame) + 18.12) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.71, CGRectGetMinY(frame) + 17.98)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.87, CGRectGetMinY(frame) + 15)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 23.12, CGRectGetMinY(frame) + 15)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 22.64, CGRectGetMinY(frame) + 17.86)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 21.61, CGRectGetMinY(frame) + 18.29) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 22.29, CGRectGetMinY(frame) + 17.98) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 21.94, CGRectGetMinY(frame) + 18.12)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.25, CGRectGetMinY(frame) + 16.6)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16.6, CGRectGetMinY(frame) + 19.26)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 18.29, CGRectGetMinY(frame) + 21.62)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 17.86, CGRectGetMinY(frame) + 22.65) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 18.12, CGRectGetMinY(frame) + 21.95) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 17.98, CGRectGetMinY(frame) + 22.29)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15, CGRectGetMinY(frame) + 23.12)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 15, CGRectGetMinY(frame) + 26.88)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 17.87, CGRectGetMinY(frame) + 27.36)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 18.29, CGRectGetMinY(frame) + 28.37) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 17.99, CGRectGetMinY(frame) + 27.71) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 18.13, CGRectGetMinY(frame) + 28.05)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 16.6, CGRectGetMinY(frame) + 30.74)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 19.25, CGRectGetMinY(frame) + 33.4)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 21.63, CGRectGetMinY(frame) + 31.7)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 22.64, CGRectGetMinY(frame) + 32.12) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 21.95, CGRectGetMinY(frame) + 31.87) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.29, CGRectGetMinY(frame) + 32.01)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 23.12, CGRectGetMinY(frame) + 35)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 26.87, CGRectGetMinY(frame) + 35)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 27.35, CGRectGetMinY(frame) + 32.12)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 28.37, CGRectGetMinY(frame) + 31.7) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.7, CGRectGetMinY(frame) + 32) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 28.04, CGRectGetMinY(frame) + 31.86)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 30.74, CGRectGetMinY(frame) + 33.4)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 33.4, CGRectGetMinY(frame) + 30.74)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 31.7, CGRectGetMinY(frame) + 28.37)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 32.12, CGRectGetMinY(frame) + 27.36) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 31.87, CGRectGetMinY(frame) + 28.05) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 32.01, CGRectGetMinY(frame) + 27.71)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 35, CGRectGetMinY(frame) + 26.88)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 35, CGRectGetMinY(frame) + 26.88)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 27.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 22.5, CGRectGetMinY(frame) + 25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 23.62, CGRectGetMinY(frame) + 27.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 22.5, CGRectGetMinY(frame) + 26.38)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 22.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 22.5, CGRectGetMinY(frame) + 23.62) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 23.62, CGRectGetMinY(frame) + 22.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 27.5, CGRectGetMinY(frame) + 25) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 26.38, CGRectGetMinY(frame) + 22.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 27.5, CGRectGetMinY(frame) + 23.62)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 25, CGRectGetMinY(frame) + 27.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 27.5, CGRectGetMinY(frame) + 26.38) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 26.38, CGRectGetMinY(frame) + 27.5)];
    [bezierPath closePath];
    bezierPath.miterLimit = 4;
    
    [color0 setFill];
    [bezierPath fill];
    
    
    
}

@end
