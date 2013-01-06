//
//  Notification.h
//  Example
//
//  Created by Kevin Sylvestre on 1/6/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "REST/REST.h"

@class User;

@interface Notification : NSManagedObject

@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSDate * age;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) User *sender;

@end
