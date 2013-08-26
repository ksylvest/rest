//
//  NSString+REST_Regex.h
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (REST_Regex)

- (NSString *)REST_replace:(NSString *)pattern with:(NSString *)replacement;
- (BOOL)REST_matches:(NSString *)pattern;

@end
