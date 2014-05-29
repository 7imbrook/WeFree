//
//  AppDelegate.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/30/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "AppDelegate.h"
#import "MultipeerManager.h"
#import <FBTweakShakeWindow.h>
#import "NearbyTableViewController.h"
#import <MMDrawerController/MMDrawerController.h>
#import <MMDrawerController/MMDrawerVisualState.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Get root definded ny
    UIViewController *rvc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];

    // Set up connections
    NearbyTableViewController *nearbyController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"NearbyController"];

    MultipeerManager *cmanage = [MultipeerManager new];
    cmanage.delegate = nearbyController;
    [cmanage start];

    // Configure the drawers
    MMDrawerController *drawerController = [[MMDrawerController alloc] initWithCenterViewController:rvc
                                                                          rightDrawerViewController:nearbyController];
    [drawerController setMaximumRightDrawerWidth:80];
    [drawerController setShowsShadow:YES];
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [drawerController setDrawerVisualStateBlock:[MMDrawerVisualState parallaxVisualStateBlockWithParallaxFactor:2.0]];
    [drawerController setShouldStretchDrawer:NO];

    self.window.rootViewController = drawerController;

    return YES;
}

- (UIWindow *)window
{
    if (!_window) {
        _window = [[FBTweakShakeWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    }
    return _window;
}

@end
