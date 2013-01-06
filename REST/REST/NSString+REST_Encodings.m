//
//  NSString+REST_Encodings.m
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "NSString+REST_Encodings.h"
#import "NSData+REST_Encodings.h"

@implementation NSString (REST_Encodings)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Encodings

- (NSString *)REST_base64encode
{	
	NSData *data = [[self dataUsingEncoding:NSUTF8StringEncoding] REST_base64encode];
	
	return [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSASCIIStringEncoding];
}

- (NSString *)REST_base64decode
{	
	NSData *data = [[self dataUsingEncoding:NSASCIIStringEncoding] REST_base64decode];
	
	return [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
}

@end
