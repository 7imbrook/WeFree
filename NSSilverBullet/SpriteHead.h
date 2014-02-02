//
//  SpriteHead.h
//  NSSilverBullet
//
//  Created by Michael Timbrook on 2/2/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@protocol OTSpriteTouchDelegate <NSObject>

- (void)sprite:(SKSpriteNode *)node touched:(BOOL)touched;

@end

@interface SpriteHead : SKSpriteNode

@property (strong) id<OTSpriteTouchDelegate> delegate;

@end
