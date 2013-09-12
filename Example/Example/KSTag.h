//
//  KSTag.h
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KSActionable;

@interface KSTag : NSManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * due;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) KSActionable *actionable;

@end
