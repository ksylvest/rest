//
//  KSRootViewController.m
//  Example
//
//  Created by Kevin Sylvestre on 9/7/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSRootViewController.h"

#import "KSApplication.h"

@interface KSRootViewController ()

@property (nonatomic, weak) UIViewController *activeViewController;

@end

@implementation KSRootViewController

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

- (UIViewController *)instantiateChildViewController
{
    NSString *name = [KSApplication authenticated] ? @"Main" : @"Auth";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    return [storyboard instantiateInitialViewController];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initialize];
    
    [[KSApplication authenticationNotificationCenter] addObserver:self selector:@selector(reset) name:KSApplicationAuthenticated object:nil];
    [[KSApplication authenticationNotificationCenter] addObserver:self selector:@selector(reset) name:KSApplicationDeauthenticated object:nil];
}

- (void)dealloc
{
    [[KSApplication authenticationNotificationCenter] removeObserver:self name:KSApplicationAuthenticated object:nil];
    [[KSApplication authenticationNotificationCenter] removeObserver:self name:KSApplicationDeauthenticated object:nil];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Switching

- (void)initialize
{
    self.activeViewController = [self instantiateChildViewController];
    [self.activeViewController willMoveToParentViewController:self];
    [self.view addSubview:self.activeViewController.view];
    [self addChildViewController:self.activeViewController];
}

- (void)reset
{
    UIViewController *childViewController = [self instantiateChildViewController];

    [self addChildViewController:childViewController];
    [self.activeViewController willMoveToParentViewController:nil];
    
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve;
    
    void (^animations)(void) = ^{
        
    };
    
    void (^completion)(BOOL) = ^(BOOL finished){
        [self.activeViewController removeFromParentViewController];
        self.activeViewController = childViewController;
        [self.activeViewController didMoveToParentViewController:self];
    };
    
    [self transitionFromViewController:self.activeViewController toViewController:childViewController
                              duration:0.2 options:options animations:animations completion:completion];
}

@end
