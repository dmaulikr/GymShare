//
//  DPRSettingsTableViewCell.m
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRSettingsTableViewCell.h"
#import "DPRUIHelper.h"
#import "UIColor+CustomColors.h"

@implementation DPRSettingsTableViewCell

- (void)awakeFromNib {
	
	[super awakeFromNib];
	
	self.title.font = [UIFont boldSystemFontOfSize:14];
	self.subtitle.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.0];
	self.backgroundColor = [UIColor charcoalColor];
	self.title.textColor = [UIColor whiteColor];
	self.image.layer.cornerRadius = 70/8;
	self.image.clipsToBounds = YES;
	
	// border
	DPRUIHelper *helper = [[DPRUIHelper alloc] init];
	[helper setupCell:self];
	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
