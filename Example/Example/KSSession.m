//
//  KSSession.m
//  Example
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSSession.h"
#import "KSUser.h"

const NSString * KSSessionEmail = @"email";
const NSString * KSSessionPassword = @"password";

@implementation KSSession

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Serializable

- (NSDictionary *)REST_serialize
{
    return @{
             KSSessionEmail: self.email,
             KSSessionPassword: self.password,
             };
}
@end
