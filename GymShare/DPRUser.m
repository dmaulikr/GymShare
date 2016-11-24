//
//  DPRUser.m
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRUser.h"

@implementation DPRUser

- (void)addInformation:(NSDictionary *)info withDatabaseReference:(FIRDatabaseReference *)ref{

	// information
	NSString *name = [info objectForKey:@"name"];
	NSString *idNumber = [info objectForKey:@"id"];
	NSString *image_url = [[[info objectForKey:@"picture"] objectForKey:@"data"] objectForKey:@"url"];
	
	// insert into database
	[[[ref child:@"users"] child:idNumber]
	 setValue:@{@"username": name,
				@"image_url": image_url}];
	
	// add to user information
	self.fullName = name;
	self.idNumber = idNumber;
	
	NSURL *url = [NSURL URLWithString:image_url];
	NSData *data = [NSData dataWithContentsOfURL:url];
	UIImage *picture = [[UIImage alloc] initWithData:data];
	self.picture = picture;
	
	// workouts
	self.workouts = [[NSMutableArray alloc] init];

}

// shared instance
+ (instancetype)sharedModel {
	
	static DPRUser *_sharedModel = nil;
	
	static dispatch_once_t onceToken;
	
	dispatch_once (&onceToken, ^{
		_sharedModel = [[self alloc] init];
	});
	return _sharedModel;
	
}

@end
