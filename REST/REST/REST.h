//
//  REST.h
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface REST : NSObject

+ (NSURL *)URL;
+ (NSURL *)URLWithPath:(NSString *)path;

+ (NSString *)username;
+ (void)setUsername:(NSString *)username;

+ (NSString *)password;
+ (void)setPassword:(NSString *)password;

+ (NSString *)scheme;
+ (void)setScheme:(NSString *)scheme;

+ (NSString *)host;
+ (void)setHost:(NSString *)host;

+ (NSString *)format;
+ (void)setFormat:(NSString *)format;

@end
