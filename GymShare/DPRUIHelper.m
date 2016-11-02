//
//  DPRUIHelper.m
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRUIHelper.h"
#import "UIColor+CustomColors.h"

@implementation DPRUIHelper


- (void)setupTabUI:(UIViewController *)viewController withTitle:(NSString *)title{
	
	// setup navigationController
	viewController.navigationController.navigationBar.barTintColor = [UIColor darkishColor];
	viewController.navigationController.navigationBar.translucent = NO;
	viewController.navigationController.navigationBar.topItem.title = title;
	[viewController.navigationController.navigationBar
	 setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	// setup viewController
	viewController.view.backgroundColor = [UIColor darkColor];
	
}

- (void)setupCell:(UITableViewCell *)cell{
	
	CALayer *topBorder = [CALayer layer];
	topBorder.borderColor = [UIColor lightGrayColor].CGColor;
	topBorder.borderWidth = 1;
	topBorder.frame = CGRectMake(0, 0, CGRectGetWidth(cell.contentView.frame), 1);
	CALayer *bottomBorder = [CALayer layer];
	bottomBorder.borderColor = [UIColor lightGrayColor].CGColor;
	bottomBorder.borderWidth = 1;
	bottomBorder.frame = CGRectMake(0, 99, CGRectGetWidth(cell.contentView.frame), 1);
	[cell.contentView.layer addSublayer:topBorder];
	[cell.contentView.layer addSublayer:bottomBorder];
	
}

@end
