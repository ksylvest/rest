//
//  KSApplication.m
//  Example
//
//  Created by Kevin Sylvestre on 9/7/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSApplication.h"

@class KSSession;
@class KSUser;

static BOOL authenticated = NO;

@implementation KSApplication

#pragma mark - Globals

+ (BOOL)authenticated
{
    BOOL result;
    
    @synchronized(self)
    {
        result = authenticated;
    }
    
    return result;
}

+ (void)authenticate:(KSSession *)session
{
    @synchronized(self)
    {
        authenticated = YES;
    }
    
    [[self authenticationNotificationCenter] postNotificationName:KSApplicationAuthenticated object:session];
}

+ (void)deauthenticate
{
    @synchronized(self)
    {
        authenticated = NO;
    }
    
    [[self authenticationNotificationCenter] postNotificationName:KSApplicationDeauthenticated object:nil];
}

+ (KSUser *)user
{
    return nil;
}

+ (NSNotificationCenter *)authenticationNotificationCenter
{
    static NSNotificationCenter *nc;
    
    @synchronized(self)
    {
        if (!nc) nc = [[NSNotificationCenter alloc] init];
    }
    
    return nc;
}

@end
