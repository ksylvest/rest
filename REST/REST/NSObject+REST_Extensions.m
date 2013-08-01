//
//  NSObject+REST_Extensions.m
//  REST
//
//  Created by Kevin Sylvestre on 7/30/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "NSObject+REST_Extensions.h"

#import "RESTScope.h"

@implementation NSObject (REST_Extensions)

- (RESTScope *)REST_scope
{
    if ([self isKindOfClass:[RESTScope class]]) return (RESTScope *)self;
    else return [[RESTScope alloc] initWithClass:[self class]];
}

- (RESTScope *)REST_where:(id)parameters
{
    RESTScope *scope = [self REST_scope];
    return [scope where:parameters];
}

- (RESTScope *)REST_order:(id)parameters
{
    RESTScope *scope = [self REST_scope];
    return [scope order:parameters];
}

- (RESTScope *)REST_find:(id)parameters
{
    RESTScope *scope = [self REST_scope];
    return [scope find:parameters];
}

- (RESTScope *)REST_limit:(NSInteger)limit
{
    RESTScope *scope = [self REST_scope];
    return [scope limit:limit];
}

- (RESTScope *)REST_offset:(NSInteger)offset
{
    RESTScope *scope = [self REST_scope];
    return [scope offset:offset];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Management

+ (id)REST_create:(NSDictionary *)parameters
{
    RESTScope *scope = [self REST_scope];
    return [scope create:parameters];
}

+ (id)REST_create:(NSDictionary *)parameters do:(void (^)(id))block
{
    RESTScope *scope = [self REST_scope];
    return [scope create:parameters block:block];
}

- (void)REST_update:(NSDictionary *)parameters
{
    // TODO.
}

- (void)REST_update:(NSDictionary *)parameters do:(void (^)(id))block
{
    // TODO.
}

@end
