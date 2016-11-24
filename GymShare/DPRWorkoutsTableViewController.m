//
//  DPRWorkoutsTableViewController.m
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRWorkoutsTableViewController.h"
#import "DPRUIHelper.h"
#import "DPRWorkoutsTableViewCell.h"
#import "UIColor+CustomColors.h"

@interface DPRWorkoutsTableViewController ()

@property (strong, nonatomic) DPRUIHelper *uiHelper;

@end

@implementation DPRWorkoutsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self setupUI];
	[self setupData];
	
}

- (void)setupData{
	
}

- (void)setupUI{
	
	// ui helper
	self.uiHelper = [[DPRUIHelper alloc] init];
	[_uiHelper setupTabUI:self withTitle:@"Workouts"];
	
	self.view.backgroundColor = [UIColor darkColor];
	[self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
	
	// backbutton
	UIBarButtonItem *newBackButton =
	[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain
									target:nil
									action:nil];
	[[self navigationItem] setBackBarButtonItem:newBackButton];
	
	// add button
	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWorkout)];
	self.navigationItem.rightBarButtonItem = addButton;
	
}

- (void)addWorkout{
	
	
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString *identifier = @"workoutCell";
	
	DPRWorkoutsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
	
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
		title = @"WORKOUT";
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
