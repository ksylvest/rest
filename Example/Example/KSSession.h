//
//  KSSession.h
//  Example
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <REST/RESTSerializable.h>

@class KSUser;

extern const NSString * KSSessionEmail;
extern const NSString * KSSessionPassword;

@interface KSSession : NSObject <RESTSerializable>

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

@property (nonatomic, readonly) KSUser *user;

@end
