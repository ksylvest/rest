//
//  KSLoginViewController.m
//  Example
//
//  Created by Kevin Sylvestre on 8/28/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSLoginViewController.h"

#import "KSUser.h"
#import "KSSession.h"
#import "KSApplication.h"

#import <REST/REST.h>

@interface KSLoginViewController ()

@property (nonatomic, weak) IBOutlet UITextField *emailTextField;
@property (nonatomic, weak) IBOutlet UITextField *passwordTextField;

@end

@implementation KSLoginViewController

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Actions

- (IBAction)submitButtonSelector:(id)sender
{
    NSString *email = self.emailTextField.text;
    NSString *password = self.passwordTextField.text;
    
    NSDictionary *parameters = @{ @"email": email, @"password": password };
    
    RESTSuccess success = ^(id object) {
        KSSession *session = [[KSSession alloc] init];
        [KSApplication authenticate:session];
    };
    
    RESTFailure failure = ^(NSError *error) {
        NSString *title = @"Error";
        NSString *message = @"Something went wrong. Please try again.";
        NSString *cancel = @"Dismiss";
        [[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancel otherButtonTitles:nil] show];
    };
    
    [KSSession REST_create:parameters success:success failure:failure];
}

@end
