//
//  KSSpinnerView.m
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSSpinnerView.h"

#define kCornerRadius (20.0f)

@interface KSSpinnerView ()

@property (nonatomic, weak) IBOutlet UIView *outlineView;

@end

@implementation KSSpinnerView

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

- (void)setupStyling
{
    [self.outlineView.layer setCornerRadius:kCornerRadius];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Lifecycle

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupStyling];
}

@end
