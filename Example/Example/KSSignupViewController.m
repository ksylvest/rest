//
//  KSSignupViewController.m
//  Example
//
//  Created by Kevin Sylvestre on 8/28/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSSignupViewController.h"

#import "KSUser.h"
#import "KSSession.h"
#import "KSApplication.h"

#import <REST/REST.h>

@interface KSSignupViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;

@end

@implementation KSSignupViewController

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Actions

- (IBAction)submitButtonSelector:(id)sender
{
    NSString *name = self.nameTextField.text;
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    
    NSDictionary *parameters = @{ KSUserName: name, KSUserEmail: email, KSUserPassword: password };
    
    RESTSuccess success = ^(NSDictionary *response) {
        KSSession *session = [[KSSession alloc] init];
        [KSApplication authenticate:session];
    };
    
    RESTFailure failure = ^(NSError *error) {
        NSString *title = @"Error";
        NSString *message = @"Something went wrong. Please try again.";
        NSString *cancel = @"Dismiss";
        [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancel otherButtonTitles:nil] show];
    };
    
    [KSUser REST_create:parameters success:success failure:failure];

}

@end
