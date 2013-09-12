//
//  KSManageTaskViewController.m
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSManageTaskViewController.h"

#import "UIViewController+KSAdditions.h"

@interface KSManageTaskViewController ()

@end

@implementation KSManageTaskViewController

- (IBAction)saveBarButtonItemSelector:(id)sender
{
    [self presentSpinnerView];
}

@end
