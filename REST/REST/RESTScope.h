//
//  RESTScope.h
//  REST
//
//  Created by Kevin Sylvestre on 7/30/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface RESTScope : NSObject

@property (nonatomic, strong) Class klass;

- (id)initWithClass:(Class)klass;

- (NSArray *)array;
- (NSFetchedResultsController *)fetchedResultsController;
- (NSManagedObjectContext *)managedObjectContext;
- (void)modifyFetchRequest:(NSFetchRequest *)modifyFetchRequest;

- (RESTScope *)REST_where:(id)parameters, ...;
- (RESTScope *)REST_order:(id)parameters, ...;
- (RESTScope *)REST_limit:(NSInteger)limit;
- (RESTScope *)REST_offset:(NSInteger)offset;

- (id)REST_find:(id)parameters, ...;

- (id)REST_create:(NSDictionary *)parameters;
- (id)REST_create:(NSDictionary *)parameters block:(void (^)(id))block;

- (id)REST_update:(NSDictionary *)parameters;
- (id)REST_update:(NSDictionary *)parameters block:(void (^)(id))block;


@end
