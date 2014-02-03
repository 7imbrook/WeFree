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

        self.backgroundColor = [UIColor seafoamColor];
        
        if (image) {
            CGPoint center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
            head = [self floatingHeadWithImage:image name:@"" touchDelegate:nil pulsing:YES];
            head.position = CGPointMake(center.x, -100);
            [self addChild:head];
        }
    }
    return self;
}

- (void)animateMainHeadOffScreen
{

}

- (void)animateMainHeadToScreen
{
    CGPoint center = CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0);
    [head runAction:[SKAction moveTo:CGPointMake(center.x, 100) duration:0.5]];
}

- (SKSpriteNode *)floatingHeadWithImage:(UIImage *)image name:(NSString *)nodename touchDelegate:(id<OTSpriteTouchDelegate>)delegate pulsing:(BOOL)pulse
{
    // Create Head
    UIImage *img = [UIImage roundedImageWithImage:image];
    SKTexture *texture = [SKTexture textureWithImage:img];
    SpriteHead *headSet = [SpriteHead spriteNodeWithTexture:texture size:CGSizeMake(100, 100)];
    headSet.delegate = delegate;
    headSet.userInteractionEnabled = YES;
    
    // Add Text
    SKLabelNode *name = [SKLabelNode labelNodeWithFontNamed:@"Avenir-Light"];
    name.text = nodename;
    name.fontSize = 14.0;
    name.fontColor = [UIColor infoBlueColor];
    name.position = CGPointMake(0, -65);
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
