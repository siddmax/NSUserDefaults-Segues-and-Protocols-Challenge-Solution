//
//  SSScreenViewController.h
//  NSUserDefaults, Segues and Protocols Challenge Solution
//
//  Created by Saurav Sharma on 9/17/14.
//  Copyright (c) 2014 ZineOne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSScreenViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *usernameTextLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordTextLabel;
@property (strong, nonatomic) NSString *usernameFromTextField;
@property (strong, nonatomic) NSString *passwordFromTextField;

- (IBAction)backBarButtonPressed:(UIBarButtonItem *)sender;

@end
