//
//  KSTag.h
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <REST/RESTSerializable.h>

@class KSActionable;

extern const NSString * KSTagIdentifier;
extern const NSString * KSTagName;

@interface KSTag : NSManagedObject <RESTSerializable>

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) KSActionable *actionable;

@end
