//
//  REST.h
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "NSObject+REST.h"

@interface REST : NSObject

+ (NSURL *)getURL;
+ (NSURL *)getURLWithPath:(NSString *)path;

+ (void)setUser:(NSString *)user;
+ (NSString *)getUser;

+ (void)setPassword:(NSString *)user;
+ (NSString *)getPassword;

+ (void)setScheme:(NSString *)scheme;
+ (NSString *)getScheme;

+ (void)setHost:(NSString *)host;
+ (NSString *)getHost;

+ (void)setFormat:(NSString *)format;
+ (NSString *)getFormat;

@end
