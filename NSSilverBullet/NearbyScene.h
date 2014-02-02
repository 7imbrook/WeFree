//
//  NearbyScene.h
//  NSSilverBullet
//
//  Created by Michael Timbrook on 2/1/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface NearbyScene : SKScene

- (id)initWithSize:(CGSize)size andHeadImage:(UIImage *)image;
- (SKSpriteNode *)floatingHeadWithImage:(UIImage *)image name:(NSString *)nodename pulsing:(BOOL)pulse;

- (void)animateMainHeadToScreen;
- (void)animateMainHeadOffScreen;

@end
