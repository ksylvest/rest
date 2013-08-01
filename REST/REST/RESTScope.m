//
//  RESTScope.m
//  REST
//
//  Created by Kevin Sylvestre on 7/30/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "RESTScope.h"

@interface RESTScope ()
@property (nonatomic, strong) NSMutableArray *wheres;
@property (nonatomic, strong) NSMutableArray *orders;
@property (nonatomic, assign) NSInteger limit;
@property (nonatomic, assign) NSInteger offset;
@end

@implementation RESTScope

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Constructor

- (id)initWithClass:(Class)klass
{
    self = [super init];
    
    if (self)
    {
        self.klass = klass;
        self.wheres = [NSMutableArray array];
        self.orders = [NSMutableArray array];
    }
    
    return self;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Terminators

- (NSManagedObjectContext *)managedObjectContext
{
    return nil;
}

- (NSFetchedResultsController *)fetchedResultsController
{
    return nil;
}

- (NSArray *)orderSortDescriptors
{
    NSMutableArray *sds = [NSMutableArray array];
    
    for (__strong id parameters in self.orders)
    {
        if (![parameters isKindOfClass:[NSDictionary class]]) parameters = @{ parameters: @"asc"};
        for (id attribute in parameters)
        {
            NSString *order = [parameters objectForKey:attribute];
            BOOL ascending = ([order caseInsensitiveCompare:@"asc"] || [order caseInsensitiveCompare:@"ascending"]);
            [sds addObject:[NSSortDescriptor sortDescriptorWithKey:parameters ascending:ascending]];
        }
    }
    
    return sds;
}

- (NSPredicate *)predicate
{
    NSMutableArray *subpredicates = [NSMutableArray array];
    
    for (id parameters in self.wheres)
    {
        // TODO.
    }
    
    return [NSCompoundPredicate andPredicateWithSubpredicates:subpredicates];
}

- (NSArray *)array
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass(self.klass)];
    
    if (self.limit) [request setFetchLimit:self.limit];
    if (self.offset) [request setFetchOffset:self.offset];
    
    [request setPredicate:[self predicate]];
    [request setSortDescriptors:[self orderSortDescriptors]];
    
    return [[self managedObjectContext] executeFetchRequest:request error:NULL];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Filters

- (RESTScope *)find:(id)parameters
{
    // Todo.
    return nil;
}

- (RESTScope *)where:(id)parameters
{
    [self.wheres addObject:parameters];
    return self;
}

- (RESTScope *)order:(id)parameters
{
    [self.orders addObject:parameters];
    return self;
}

- (RESTScope *)limit:(NSInteger)limit
{
    self.limit = limit;
    return self;
}

- (RESTScope *)offset:(NSInteger)offset
{
    self.offset = offset;
    return self;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Management

- (id)create:(NSDictionary *)parameters
{
    return [self create:parameters block:NULL];
}

- (id)create:(NSDictionary *)parameters block:(void (^)(id))block
{
    // TODO.
    return nil;
}

- (id)update:(NSDictionary *)parameters
{
    return [self update:parameters block:NULL];
}

- (id)update:(NSDictionary *)parameters block:(void (^)(id))block
{
    // TODO.
    return nil;
}

@end
