//
//  KSAppDelegate.h
//  Example
//
//  Created by Kevin Sylvestre on 1/6/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory;

@end
