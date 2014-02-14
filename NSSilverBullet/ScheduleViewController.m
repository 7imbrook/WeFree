//
//  ScheduleViewController.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 1/30/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "ScheduleViewController.h"

@implementation ScheduleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view.
    UISwipeGestureRecognizer *oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc]
                                                      initWithTarget:self
                                                      action:@selector(oneFingerSwipeRight:)];
    [oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:oneFingerSwipeRight];
    
}

- (void)oneFingerSwipeRight:(UITapGestureRecognizer *)recognizer
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - EventStore methods

- (void)requestFreetimeBlocksCompletion:(void(^)(NSArray *events))completion
{

}


#pragma mark - Helpers

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
