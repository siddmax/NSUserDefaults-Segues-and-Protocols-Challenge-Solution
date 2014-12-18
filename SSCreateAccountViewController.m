//
//  SSCreateAccountViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Saurav Sharma on 9/17/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import "SSCreateAccountViewController.h"
#import "SSSignInViewController.h"

@interface SSCreateAccountViewController ()

@end

@implementation SSCreateAccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)createAccountButtonPressed:(UIButton *)sender
{
    if ((self.usernameTextField.text.length == 0) || (self.passwordTextField.text.length == 0) || (self.confirmPasswordTextField.text.length == 0)) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill in all the text fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else if (self.passwordTextField.text.length <= 5) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Password needs to be 6 characters or more" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else if (!([self.confirmPasswordTextField.text isEqualToString: self.passwordTextField.text])) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your password confirmation was incorrect" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setObject:self.usernameTextField.text forKey:USER_NAME];
        [[NSUserDefaults standardUserDefaults] setObject:self.passwordTextField.text forKey:USER_PASSWORD];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.delegate didCreateAccount];
    }
}

- (IBAction)cancelButtonPressed:(UIButton *)sender
{
    [self.delegate didCancel];
}

- (IBAction)editingEnded:(id)sender
{
    [sender resignFirstResponder];
}

@end
