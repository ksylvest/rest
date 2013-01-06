//
//  Project.m
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "Project.h"

@implementation Project

@synthesize identifier;
@synthesize name;
@synthesize notes;
@synthesize due;
@synthesize tasks;


////////////////////////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark Strings
#pragma mark -


- (NSString *)description
{
    return [NSString stringWithFormat:@"{ identifier: %@ name: %@ notes: %@ }", self.identifier, self.name, self.notes];
}


////////////////////////////////////////////////////////////////////////////////

#pragma mark -
#pragma mark REST
#pragma mark -


- (void)deserializeFromDictionary:(NSDictionary *)dictionary
{
    NSDictionary *project = [dictionary objectForKey:@"project"];
    
    self.identifier = [project objectForKey:@"id"];
    self.name       = [project objectForKey:@"name"];
    self.notes      = [project objectForKey:@"notes"];
}


+ (id)deserializeFromDictionary:(NSDictionary *)dictionary
{
    Project *project = [[Project alloc] init];
    [project deserializeFromDictionary:dictionary];
    
    return project;
}


+ (id)deserializeFromArray:(NSArray *)array
{
    NSMutableArray *projects = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array)
    {
        Project *project = [self deserializeFromDictionary:dictionary];
        [projects addObject:project];
    }
    
    return projects;
}


+ (id)deserialize:(NSData *)data
{
    id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if (!object);
    else if ([object isKindOfClass:[NSArray class]]) 
        return [self deserializeFromArray:object];
    else if ([object isKindOfClass:[NSDictionary class]]) 
        return [self deserializeFromDictionary:object];
    
    return nil;
}


- (void)deserialize:(NSData *)data
{
    NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    [self deserializeFromDictionary:object];
}


- (NSData *)serialize
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSMutableDictionary *project = [NSMutableDictionary dictionary];

    [project setObject:self.due forKey:@"due"];
    [project setObject:self.name forKey:@"name"];
    [project setObject:self.notes forKey:@"notes"];
    [project setObject:self.identifier forKey:@"id"];
    
    [params setObject:project forKey:@"project"];
    
    return [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
}


@end
