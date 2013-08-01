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

- (RESTScope *)where:(id)parameters;
- (RESTScope *)order:(id)parameters;
- (RESTScope *)limit:(NSInteger)limit;
- (RESTScope *)offset:(NSInteger)offset;

- (id)find:(id)parameters;

- (id)create:(NSDictionary *)parameters;
- (id)create:(NSDictionary *)parameters block:(void (^)(id))block;

- (id)update:(NSDictionary *)parameters;
- (id)update:(NSDictionary *)parameters block:(void (^)(id))block;


@end
