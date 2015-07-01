//
//  LoginViewController.h
//  ios-call-your-facebook-friends
//
//  Created by Ali Minty on 6/21/15.
//  Copyright (c) 2015 Ali Minty. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *ContinueButton;
@property (strong, nonatomic) IBOutlet UIImageView *ProfileImageView;
- (IBAction)ContinueAction:(id)sender;

@end
