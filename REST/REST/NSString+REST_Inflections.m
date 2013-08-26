//
//  NSString+REST_Inflections.m
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "NSString+REST_Inflections.h"
#import "NSString+REST_Regex.h"

@implementation NSString (REST_Inflections)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Main

- (NSString *)REST_pluralize
{    
    // Check common pluralizations ('oes', 'ies', 's').
    if ([self REST_matches:@"o$"]) return [self REST_replace:@"o$" with:@"oes"];
    if ([self REST_matches:@"y$"]) return [self REST_replace:@"y$" with:@"ies"];
    if ([self REST_matches:@"$"]) return [self REST_replace:@"$" with:@"s"];
    
    // Default.
    return self;
}

- (NSString *)REST_singularize
{    
    // Check common singularizations ('o', 'y', '').
    if ([self REST_matches:@"oes$"]) return [self REST_replace:@"oes$" with:@"o"];
    if ([self REST_matches:@"ies$"])    return [self REST_replace:@"ies$" with:@"y"];
    if ([self REST_matches:@"s$"]) return [self REST_replace:@"s$" with:@""];
    
    // Default.
    return self;
}

- (NSString *)REST_classify
{
    // Create result.
    NSString *result = self;
    
    // Capitalize result.
    result = [result capitalizedString];
    
    // Strip result.
    result = [result REST_replace:@"([^a-zA-Z0-9])+" with:@""];
    
    // Converted result.
    return result;
}

- (NSString *)REST_pathify
{
    // Create result.
    NSString *result = self;
    
    // Downcase result.
    result = [result lowercaseString];
    
    // Patherize result.
    result = [result REST_replace:@"([^a-zA-Z0-9])+" with:@""];
    
    return result;
}

- (NSString *)REST_parameterize
{    
    // Create result.
    NSString *result = self;
    
    // Dasherize result.
    result = [result REST_replace:@"([A-Z]+)([A-Z][a-z]+)" with:@"$1-$2"];
    result = [result REST_replace:@"([a-z]+)([A-Z])" with:@"$1-$2"];
    
    // Downcase result.
    result = [result lowercaseString];
    
    // Return converted result.
    return result;
}

@end
