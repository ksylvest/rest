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

@interface KSManageActionableViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *tagsTextField;
@property (nonatomic, weak) IBOutlet UITextView *notesTextView;
@property (nonatomic, weak) IBOutlet UIDatePicker *dateDatePicker;

@end

@implementation KSManageActionableViewController

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Actions

- (IBAction)saveBarButtonItemSelector:(id)sender
{
    [self presentSpinnerView];
}

@end
