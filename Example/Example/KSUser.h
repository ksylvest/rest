//
//  KSUser.h
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <REST/RESTSerializable.h>

extern const NSString * KSUserIdentifier;
extern const NSString * KSUserName;
extern const NSString * KSUserEmail;
extern const NSString * KSUserPassword;

@interface KSUser : NSManagedObject <RESTSerializable>

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * name;

@end
