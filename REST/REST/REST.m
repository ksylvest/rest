//
//  REST.m
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "REST.h"

@implementation REST

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Configuration

static NSString *_user     = nil;
static NSString *_password = nil;
static NSString *_scheme   = nil;
static NSString *_host     = nil;
static NSString *_format   = nil;

+ (NSURL *)getURL
{
	return [self getURLWithPath:@"/"];
}

+ (NSURL *)getURLWithPath:(NSString *)path
{
    // Create URL using provided paramteres.
	return [[NSURL alloc] initWithScheme:[self getScheme] host:[self getHost] path:path];
}

+ (void)setUser:(NSString *)user
{
	// If not identical.
	if (_user != user)
	{
		// Release and copy.
		_user = [user copy];
	}
}

+ (NSString *)getUser
{
	// Reference.
	return _user;
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

+ (NSString *)getPassword
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

+ (NSString *)getScheme
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

+ (NSString *)getHost
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

+ (NSString *)getFormat
{
	// Reference.
	return _format;
}

@end
