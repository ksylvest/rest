//
//  KSProjectTests.m
//  Example
//
//  Created by Kevin Sylvestre on 9/15/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "KSProject.h"
#import <REST/REST.h>

#define kSingle (1)
#define kAlphaDue (-(60 * 60 * 24))
#define kOmegaDue (+(60 * 60 * 24))

@interface KSProjectTests : XCTestCase

@property (nonatomic, strong) KSProject *alpha;
@property (nonatomic, strong) KSProject *omega;

@end

@implementation KSProjectTests

- (void)setUp
{
    [super setUp];
    
    self.alpha = [KSProject REST_create:@{ KSActionableIdentifier: @"alpha",
                                           KSActionableName: @"Alpha",
                                           KSActionableNotes: @"Something",
                                           KSActionableDue: [NSDate dateWithTimeIntervalSinceNow:kAlphaDue]}];

    self.omega = [KSProject REST_create:@{ KSActionableIdentifier: @"omega",
                                          KSActionableName: @"Omega",
                                          KSActionableNotes: @"Something",
                                          KSActionableDue: [NSDate dateWithTimeIntervalSinceNow:kAlphaDue]}];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testFetchedResultsController
{
    NSFetchedResultsController *actual = [[KSProject REST_scope] fetchedResultsController];
    XCTAssert([[actual sections] count] > 0);
}

- (void)testArray
{
    NSArray *expected = @[self.alpha,self.omega];
    NSArray *actual = [[KSProject REST_scope] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testWhereNameEqualsAlpha
{
    NSArray *expected = @[self.omega];
    NSArray *actual = [[KSProject REST_where:@{ KSActionableName: @"Omega" }] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testWhereNameEqualsOmega
{
    NSArray *expected = @[self.omega];
    NSArray *actual = [[KSProject REST_where:@{ KSActionableName: @"Omega" }] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testWhereNotesEqualSomething
{
    NSArray *expected = @[self.alpha,self.omega];
    NSArray *actual = [[KSProject REST_where:@{ KSActionableNotes: @"Something" }] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testWhereNameFuzzyEqualsAlp
{
    NSArray *expected = @[self.alpha];
    NSArray *actual = [[KSProject REST_where:@"%K like[cd] %@", KSActionableName, @"alp"] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testWhereNameFuzzyEqualsOme
{
    NSArray *expected = @[self.omega];
    NSArray *actual = [[KSProject REST_where:@"%K like[cd] %@", KSActionableName, @"ome"] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testWherePastDue
{
    NSArray *expected = @[self.alpha];
    NSArray *actual = [[KSProject REST_where:@"%K > %@", KSActionableDue, [NSDate date]] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testWherePostDue
{
    NSArray *expected = @[self.omega];
    NSArray *actual = [[KSProject REST_where:@"%K < %@", KSActionableDue, [NSDate date]] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testCompositeWherePastDue
{
    NSArray *expected = @[self.omega];
    NSArray *actual = [[[KSProject REST_where:@{ KSActionableNotes: @"Something" }] REST_where:@"%K > %@", KSActionableDue, [NSDate date]] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testCompositeWherePostDue
{
    NSArray *expected = @[self.omega];
    NSArray *actual = [[[KSProject REST_where:@{ KSActionableNotes: @"Something" }] REST_where:@"%K > %@", KSActionableDue, [NSDate date]] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testOrderDue
{
    NSArray *exected = @[self.alpha,self.omega];
    NSArray *actual = [[KSProject REST_order:@"due"] array];
    XCTAssertEqualObjects(expected, actual);
}

- (void)testLimit
{
    NSArray *actual = [[KSProject REST_limit:kSingle]];
    XCTAssertEqual([actual length], kSingle);
}

- (void)testOffset
{
    
}

- (void)testFind
{
    
}

@end
