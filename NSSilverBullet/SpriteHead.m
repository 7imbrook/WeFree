//
//  SpriteHead.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 2/2/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "SpriteHead.h"

@implementation SpriteHead

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([_delegate respondsToSelector:@selector(sprite:touched:)]) {
        [_delegate sprite:self touched:YES];
    }
}

@end
