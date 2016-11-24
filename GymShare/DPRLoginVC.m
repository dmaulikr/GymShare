//
//  DPRLoginVC.m
//  GymShare
//
//  Created by David Richardson on 10/31/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRLoginVC.h"
#import "DPRUser.h"
#import "UIColor+CustomColors.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@import FirebaseDatabase;
@import FirebaseAuth;

@interface DPRLoginVC () <FBSDKLoginButtonDelegate>

@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) DPRUser *user;

@end

@implementation DPRLoginVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    FBSDKAccessToken *accessToken = [FBSDKAccessToken currentAccessToken];
    // show login page
    if (!accessToken) {
        [self setupUI];
    }
    // skip login
    else{
        [self getUserInformation];
    }

}
    
- (void)getUserInformation{
	
	// information retrieval
    NSArray *fieldsArray = @[@"id, ",
                             @"name, ",
                             @"first_name, ",
                             @"last_name, ",
                             @"picture.width(240).height(240)"];
    
    NSMutableString *fields = [[NSMutableString alloc] init];
    for(NSString *field in fieldsArray){
        [fields appendString:field];
    }
	
	// make request
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"/me"
                                  parameters:@{ @"fields" : fields }
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        [self handleRequestCompletionWithResult:result error:error];
    }];
    
    
}
    
- (void)handleRequestCompletionWithResult:(id)result error:(NSError *)error
{
    // error
    if (error) {
        NSString *title = @"Graph Request Fail";
        NSString *message = [NSString stringWithFormat:@"Graph API request failed with error:\n %@", error
                             ];
        [self alertWithTitle:title andMessage:message];
    }
    
    // success
    else {
		[self loginSuccessfulWithResults:result];
    }

}

- (void)loginSuccessfulWithResults:(NSDictionary *)results{
	
	// enter results in database
	[self databaseWithResult:results];

	self.navigationController.navigationBarHidden = YES;
	[self performSegueWithIdentifier:@"dashboardSegue" sender:self];
	
}

#pragma mark - Firebase

- (void)databaseWithResult:(NSDictionary *)info{
	
	// user
	self.user = [DPRUser sharedModel];
	self.ref = [[FIRDatabase database] reference];
	[_user addInformation:info withDatabaseReference:_ref];
	
}
    
#pragma mark - FBSDKLoginButtonDelegate

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error
{

	// after facebook login button interaction
    if (error) {
        [self alertWithTitle:@"Error" andMessage:[NSString stringWithFormat:@"Error: %@", error]];
    } else if (result.isCancelled) {
        [self alertWithTitle:@"Error" andMessage:@"Request canceled"];
    } else {
        [self getUserInformation];
    }

}

#pragma mark - UI

- (void)setupUI{
	
	self.view.backgroundColor = [UIColor darkColor];
	[self loginButton];

}

- (void)loginButton{
	
	// login button
	FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
	loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
	loginButton.center = self.view.center;
	loginButton.delegate = self;
	
	[self.view addSubview:loginButton];
	
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
}


- (void) alertWithTitle:(NSString *)title andMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
