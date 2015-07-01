//
//  LoginViewController.m
//  ios-call-your-facebook-friends
//
//  Created by Ali Minty on 6/21/15.
//  Copyright (c) 2015 Ali Minty. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface LoginViewController ()
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.readPermissions = @[@"public_profile", @"user_friends"];
    
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        
        [self displayPictureForUser];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserDidLoginNotification"
                                                            object:nil
                                                          userInfo:@{@"userId" : [[FBSDKAccessToken currentAccessToken] userID]}];
        
        [self performSegueWithIdentifier:@"showMaster" sender:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)ContinueAction:(id)sender {
    if ([FBSDKAccessToken currentAccessToken]) {
        
        [self displayPictureForUser];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UserDidLoginNotification"
                                                            object:nil
                                                          userInfo:@{@"userId" : [[FBSDKAccessToken currentAccessToken] userID]}];
        
        [self performSegueWithIdentifier:@"showMaster" sender:nil];
    }
}

- (void) displayPictureForUser {
    NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", [[FBSDKAccessToken currentAccessToken] userID]]];
    NSData *imageData = [NSData dataWithContentsOfURL:pictureURL];
    UIImage *img = [UIImage imageWithData:imageData];
    CGSize size = img.size;
    CGRect rectFrame = CGRectMake(90, 100, size.width, size.height);
    UIImageView* imgv = [[UIImageView alloc] initWithImage:img];
    imgv.frame = rectFrame;
    [self.view addSubview:imgv];
}

@end
