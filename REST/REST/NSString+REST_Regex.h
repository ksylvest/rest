//
//  NSString+REST_Regex.h
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

@interface NSString (REST_Regex)

- (NSString *)REST_replace:(NSString *)pattern with:(NSString *)replacement;
- (BOOL)REST_matches:(NSString *)pattern;

@end
