//
//  InflectionTests.m
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "InflectionTests.h"

#import "REST/NSString+REST_Inflections.h"

@implementation InflectionTests


////////////////////////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Tests
#pragma mark -


- (void)testPluralize
{
	// Create test cases.
	NSDictionary *tests = [NSDictionary dictionaryWithObjectsAndKeys:
						   @"users"    , @"user"    , 
						   @"accounts" , @"account" ,
						   @"cherries" , @"cherry"  , 
						   @"potatoes" , @"potato"  , 
						   nil];
	
	// Iterate through cases.
	for (NSString *test in tests)
	{
		// Load actual and calculate expected results.
		NSString *expected = [tests objectForKey:test];
		NSString *actual = [test REST_pluralize];
		
		// Perform assertion on actual and expected results matching.
		STAssertEqualObjects(actual, expected, @"'%@' pluralizes to '%@' instead of '%@'.", test, actual, expected);
	}
}


- (void)testSingularize
{
	// Create test cases.
	NSDictionary *tests = [NSDictionary dictionaryWithObjectsAndKeys:
						   @"user"    , @"users"    ,
						   @"account" , @"accounts" ,
						   @"cherry"  , @"cherries" ,
						   @"potato"  , @"potatoes" ,
						   nil];
	
	// Iterate through cases.
	for (NSString *test in tests)
	{
		// Load actual and calculate expected results.
		NSString *expected = [tests objectForKey:test];
		NSString *actual = [test REST_singularize];
		
		// Perform assertion on actual and expected results matching.
		STAssertEqualObjects(actual, expected, @"'%@' singularizes to '%@' instead of '%@'.", test, actual, expected);
	}
}


- (void)testParameterize;
{
	// Create test cases.
	NSDictionary *tests = [NSDictionary dictionaryWithObjectsAndKeys:
						   @"name"       , @"name"      ,
						   @"person"     , @"person"    ,
						   @"created-at" , @"createdAt" ,
						   @"updated-at" , @"updatedAt" ,
						   nil];
	
	// Iterate through cases.
	for (NSString *test in tests)
	{
		// Load actual and calculate expected results.
		NSString *expected = [tests objectForKey:test];
		NSString *actual = [test REST_parameterize];
		
		// Perform assertion on actual and expected results matching.
		STAssertEqualObjects(actual, expected, @"'%@' parameterizes to '%@' instead of '%@'.", test, actual, expected);
	}
}


@end
