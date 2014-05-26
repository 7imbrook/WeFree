//
//  PersonHeadTableViewCell.m
//  NSSilverBullet
//
//  Created by Michael Timbrook on 5/24/14.
//  Copyright (c) 2014 AppChallenge. All rights reserved.
//

#import "PersonHeadTableViewCell.h"
#import "Head.h"

@implementation PersonHeadTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    Head *head = [[Head alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    head.name = @"Michael";
    [self addSubview:head];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
