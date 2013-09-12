//
//  KSActionable.h
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSTag;

@interface KSActionable : NSManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSDate * due;
@property (nonatomic, retain) NSSet *tags;
@end

@interface KSActionable (CoreDataGeneratedAccessors)

- (void)addTagsObject:(KSTag *)value;
- (void)removeTagsObject:(KSTag *)value;
- (void)addTags:(NSSet *)values;
- (void)removeTags:(NSSet *)values;

@end
