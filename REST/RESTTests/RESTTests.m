//
//  RESTTests.m
//  RESTTests
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "REST.h"

@interface RESTTests : XCTestCase

@end

@implementation RESTTests

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Setup

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Tests

- (void)testURLStructure
{
    [REST setScheme:@"https"];
    [REST setHost:@"host"];
    
    XCTAssertNotNil([REST URLWithPath:@"/path"], @"https://host/path");
}

@end
