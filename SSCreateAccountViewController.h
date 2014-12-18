//
//  SSCreateAccountViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Saurav Sharma on 9/17/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SSCreateAccountDelegate <NSObject>

@required

-(void)didCreateAccount;
-(void)didCancel;

@end

@interface SSCreateAccountViewController : UIViewController

@property (weak, nonatomic) id <SSCreateAccountDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

- (IBAction)createAccountButtonPressed:(UIButton *)sender;
- (IBAction)cancelButtonPressed:(UIButton *)sender;

@end
