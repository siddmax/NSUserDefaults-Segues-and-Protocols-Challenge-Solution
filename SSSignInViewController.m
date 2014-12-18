//
//  SSSignInViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Saurav Sharma on 9/17/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import "SSSignInViewController.h"
#import "SSScreenViewController.h"

@interface SSSignInViewController ()

@end

@implementation SSSignInViewController

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
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
    
    self.textView.delegate = self;
    
    NSMutableArray *myMutableArray = [@[@1, @"Hello", @23, @"Hey"] mutableCopy];
    [myMutableArray insertObject:@"I'm first" atIndex:0];
    [myMutableArray removeObjectAtIndex:2];
    NSLog(@"%@", myMutableArray);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
//    if ([sender isKindOfClass:[UIButton class]])
//    {
        if ([segue.destinationViewController isKindOfClass:[SSCreateAccountViewController class]])
        {
            SSCreateAccountViewController *addAccount = segue.destinationViewController;
            addAccount.delegate = self;
        }
//    }
    
//    if ([sender isKindOfClass:[UIBarButtonItem class]])
//    {
//        if ([segue.destinationViewController isKindOfClass:[SSScreenViewController class]])
//        {
//            SSScreenViewController *nextViewController = segue.destinationViewController;
//            nextViewController.usernameFromTextField = self.usernameTextField.text;
//            nextViewController.passwordFromTextField = self.passwordTextField.text;
//        }
//    }
    
}
#pragma mark - Create Account Protocol Methods

- (void)didCreateAccount
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - IBActions

- (IBAction)loginButtonPressed:(UIButton *)sender
{
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    NSString *password = [[NSUserDefaults standardUserDefaults] objectForKey:USER_PASSWORD];
    
    if (!([self.usernameTextField.text isEqualToString:username]))
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You entered the incorrect username" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else if (!([self.passwordTextField.text isEqualToString:password]))
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You entered the incorrect password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else
    {
        [self performSegueWithIdentifier:@"toScreenViewController" sender:sender];
    }
}

- (IBAction)createAccountBarButtonPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toCreateAccountViewController" sender:sender];
}

- (IBAction)processDateButtonPressed:(UIButton *)sender
{
    NSDate *date = self.datePicker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *stringFromDate = [formatter stringFromDate:date];
    NSLog(@"%@", stringFromDate);
    NSLog(@"%@", [NSDate date]);
    int timeInterval = [date timeIntervalSince1970];
    NSLog(@"%i", timeInterval);
}

- (IBAction)editingEnded:(id)sender
{
    [sender resignFirstResponder];
}

#pragma mark - Resign Text Fields

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [self.textView resignFirstResponder];
        return NO;
    }
    else return YES;
}

@end
