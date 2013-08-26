//
//  REST_InflectionTests.m
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSString+REST_Inflections.h"

@interface REST_InflectionTests : XCTestCase

@end

@implementation REST_InflectionTests

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Configuration

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
        XCTAssertEqualObjects(actual, expected, @"'%@' pluralizes to '%@' instead of '%@'.", test, actual, expected);
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
        XCTAssertEqualObjects(actual, expected, @"'%@' singularizes to '%@' instead of '%@'.", test, actual, expected);
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
        XCTAssertEqualObjects(actual, expected, @"'%@' parameterizes to '%@' instead of '%@'.", test, actual, expected);
    }
}

@end
