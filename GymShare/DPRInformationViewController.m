//
//  DPRInformationViewController.m
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRInformationViewController.h"
#import "DPRContentHelper.h"
#import "UIColor+CustomColors.h"

@interface DPRInformationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) DPRContentHelper *contentHelper;

@end

@implementation DPRInformationViewController

- (void)viewDidLoad {
	
	[super viewDidLoad];
	[self setupData];
	[self setupUI];
	
}

- (void)setupData{
	
	self.contentHelper = [[DPRContentHelper alloc] init];
}

- (void)setupUI{
	
	self.view.backgroundColor = [UIColor darkColor];
	self.title = _pageType;
	
	// about
	if([_pageType isEqualToString:@"About"]){
		NSString *text = [_contentHelper contentTextWithPageType:_pageType];
		self.bottomLabel.text = text;
		self.bottomLabel.textColor = [UIColor blackColor];
	}
	// help
	else if([_pageType isEqualToString:@"Help"]){
		self.textView.attributedText = [_contentHelper helpContent];
		_bottomLabel.hidden = YES;
	}
	// licenses
	else{
		self.textView.text = [_contentHelper contentTextWithPageType:_pageType];
		_bottomLabel.hidden = YES;
	}
	self.textView.textAlignment = NSTextAlignmentJustified;
	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
