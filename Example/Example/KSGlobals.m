//
//  KSGlobals.m
//  Example
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSGlobals.h"

@implementation KSGlobals

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Main


+ (NSString *)host
{
    return @"localhost:3000";
}

+ (NSString *)scheme
{
    return @"http";
}


+ (NSString *)format
{
    return @"json";
}

@end
