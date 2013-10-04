//
//  REST.h
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "NSObject+REST_Extensions.h"
#import "NSObject+REST_Remote.h"
#import "RESTScope.h"

typedef void (^RESTOperation)(void);

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

+ (void)background:(RESTOperation)operation priority:(NSInteger)priority;
+ (void)background:(RESTOperation)operation;
+ (void)foreground:(RESTOperation)operation;

@end
