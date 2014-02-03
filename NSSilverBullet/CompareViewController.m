//
//  CompareViewController.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 2/2/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "CompareViewController.h"
#import "FreeTimeViewCell.h"

@interface CompareViewController ()

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
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"FreeTimeView" bundle:nil] forCellWithReuseIdentifier:@"FreeBlock"];
}

#pragma mark DataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FreeTimeViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FreeBlock" forIndexPath:indexPath];
    cell.testLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10.0;
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
