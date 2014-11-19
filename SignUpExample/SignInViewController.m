//
//  SignInViewController.m
//  SignUpExample
//
//  Created by Deepa on 11/17/14.
//  Copyright (c) 2014 Deepa. All rights reserved.
//

#import "SignInViewController.h"
#import <Parse/Parse.h>
#import "HomePageViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SignIn";
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

- (IBAction)buttonSigninClicked:(id)sender {
    UIButton *buttonSubmitTemp = (UIButton *)sender;
    
    NSString *stringEmailId = self.textFieldEmailId.text;
    
    if(stringEmailId.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Please enter organization's unique ID" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
    else {
        PFQuery *query = [PFQuery queryWithClassName:@"Users"];
        [query whereKey:@"EmailID" equalTo:stringEmailId];
        [query countObjectsInBackgroundWithBlock:^(int number, NSError *error) {
            if(number > 0) {
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setValue:stringEmailId forKey:@"EmailID"];
                [userDefaults setValue:@"yes" forKey:@"Users"];
                [userDefaults synchronize];
                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                HomePageViewController *homePage = [storyBoard instantiateViewControllerWithIdentifier:@"homePage"];
                [self.navigationController pushViewController:homePage animated:YES];
                
            }
            else {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Incorrect unique ID" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                [alertView show];
            }
        }];
    }
}

@end
