//
//  DPRUser.h
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@import FirebaseDatabase;

@interface DPRUser : NSObject

// properties
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *fullName;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *idNumber;
@property (nonatomic, retain) UIImage *picture;

// methods
+ (instancetype)sharedModel;
- (void)addInformation:(NSDictionary *)info withDatabaseReference:(FIRDatabaseReference *)ref;

@end
