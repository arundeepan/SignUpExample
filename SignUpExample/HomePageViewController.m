//
//  HomePageViewController.m
//  SignUpExample
//
//  Created by Deepa on 11/17/14.
//  Copyright (c) 2014 Deepa. All rights reserved.
//

#import "HomePageViewController.h"
#import "SignUpHomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleDone target:self action:@selector(logoutClicked)];
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
#pragma mark - Custom methods

- (void)logoutClicked {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"EmailID"];
    [userDefaults synchronize];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignUpHomePageViewController *homePage = [storyBoard instantiateViewControllerWithIdentifier:@"SignUpHomePage"];
    [self.navigationController pushViewController:homePage animated:YES];
}

@end
