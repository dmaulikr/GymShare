//
//  DPRDatabaseHelper.m
//  GymShare
//
//  Created by David Richardson on 11/24/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRDatabaseHelper.h"

@import FirebaseDatabase;

@interface DPRDatabaseHelper()

@property (strong, nonatomic) FIRDatabaseReference *ref;


@end

@implementation DPRDatabaseHelper


- (void)readFromDatabase{
	
	[[_ref child:@"users"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
		NSDictionary *usersDict = snapshot.value;
		
		NSLog(@"%@",usersDict);
		
	}];
}

@end
