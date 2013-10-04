//
//  KSProjectsViewController.m
//  Example
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSProjectsViewController.h"

#import "KSProject.h"

#import <REST/REST.h>

@interface KSProjectsViewController ()

@property (nonatomic, strong) NSFetchedResultsController *searchFetchedResultsController;

@end

@implementation KSProjectsViewController

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Overrides

- (NSFetchedResultsController *)searchFetchedResultsController
{
    if (!_searchFetchedResultsController)
    {
        _searchFetchedResultsController = [[KSProject REST_scope] fetchedResultsController];
    }
    
    return _searchFetchedResultsController;
}

@end
