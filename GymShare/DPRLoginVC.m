//
//  DPRLoginVC.m
//  GymShare
//
//  Created by David Richardson on 10/31/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRLoginVC.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface DPRLoginVC ()

@end

@implementation DPRLoginVC

- (void)viewDidLoad {
    
    [super viewDidLoad];

    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
