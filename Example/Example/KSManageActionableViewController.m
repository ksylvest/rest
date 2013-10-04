//
//  KSManageActionableViewController.m
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSManageActionableViewController.h"

#import "UIViewController+KSAdditions.h"

#import "KSActionable.h"

#import <REST/REST.h>

@interface KSManageActionableViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *tagsTextField;
@property (nonatomic, weak) IBOutlet UITextView *notesTextView;
@property (nonatomic, weak) IBOutlet UIDatePicker *dueDatePicker;

@end

@implementation KSManageActionableViewController

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Actions

- (NSDictionary *)parameterize
{
    return @{
             KSActionableName: self.nameTextField.text,
             KSActionableTags: self.tagsTextField.text,
             KSActionableNotes: self.nameTextField.text,
             KSActionableDue: self.dueDatePicker.date,
             };
}

- (IBAction)saveBarButtonItemSelector:(UIBarButtonItem *)sender
{
    sender.enabled = NO;
    [self presentSpinnerView];
    
    __block KSManageActionableViewController *vc = self;
    
    RESTSuccess success = ^(id object) {
        [vc dismissSpinnerView];
        sender.enabled = YES;
    };
    
    RESTFailure failure = ^(NSError *failure) {
        [vc dismissSpinnerView];
        sender.enabled = YES;
    };
    
    [KSActionable REST_create:[self parameterize] success:success failure:failure];
}

@end
