//
//  SignUpViewController.m
//  SignUpExample
//
//  Created by Deepa on 11/17/14.
//  Copyright (c) 2014 Deepa. All rights reserved.
//

#import "SignUpViewController.h"
#import "Constants.h"


@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SignUp";
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

- (IBAction)signupClicked:(id)sender {
    if (self.firstNameTextField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter first name" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
    else if (self.lastNameTextField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter last name" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
    else if (self.emailIDTextField.text.length ==0) {
        UIAlertView *alertView =[[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Please enter email id" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
    else if (self.passwordTextField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Please enter password" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
    else {
        PFQuery *query = [PFQuery queryWithClassName:kTable_Users];
        [query whereKey:@"EmailID" equalTo:self.emailIDTextField.text];
        [query countObjectsInBackgroundWithBlock:^(int number, NSError *error) {
            if (number > 0) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"Email registered with as already" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alertView show];
            }
            else {
                PFObject *object = [PFObject objectWithClassName:kTable_Users];
                object[@"FirstName"] = self.firstNameTextField.text;
                object[@"LastName"] = self.lastNameTextField.text;
                object[@"EmailID"] = self.emailIDTextField.text;
                object[@"Password"] = self.passwordTextField.text;
                [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded == YES) {
                        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                        [userDefaults setValue:self.firstNameTextField.text forKey:@"FirstName"];
                        [userDefaults setValue:self.lastNameTextField.text forKey:@"LastName"];
                        [userDefaults setValue:self.emailIDTextField.text forKey:@"EmailID"];
                        [userDefaults synchronize];
                        
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You have registered successfully" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                        [alertView show];
                    }
                    else {
                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:@"There is a problem in registration" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                        [alertView show];
                    }
                }];
            }
        }];
    }
}
#pragma mark - UITextFieldDelegate methods
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGRect rectView = self.view.frame;
    rectView.origin.y = -textField.frame.origin.y + 70;
    self.view.frame = rectView;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    CGRect rectView = self.view.frame;
    rectView.origin.y = 0;
    self.view.frame = rectView;
    [textField resignFirstResponder];
    return YES;
}

@end
