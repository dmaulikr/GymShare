//
//  DPRUser.h
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DPRUser : NSObject

// properties
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *fullName;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSNumber *lastName;
@property (nonatomic, retain) UIImage *picture;

// methods
- (id)initWithInformation:(NSDictionary *)information;

@end
