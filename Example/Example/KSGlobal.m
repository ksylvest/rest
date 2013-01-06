//
//  KSGlobal.m
//  Example
//
//  Created by Kevin Sylvestre on 1/6/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSGlobal.h"

@implementation KSGlobal

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
