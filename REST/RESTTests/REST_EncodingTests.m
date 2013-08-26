//
//  REST_EncodingTests.m
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSData+REST_Encodings.h"
#import "NSString+REST_Encodings.h"

@interface REST_EncodingTests : XCTestCase

@end

@implementation REST_EncodingTests

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Tests

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
        XCTAssertEqualObjects(actual, expected, @"'%@' encodes to '%@' instead of '%@'.", test, actual, expected);
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
        XCTAssertEqualObjects(actual, expected, @"'%@' decodes to '%@' instead of '%@'.", test, actual, expected);
    }
}

@end
