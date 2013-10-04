//
//  REST.m
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "REST.h"

@implementation REST

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Configuration

static NSString *_host     = nil;
static NSString *_port     = nil;
static NSString *_scheme   = nil;
static NSString *_format   = nil;
static NSString *_username = nil;
static NSString *_password = nil;

+ (NSURL *)URL
{
    return [self URLWithPath:@"/"];
}

+ (NSURL *)URLWithPath:(NSString *)path
{
    // Create URL using provided paramteres.
    return [[NSURL alloc] initWithScheme:[self scheme] host:[self host] path:path];
}

+ (void)setUsername:(NSString *)username
{
    // If not identical.
    if (_username != username)
    {
        // Release and copy.
        _username = [username copy];
    }
}

+ (NSString *)username
{
    // Reference.
    return _username;
}

+ (void)setPassword:(NSString *)password
{
    // If not identical.
    if (_password != password)
    {
        // Release and copy.
        _password = [password copy];
    }
}

+ (NSString *)password
{
    // Reference.
    return _password;
}

+ (void)setScheme:(NSString *)scheme
{
    // If not identical.
    if (_scheme != scheme)
    {
        // Release and copy.
        _scheme = [scheme copy];
    }
}

+ (NSString *)scheme
{
    // Reference.
    return _scheme;
}

+ (void)setHost:(NSString *)host
{
    // If not identical.
    if (_host != host)
    {
        // Release and copy.
        _host = [host copy];
    }
}

+ (NSString *)host
{
    // Reference.
    return _host;
}

+ (void)setFormat:(NSString *)format
{
    // If not identical.
    if (_format != format)
    {
        // Release and copy.
        _format = [format copy];
    }
}

+ (NSString *)format
{
    // Reference.
    return _format;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

+ (void)background:(RESTOperation)operation priority:(NSInteger)priority
{
    dispatch_async(dispatch_get_global_queue(priority, 0), operation);
}

+ (void)background:(RESTOperation)operation
{
    [self background:operation priority:DISPATCH_QUEUE_PRIORITY_DEFAULT];
}

+ (void)foreground:(RESTOperation)operation
{
    dispatch_async(dispatch_get_main_queue(), operation);
}

@end
