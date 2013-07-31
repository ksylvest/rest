//
//  EncodingsTests.m
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "EncodingsTests.h"

#import "NSString+REST_Encodings.h"

@implementation EncodingsTests


////////////////////////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Tests
#pragma mark -


- (void)testBase64Encode
{
	// Create test cases.
	NSDictionary *tests = [NSDictionary dictionaryWithObjectsAndKeys:
						   @"RW5jb2Rpbmc=", @"Encoding",
						   @"RGVjb2Rpbmc=", @"Decoding",
						   nil];
	
	// Iterate through cases.
	for (NSString *test in tests)
	{
		// Load actual and calculate expected results.
		NSString *expected = [tests objectForKey:test];
		NSString *actual = [test REST_base64encode];
		
		// Perform assertion on actual and expected results matching.
		STAssertEqualObjects(actual, expected, @"'%@' encodes to '%@' instead of '%@'.", test, actual, expected);
	}
}


- (void)testBase64Decode
{
	// Create test cases.
	NSDictionary *tests = [NSDictionary dictionaryWithObjectsAndKeys:
						   @"Encoding", @"RW5jb2Rpbmc=", 
						   @"Decoding", @"RGVjb2Rpbmc=", 
						   nil];
    
	// Iterate through cases.
	for (NSString *test in tests)
	{
		// Load actual and calculate expected results.
		NSString *expected = [tests objectForKey:test];
		NSString *actual = [test REST_base64decode];
		
		// Perform assertion on actual and expected results matching.
		STAssertEqualObjects(actual, expected, @"'%@' decodes to '%@' instead of '%@'.", test, actual, expected);
	}
}


@end
