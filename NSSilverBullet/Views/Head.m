//
//  Head.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 5/25/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "Head.h"

@implementation Head

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];

    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(12.5, 5.5, 56, 56)];
    [fillColor setFill];
    [ovalPath fill];
    [strokeColor setStroke];
    ovalPath.lineWidth = 1;
    [ovalPath stroke];

    //// Text Drawing
    CGRect textRect = CGRectMake(0, 64, 80, 16);
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentCenter;

    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 12], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: textStyle};

    [_name drawInRect: textRect withAttributes: textFontAttributes];

}

@end
