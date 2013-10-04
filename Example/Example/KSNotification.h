//
//  KSNotification.h
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <REST/RESTSerializable.h>

extern const NSString * KSNotificationIdentifier;
extern const NSString * KSNotificationMessage;
extern const NSString * KSNotificationStatus;

@interface KSNotification : NSManagedObject <RESTSerializable>

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSString * status;

@end
