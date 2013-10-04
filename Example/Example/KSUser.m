//
//  KSUser.m
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSUser.h"

const NSString * KSUserIdentifier = @"id";
const NSString * KSUserName = @"name";
const NSString * KSUserEmail = @"email";
const NSString * KSUserPassword = @"password";

@implementation KSUser

@dynamic email;
@dynamic identifier;
@dynamic name;

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Serializable

- (void)REST_deserialize:(NSDictionary *)data
{
    self.identifier = data[KSUserIdentifier];
    self.name = data[KSUserName];
    self.email = data[KSUserEmail];
}

- (NSDictionary *)REST_serialize
{
    return @{
             KSUserIdentifier: self.identifier,
             KSUserName: self.name,
             KSUserEmail: self.email,
             };
}

@end
