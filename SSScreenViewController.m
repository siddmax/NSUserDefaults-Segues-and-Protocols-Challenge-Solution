//
//  SSScreenViewController.m
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Saurav Sharma on 9/17/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import "SSScreenViewController.h"
#import "SSCreateAccountViewController.h"

@interface SSScreenViewController ()

@end

@implementation SSScreenViewController

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
    
    self.usernameTextLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:USER_NAME];
    self.passwordTextLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:USER_PASSWORD];
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

- (IBAction)backBarButtonPressed:(UIBarButtonItem *)sender
{
    //[self performSegueWithIdentifier:@"toSignInViewController" sender:sender];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
