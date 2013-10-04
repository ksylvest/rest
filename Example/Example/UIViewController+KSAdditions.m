//
//  UIViewController+KSAdditions.m
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "UIViewController+KSAdditions.h"
#import "UIView+KSAdditions.h"

#import "KSSpinnerView.h"

#import "KSConstants.h"

@implementation UIViewController (KSAdditions)

static NSInteger kCustomSpinnerViewTag = (NSInteger)(&kCustomSpinnerViewTag);

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Spinners

- (UIView *)activeSpinnerView
{
    UIView *parent = self.view;
    if (parent.superview) parent = parent.superview;

    return [parent viewWithTag:kCustomSpinnerViewTag];
}

- (BOOL)hasSpinnerView
{
    return !![self activeSpinnerView];
}

- (void)presentSpinnerView
{
    if ([self hasSpinnerView]) return;
    
    UIView *spinner = [KSSpinnerView create];
    spinner.tag = kCustomSpinnerViewTag;
    
    UIView *parent = self.view;
    if (parent.superview) parent = parent.superview;
    
    [parent addSubview:spinner];

    spinner.frame = (CGRect){ CGPointZero, parent.frame.size };
    
    [spinner setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    
    spinner.alpha = 0.0f;
    id animations = ^{
        spinner.alpha = 1.0f;
    };
    
    [UIView animateWithDuration:KSAnimationDurationFast animations:animations];
}

- (void)dismissSpinnerView
{
    if (![self hasSpinnerView]) return;
    
    UIView *spinner = [self activeSpinnerView];
    
    spinner.alpha = 1.0f;
    id animations = ^{
        spinner.alpha = 0.0f;
    };
    
    id completion = ^{
        [spinner removeFromSuperview];
    };
    
    [UIView animateWithDuration:KSAnimationDurationFast animations:animations completion:completion];
}

@end
