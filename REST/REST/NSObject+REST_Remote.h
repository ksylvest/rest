//
//  NSObject+REST_Remote.h
//  REST
//
//  Created by Kevin Sylvestre on 7/31/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RESTSuccess)(id object);
typedef void (^RESTFailure)(NSError *error);

@interface NSObject (REST_Remote)

- (NSDictionary *)REST_properties;

+ (void)REST_find;
+ (void)REST_findWithIdentifier:(NSNumber *)identifier success:(RESTSuccess)success failure:(RESTFailure)failure;
+ (void)REST_findWithPath:(NSString *)path success:(RESTSuccess)success failure:(RESTFailure)failure;
+ (void)REST_findWithURL:(NSURL *)url success:(RESTSuccess)success failure:(RESTFailure)failure;

+ (void)REST_create:(NSDictionary *)parameters success:(RESTSuccess)success failure:(RESTFailure)failure;
+ (void)REST_create:(NSDictionary *)parameters path:(NSString *)path success:(RESTSuccess)success failure:(RESTFailure)failure;
+ (void)REST_create:(NSDictionary *)parameters url:(NSURL *)url success:(RESTSuccess)success failure:(RESTFailure)failure;

- (void)REST_update:(NSDictionary *)parameters success:(RESTSuccess)success failure:(RESTFailure)failure;
- (void)REST_update:(NSDictionary *)parameters path:(NSString *)path success:(RESTSuccess)success failure:(RESTFailure)failure;
- (void)REST_update:(NSDictionary *)parameters url:(NSURL *)url success:(RESTSuccess)success failure:(RESTFailure)failure;

- (void)REST_delete;
- (void)REST_deleteWithPath:(NSString *)path success:(RESTSuccess)success failure:(RESTFailure)failure;
- (void)REST_deleteWithURL:(NSURL *)url success:(RESTSuccess)success failure:(RESTFailure)failure;

@end
