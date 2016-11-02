//
//  DPRUIHelper.h
//  GymShare
//
//  Created by David Richardson on 11/2/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DPRUIHelper : NSObject


// methods
- (void)setupTabUI:(UIViewController *)viewController withTitle:(NSString *)title;
- (void)setupCell:(UITableViewCell *)cell;


@end
