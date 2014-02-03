//
//  NearbyPeopleViewController.h
//  NSSilverBullet
//
//  Created by Michael Timbrook on 2/1/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "MultipeerManager.h"
#import "SpriteHead.h"

@interface NearbyPeopleViewController : UIViewController <MultipeerNearbyDelegate, OTSpriteTouchDelegate, UIAlertViewDelegate>

@end
