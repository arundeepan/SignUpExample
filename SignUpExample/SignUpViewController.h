//
//  SignUpViewController.h
//  SignUpExample
//
//  Created by Deepa on 11/17/14.
//  Copyright (c) 2014 Deepa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)signupClicked:(id)sender;

@end
