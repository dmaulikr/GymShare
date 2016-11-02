//
//  DPRLoginVC.m
//  GymShare
//
//  Created by David Richardson on 10/31/16.
//  Copyright © 2016 David Richardson. All rights reserved.
//

#import "DPRLoginVC.h"
#import "UIColor+CustomColors.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@import FirebaseDatabase;
@import FirebaseAuth;

@interface DPRLoginVC () <FBSDKLoginButtonDelegate>

@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

@implementation DPRLoginVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    FBSDKAccessToken *accessToken = [FBSDKAccessToken currentAccessToken];
    // show login page
    if (!accessToken) {
        [self setupUI];
        [self loginButton];
    }
    // skip login
    else{
        [self getUserInformation];
    }

}
    
- (void)loginButton{
	
    // login button
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    loginButton.center = self.view.center;
    loginButton.delegate = self;

    [self.view addSubview:loginButton];
    
}
    
- (void)getUserInformation{
	
	// information retrieval
    NSArray *fieldsArray = @[@"id, ",
                             @"name, ",
                             @"first_name, ",
                             @"last_name, ",
                             @"picture"];
    
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
        //[self alertWithTitle:title andMessage:message];
    }
    
    // success
    else {
        NSDictionary *results = result;
        NSString *title = @"Success";
        NSString *message = [NSString stringWithFormat:@"%@", results];
		//[self alertWithTitle:title andMessage:message];
		[self databaseWithResult:result];
		
		self.navigationController.navigationBarHidden = YES;
		[self performSegueWithIdentifier:@"dashboardSegue" sender:self];
    }

}

- (void)databaseWithResult:(NSDictionary *)dict{
	
	NSString *name = [dict objectForKey:@"name"];
	NSString *identity = [dict objectForKey:@"id"];
	
	self.ref = [[FIRDatabase database] reference];
	[[[_ref child:@"users"] child:identity]
	 setValue:@{@"username": name}];
	
	//[self readFromDatabase];
	
}

- (void)readFromDatabase{
	
	
	[[_ref child:@"users"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
		NSDictionary *usersDict = snapshot.value;
		
		NSLog(@"%@",usersDict);
		
		
		
	}];
}

- (void)setupUI{

	self.view.backgroundColor = [UIColor darkColor];
	
}
    
#pragma mark - FBSDKLoginButtonDelegate

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error
{

    if (error) {
        [self alertWithTitle:@"Error" andMessage:[NSString stringWithFormat:@"Error: %@", error]];
    } else if (result.isCancelled) {
        [self alertWithTitle:@"Error" andMessage:@"Request canceled"];
    } else {
        [self getUserInformation];
    }

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
