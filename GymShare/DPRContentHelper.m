//
//  DPRContentHelper.m
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRContentHelper.h"
#import <UIKit/UIKit.h>

@implementation DPRContentHelper

- (NSString *)contentTextWithPageType:(NSString *)pageType {
	
	NSString *contentText;
	
	if([pageType isEqualToString:@"About"]){
		contentText = [self aboutContent];
	}
	else if([pageType isEqualToString:@"Licenses"]){
		contentText = [self licensesContent];
	}
	
	return contentText;
	
}

- (NSAttributedString *)helpContent{
	
	// make content
	NSMutableString *content = [[NSMutableString alloc] init];
	[content appendString:@"Help goes here."];
	
	// attribute content
	NSMutableAttributedString *attributedContent = [[NSMutableAttributedString alloc] initWithString:content];
	
	return attributedContent;
}

- (NSString *)aboutContent{
	
	NSMutableString *content = [[NSMutableString alloc] init];
	[content appendString:@"2016 David Richardson\n"];
	[content appendString:@"Software engineer, USC graduate."];
	
	return content;
}

- (NSString *)licensesContent{
	
	NSMutableString *content = [[NSMutableString alloc] init];
	[content appendString:@"Licenses go here."];
	
	return content;
	
}


@end
