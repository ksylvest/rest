//
//  NSString+REST_Regex.m
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "NSString+REST_Regex.h"

@implementation NSString (REST_Regex)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Main

- (NSString *)REST_replace:(NSString *)pattern with:(NSString *)replacement
{
	// Create regular expression.
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
    
	// Perform replacement.
    return [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, self.length) withTemplate:replacement];
}

- (BOOL)REST_matches:(NSString *)pattern
{
	// Create range.
    NSRange range = [self rangeOfString:pattern options:NSRegularExpressionSearch];
	
	// Return presence of range.
    return range.location != NSNotFound;
}

@end
