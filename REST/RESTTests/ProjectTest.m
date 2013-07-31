//
//  ProjectTest.m
//  REST
//
//  Created by Kevin Sylvestre on 6/30/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "ProjectTest.h"
#import "Project.h"
#import "NSObject+REST.h"

@implementation ProjectTest

- (void)testRESTProperties
{
    Project *project = [[Project alloc] init];
    
    [project REST_properties];
}

@end
