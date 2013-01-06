//
//  NSString+REST_Inflections.h
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

@interface NSString (REST_Inflections)

- (NSString *)REST_pluralize;
- (NSString *)REST_singularize;

- (NSString *)REST_classify;
- (NSString *)REST_pathify;

- (NSString *)REST_parameterize;

@end
