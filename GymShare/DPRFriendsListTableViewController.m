//
//  DPRFriendsListTableViewController.m
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRFriendsListTableViewController.h"
#import "DPRFriendTableViewCell.h"
#import "UIColor+CustomColors.h"

@interface DPRFriendsListTableViewController ()

@end

@implementation DPRFriendsListTableViewController

- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	[self setupData];
	[self setupUI];
	
}

- (void)setupData{
	
}

- (void)setupUI{
	
	self.title = @"Friends";
	self.view.backgroundColor = [UIColor darkColor];
	[self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
	
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *identifier = @"friendCell";
	
	DPRFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
	
	// sample
	cell.image.image = [UIImage imageNamed:@"user_image"];
	cell.title.text = @"Title";
	cell.subtitle.text = @"Subtitle";
	
	return cell;
}

// section title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *title;
	
	if(section == 0){
		title = @"FRIENDS";
	}
	
	return title;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
	view.tintColor = [UIColor darkColor];
	view.layer.zPosition = -999;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
