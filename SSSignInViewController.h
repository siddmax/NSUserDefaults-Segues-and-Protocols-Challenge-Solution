//
//  SSSignInViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Saurav Sharma on 9/17/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCreateAccountViewController.h"

@interface SSSignInViewController : UIViewController <SSCreateAccountDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)loginButtonPressed:(UIButton *)sender;
- (IBAction)createAccountBarButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)processDateButtonPressed:(UIButton *)sender;
- (IBAction)editingEnded:(id)sender;

@end
