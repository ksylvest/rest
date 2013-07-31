//
//  NSObject+REST_Extensions.h
//  REST
//
//  Created by Kevin Sylvestre on 7/30/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

@class RESTScope;

@interface NSObject (REST_Extensions)

- (id)REST_find:(id)parameters;

- (RESTScope *)REST_scope;
- (RESTScope *)REST_where:(id)parameters;
- (RESTScope *)REST_order:(id)parameters;
- (RESTScope *)REST_limit:(NSNumber *)limit;
- (RESTScope *)REST_offset:(NSNumber *)offset;

+ (id)REST_create:(NSDictionary *)parameters;
+ (id)REST_create:(NSDictionary *)parameters do:(void (^)(id))block;

- (void)REST_update:(NSDictionary *)parameters;
- (void)REST_update:(NSDictionary *)parameters do:(void (^)(id))block;

@end
