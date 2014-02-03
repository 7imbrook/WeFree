//
//  NearbyScene.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 2/1/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "NearbyScene.h"
#import "SpriteHead.h"
#import "UIImage+RoundedImage.h"
#import <UIColor+Colours.h>

@implementation NearbyScene
{
    SKSpriteNode *head;
}
- (id)initWithSize:(CGSize)size andHeadImage:(UIImage *)image
{
    self = [super initWithSize:size];
    if (self) {

        self.backgroundColor = [UIColor charcoalColor];
        
        if (image) {
            head = [self floatingHeadWithImage:image name:@"" touchDelegate:nil pulsing:YES];
            head.position = CGPointMake(50, 50);
            [self addChild:head];
        }
    }
    return self;
}

- (SKSpriteNode *)floatingHeadWithImage:(UIImage *)image name:(NSString *)nodename touchDelegate:(id<OTSpriteTouchDelegate>)delegate pulsing:(BOOL)pulse
{
    // Create Head
    UIImage *img = [UIImage roundedImageWithImage:image];
    SKTexture *texture = [SKTexture textureWithImage:img];
    CGSize size = pulse ? CGSizeMake(70, 70) : CGSizeMake(120, 120);
    SpriteHead *headSet = [SpriteHead spriteNodeWithTexture:texture size:size];
    headSet.delegate = delegate;
    headSet.userInteractionEnabled = YES;
    
    // Add Text
    SKLabelNode *name = [SKLabelNode labelNodeWithFontNamed:@"Avenir-Light"];
    name.text = nodename;
    name.fontSize = 16.0;
    name.fontColor = [UIColor whiteColor];
    name.position = CGPointMake(0, -80);
    [headSet addChild:name];

    if (pulse) {
        // Create Pulse
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Pulse" ofType:@"sks"];
        SKEmitterNode *pulse = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        pulse.particlePosition = CGPointMake(0, 0);
        [headSet addChild:pulse];
    }
    return headSet;
}

@end
