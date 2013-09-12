//
//  KSHelper.m
//  Example
//
//  Created by Kevin Sylvestre on 8/29/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSHelper.h"

@implementation KSHelper

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Device

+ (BOOL)isPad
{
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
}

+ (BOOL)isPhone
{
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone);

}

+ (NSString *)device
{
    if ([self isPhone]) return @"iPhone";
    if ([self isPad]) return @"iPad";
    abort();
}

@end
