//
//  KSAuthenticationViewController.m
//  Example
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSAuthenticationViewController.h"

typedef enum KSAuthenticationViewControllerMode {
    KSAuthenticationViewControllerModeSignup,
    KSAuthenticationViewControllerModeLogin,
} KSAuthenticationViewControllerMode;

@interface KSAuthenticationViewController ()

@property (nonatomic, weak) IBOutlet UIScrollView *toggleScrollView;
@property (nonatomic, weak) IBOutlet UISegmentedControl *toggleSegmentedControl;
@property (nonatomic, weak) IBOutlet UIPageControl *togglePageControl;
@property (nonatomic, weak) IBOutlet UIView *loginView;
@property (nonatomic, weak) IBOutlet UIView *signupView;

@property (nonatomic, assign) KSAuthenticationViewControllerMode mode;

@end

@implementation KSAuthenticationViewController

///////////////////////////////////////////////////////////////////////

#pragma mark - Main

- (void)viewDidLoad
{
    [super viewDidLoad];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Scrolling

- (void)scrollToPage:(NSInteger)page animated:(BOOL)animated
{
    CGRect frame = self.toggleScrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    
    [self.toggleScrollView scrollRectToVisible:frame animated:animated];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)toggleScrollView
{
    NSInteger page = round(toggleScrollView.contentOffset.x / toggleScrollView.frame.size.width);
    self.mode = (KSAuthenticationViewControllerMode)page;
    
    [self.toggleSegmentedControl setSelectedSegmentIndex:page];
    [self.togglePageControl setCurrentPage:page];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Actions

- (IBAction)toggleSegmentedControlSelector:(id)sender
{
    NSInteger page = self.toggleSegmentedControl.selectedSegmentIndex;
    self.mode = (KSAuthenticationViewControllerMode)page;
    
    [self scrollToPage:page animated:YES];
    [self.togglePageControl setCurrentPage:page];
}

@end
