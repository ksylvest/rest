//
//  KSActionable.h
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <REST/RESTSerializable.h>

@class KSTag;

extern const NSString * KSActionableIdentifier;
extern const NSString * KSActionableName;
extern const NSString * KSActionableNotes;
extern const NSString * KSActionableDue;
extern const NSString * KSActionableTags;

@interface KSActionable : NSManagedObject <RESTSerializable>

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSDate * due;
@property (nonatomic, retain) NSSet *tags;

@end
