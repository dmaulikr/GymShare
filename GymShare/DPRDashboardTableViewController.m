//
//  DPRDashboardTableViewController.m
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRDashboardTableViewController.h"
#import "DPRUIHelper.h"
#import "DPRDashboardTableViewCell.h"
#import "UIColor+CustomColors.h"

@interface DPRDashboardTableViewController ()

@property (strong, nonatomic) DPRUIHelper *uiHelper;

@end

@implementation DPRDashboardTableViewController

- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	[self setupUI];
	[self setupData];
}

- (void)setupUI{
	
	// ui helper
	self.uiHelper = [[DPRUIHelper alloc] init];
	[_uiHelper setupTabUI:self withTitle:@"Dashboard"];
	
	self.view.backgroundColor = [UIColor darkColor];
	[self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
	
	// backbutton
	UIBarButtonItem *newBackButton =
	[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain
									target:nil
									action:nil];
	[[self navigationItem] setBackBarButtonItem:newBackButton];
	
	// settingsbutton
	UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"settings_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(showSettings)];
	settingsButton.tintColor = [UIColor lightPurpleColor];
	UIFont *customFont = [UIFont fontWithName:@"Helvetica" size:24.0];
	NSDictionary *fontDictionary = @{NSFontAttributeName : customFont};
	[settingsButton setTitleTextAttributes:fontDictionary forState:UIControlStateNormal];
	self.navigationItem.rightBarButtonItem = settingsButton;
}

- (void)showSettings{
	
}

- (void)setupData{
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *identifier = @"dashboardCell";
	
    DPRDashboardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
	
	// profile
	if(indexPath.section == 0){
		//cell.image.image = [UIImage imageNamed:@"handshake.png"];
		cell.title.text = @"Profile";
		cell.subtitle.text = @"View your profile page.";
	}
	// friends
	else if(indexPath.section == 1){
		cell.title.text = @"Friends";
		cell.subtitle.text = @"View your friends' profile pages to browse their public workouts.";
	}
	cell.image.image = [UIImage imageNamed:@"user_image"];

    return cell;
}

// section title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	
	NSString *title;
	
	if(section == 0){
		title = @"PROFILE";
	}
	else{
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
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}


@end
