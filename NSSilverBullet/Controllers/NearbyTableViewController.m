//
//  NearbyTableViewController.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 5/24/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "NearbyTableViewController.h"
#import "PersonHeadTableViewCell.h"

@interface NearbyTableViewController ()

@end

@implementation NearbyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - Multipeer Nearby Delegate

- (void)manager:(MultipeerManager *)manager didDiscoverUser:(PeerConnection *)user
{
    NSLog(@"%@", user);
}

- (void)manager:(MultipeerManager *)manager didLoseUser:(PeerConnection *)user
{
    NSLog(@"%@", user);
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Nearby";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"person" forIndexPath:indexPath];
    return cell;
}

@end
