//
//  KSApplication.h
//  Example
//
//  Created by Kevin Sylvestre on 9/7/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *KSApplicationAuthenticated = @"KSApplicationAuthenticated";
static NSString *KSApplicationDeauthenticated = @"KSApplicationAuthenticated";

@class KSSession;
@class KSUser;

@interface KSApplication : NSObject

+ (BOOL)authenticated;

+ (void)authenticate:(KSSession *)session;
+ (void)deauthenticate;

+ (KSUser *)user;

+ (NSNotificationCenter *)authenticationNotificationCenter;

@end
