//
//  KSAppDelegate.m
//  Example
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSAppDelegate.h"

#import "KSMasterViewController.h"

#import "KSGlobals.h"
#import "KSHelper.h"

@implementation KSAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *name = [NSString stringWithFormat:@"Auth_%@", [KSHelper device]];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController *initialViewController = [storyboard instantiateInitialViewController];
    
    [self.window setRootViewController:initialViewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}
							

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self save];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Data

- (void)save
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges]) [managedObjectContext save:NULL];
    }
}

- (NSURL *)applicationDocumentsDirectory
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *urls = [manager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    NSURL *url = [urls lastObject];
    
    return url;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext == nil)
    {
        NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
        if (coordinator != nil)
        {
            _managedObjectContext = [[NSManagedObjectContext alloc] init];
            [_managedObjectContext setPersistentStoreCoordinator:coordinator];
        }
    }
    
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel == nil)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Example" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator == nil)
    {
        NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Example.sqlite"];
        NSError *error = nil;
        
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    }
    
    return _persistentStoreCoordinator;
}

@end
