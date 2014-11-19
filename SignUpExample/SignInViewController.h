//
//  SignInViewController.h
//  SignUpExample
//
//  Created by Deepa on 11/17/14.
//  Copyright (c) 2014 Deepa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldEmailId;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

- (IBAction)buttonSigninClicked:(id)sender;

@end
