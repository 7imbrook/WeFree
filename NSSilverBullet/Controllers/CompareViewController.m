//
//  CompareViewController.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 2/2/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

@import EventKit;

#import "CompareViewController.h"
#import "FreeTimeViewCell.h"
#import <Colours/UIColor+Colours.h>
#import <RZSquaresLoading/RZSquaresLoading.h>
#import "EventStoreManager.h"

@interface CompareViewController ()

@property (strong) NSArray *events;

@end

@implementation CompareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    RZSquaresLoading *loading = [[RZSquaresLoading alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    loading.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height / 2.0);
    loading.color = [UIColor chartreuseColor];
    [self.view addSubview:loading];

    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

    self.view.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"FreeTimeView" bundle:nil] forCellWithReuseIdentifier:@"FreeBlock"];

    EventStoreManager *eventStoreManager = [EventStoreManager new];
    [eventStoreManager requestEventStoreAccessWithCompletion:^(NSArray *events){
        _events = [events copy];
        [loading removeFromSuperview];
        [self.collectionView reloadData];
    }];
}

#pragma mark DataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    EKEvent *event = _events[(int)floorf(indexPath.row / 2)];

    FreeTimeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FreeBlock" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor chartreuseColor];
    cell.title.text = event.title;
    cell.startDate.text = event.startDate.description;
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _events.count * 2;
}

#pragma mark Delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
