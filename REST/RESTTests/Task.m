//
//  Task.m
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "Task.h"

@implementation Task

@synthesize identifier;
@synthesize name;
@synthesize notes;
@synthesize status;
@synthesize due;
@synthesize project;


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
    NSDictionary *task = [dictionary objectForKey:@"task"];
    
    self.due = [task objectForKey:@"due"];
    self.name = [task objectForKey:@"name"];
    self.notes = [task objectForKey:@"notes"];
    self.status = [task objectForKey:@"status"];
    self.identifier = [task objectForKey:@"id"];
}


+ (id)deserializeFromDictionary:(NSDictionary *)dictionary
{
    Task *task = [[self alloc] init];
    [task deserializeFromDictionary:dictionary];
    
    return task;
}


+ (id)deserializeFromArray:(NSArray *)array
{
    NSMutableArray *tasks = [NSMutableArray array];
    
    for (NSDictionary *dictionary in array)
    {
        Task *task = [self deserializeFromDictionary:dictionary];
        [tasks addObject:task];
    }
    
    return tasks;
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
    NSMutableDictionary *task = [NSMutableDictionary dictionary];
    
    [task setObject:self.due forKey:@"due"];
    [task setObject:self.name forKey:@"name" ];
    [task setObject:self.notes forKey:@"notes"];
    [task setObject:self.status forKey:@"status"];
    [task setObject:self.identifier forKey:@"id"];
    
    [params setObject:task forKey:@"task"];
    
    return [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
}


@end
