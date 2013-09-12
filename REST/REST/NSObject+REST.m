//
//  NSObject+REST.m
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "NSObject+REST.h"
#import "NSString+REST_Inflections.h"

#import "REST.h"

@implementation NSObject (REST)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

- (NSArray *)REST_properties
{
    return [NSArray array];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Serialization

+ (id)REST_deserialize:(NSData *)data
{
    return nil;
}

- (void)REST_deserialize:(NSData *)data
{
}

- (NSData *)REST_serialize
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSMutableDictionary *project = [NSMutableDictionary dictionary];
    
    [params setObject:project forKey:@"project"];
    
    return [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

+ (NSString *)REST_defaultIndexPath
{
    NSString *format = [REST format];
    NSString *resource = NSStringFromClass(self);
    return [NSString stringWithFormat:@"/%@.%@", resource.REST_pluralize.REST_pathify, format];
}

+ (NSString *)REST_defaultShowPath
{
    NSString *format = [REST format];
    NSString *resource = NSStringFromClass(self);
    return [NSString stringWithFormat:@"/%@.%@", resource.REST_singularize.REST_pathify, format];
}

+ (NSString *)REST_defaultShowPathWithIdentifier:(NSNumber *)identifier
{
    NSString *format = [REST format];
    NSString *resource = NSStringFromClass(self);
    return [NSString stringWithFormat:@"/%@/%@.%@", resource.REST_pluralize.REST_pathify, identifier, format];
}

- (NSString *)REST_defaultShowPath
{
    if ([self respondsToSelector:@selector(identifier)])
    {
        id identifier = [self performSelector:@selector(identifier)];
        return [[self class] REST_defaultShowPathWithIdentifier:identifier];
    }
    else
    {
        return [[self class] REST_defaultShowPath];
    }
}

- (NSString *)REST_defaultCreatePath
{
    NSString *format = [REST format];
    NSString *resource = NSStringFromClass([self class]);
    return [NSString stringWithFormat:@"/%@.%@", resource.REST_pluralize.REST_pathify, format];
}

- (NSString *)REST_defaultUpdatePath
{
    return [self REST_defaultShowPath];
}

- (NSString *)REST_defaultDeletePath
{
    return [self REST_defaultShowPath];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Read

+ (void)REST_find
{
}

+ (void)REST_findWithIdentifier:(NSNumber *)identifier success:(RESTSuccess)success failure:(RESTFailure)failure
{
    [self REST_findWithPath:[self REST_defaultShowPathWithIdentifier:identifier] success:success failure:failure];
}

+ (void)REST_findWithPath:(NSString *)path success:(RESTSuccess)success failure:(RESTFailure)failure
{
    [self REST_findWithURL:[REST URLWithPath:path] success:success failure:failure];
}

+ (void)REST_findWithURL:(NSURL *)url success:(RESTSuccess)success failure:(RESTFailure)failure
{
    // NSError *error = [NSError errorWithDomain:@"com.ksylvest" code:0 userInfo:nil];
    if (success) success(@{});
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Create

+ (void)REST_create:(NSDictionary *)parameters success:(RESTSuccess)success failure:(RESTFailure)failure
{
    [self REST_create:parameters path:[self REST_defaultCreatePath] success:success failure:failure];
}

- (void)REST_create:(NSDictionary *)parameters path:(NSString *)path success:(RESTSuccess)success failure:(RESTFailure)failure
{
    [self REST_create:parameters url:[REST URLWithPath:path] success:success failure:failure];
}

- (void)REST_create:(NSDictionary *)parameters url:(NSURL *)url success:(RESTSuccess)success failure:(RESTFailure)failure
{
    // NSError *error = [NSError errorWithDomain:@"com.ksylvest" code:0 userInfo:nil];
    if (success) success(@{});
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Update

- (void)REST_update:(NSDictionary *)parameters success:(RESTSuccess)success failure:(RESTFailure)failure
{
    [self REST_update:parameters path:[self REST_defaultUpdatePath] success:success failure:failure];
}

- (void)REST_update:(NSDictionary *)parameters path:(NSString *)path success:(RESTSuccess)success failure:(RESTFailure)failure
{
    [self REST_update:parameters url:[REST URLWithPath:path] success:success failure:failure];
}

- (void)REST_update:(NSDictionary *)parameters url:(NSURL *)url success:(RESTSuccess)success failure:(RESTFailure)failure
{
    // NSError *error = [NSError errorWithDomain:@"com.ksylvest" code:0 userInfo:nil];
    if (success) success(@{});
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Delete

- (void)REST_delete
{
    [self REST_deleteWithPath:[self REST_defaultDeletePath] success:nil failure:nil];
}

- (void)REST_deleteWithPath:(NSString *)path success:(RESTSuccess)success failure:(RESTFailure)failure;
{
    [self REST_deleteWithURL:[REST URLWithPath:path] success:success failure:failure];
}

- (void)REST_deleteWithURL:(NSURL *)url success:(RESTSuccess)success failure:(RESTFailure)failure;
{
    // NSError *error = [NSError errorWithDomain:@"com.ksylvest" code:0 userInfo:nil];
    if (success) success(@{});
}

@end
