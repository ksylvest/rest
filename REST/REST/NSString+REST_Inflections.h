//
//  NSString+REST_Inflections.h
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (REST_Inflections)

- (NSString *)REST_pluralize;
- (NSString *)REST_singularize;

- (NSString *)REST_classify;
- (NSString *)REST_pathify;

- (NSString *)REST_parameterize;

@end
