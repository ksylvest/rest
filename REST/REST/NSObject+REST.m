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

+ (NSString *)REST_getRemoteReadPath
{
    NSString *format = [REST format];
    NSString *resource = NSStringFromClass(self);
    return [NSString stringWithFormat:@"/%@.%@", resource.REST_pluralize.REST_pathify, format];
}

+ (NSString *)REST_getRemoteReadPathWithIdentifier:(NSNumber *)identifier
{
    NSString *format = [REST format];
    NSString *resource = NSStringFromClass(self);
    return [NSString stringWithFormat:@"/%@/%@.%@", resource.REST_pluralize.REST_pathify, identifier, format];
}

- (NSString *)REST_getRemoteReadPath
{
    NSString *format = [REST format];
    NSNumber *identifier = [self performSelector:@selector(identifier)];
    NSString *resource = NSStringFromClass([self class]);
    return [NSString stringWithFormat:@"/%@/%@.%@", resource.REST_pluralize.REST_pathify, identifier, format];
}

- (NSString *)REST_getRemoteCreatePath
{
    NSString *format = [REST format];
    NSString *resource = NSStringFromClass([self class]);
    return [NSString stringWithFormat:@"/%@.%@", resource.REST_pluralize.REST_pathify, format];
}

- (NSString *)REST_getRemoteUpdatePath
{
    return [self REST_getRemoteReadPath];
}

- (NSString *)REST_getRemoteDeletePath
{
    return [self REST_getRemoteReadPath];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Read

+ (void)REST_readRemote
{
    [self REST_readRemoteWithPath:[self REST_getRemoteReadPath] success:nil failure:nil];
}

+ (void)REST_readRemoteWithIdentifier:(NSNumber *)identifier success:(RESTSucess)success failure:(RESTFailure)failure;
{
    [self REST_readRemoteWithPath:[self REST_getRemoteReadPathWithIdentifier:identifier] success:success failure:failure];
}

+ (void)REST_readRemoteWithPath:(NSString *)path success:(RESTSucess)success failure:(RESTFailure)failure
{
    [self REST_readRemoteWithURL:[REST URLWithPath:path] success:success failure:failure];
}

+ (void)REST_readRemoteWithURL:(NSURL *)url success:(RESTSucess)success failure:(RESTFailure)failure;
{
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Create

- (void)REST_createRemote
{
    [self REST_createRemoteWithPath:[self REST_getRemoteCreatePath] success:nil failure:nil];
}

- (void)REST_createRemoteWithPath:(NSString *)path success:(RESTSucess)success failure:(RESTFailure)failure;
{
    [self REST_createRemoteWithURL:[REST URLWithPath:path] success:success failure:failure];
}

- (void)REST_createRemoteWithURL:(NSURL *)url success:(RESTSucess)success failure:(RESTFailure)failure;
{
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Update

- (void)REST_updateRemote
{
    [self REST_updateRemoteWithPath:[self REST_getRemoteUpdatePath] success:nil failure:nil];
}

- (void)REST_updateRemoteWithPath:(NSString *)path success:(RESTSucess)success failure:(RESTFailure)failure;
{
    [self REST_updateRemoteWithURL:[REST URLWithPath:path] success:success failure:failure];
}

- (void)REST_updateRemoteWithURL:(NSURL *)url success:(RESTSucess)success failure:(RESTFailure)failure;
{
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Delete

- (void)REST_deleteRemote
{
    [self REST_deleteRemoteWithPath:[self REST_getRemoteDeletePath] success:nil failure:nil];
}

- (void)REST_deleteRemoteWithPath:(NSString *)path success:(RESTSucess)success failure:(RESTFailure)failure;
{
    [self REST_deleteRemoteWithURL:[REST URLWithPath:path] success:success failure:failure];
}

- (void)REST_deleteRemoteWithURL:(NSURL *)url success:(RESTSucess)success failure:(RESTFailure)failure;
{
}

@end
