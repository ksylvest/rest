//
//  KSNotification.m
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSNotification.h"

const NSString * KSNotificationIdentifier = @"id";
const NSString * KSNotificationMessage = @"name";
const NSString * KSNotificationStatus = @"status";

@implementation KSNotification

@dynamic identifier;
@dynamic message;
@dynamic status;

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Serializable

- (void)REST_deserialize:(NSDictionary *)data
{
    self.identifier = data[KSNotificationIdentifier];
    self.message = data[KSNotificationMessage];
    self.status = data[KSNotificationStatus];
}

- (NSDictionary *)REST_serialize
{
    return @{
             KSNotificationIdentifier: self.identifier,
             KSNotificationMessage: self.message,
             KSNotificationStatus: self.status,
             };
}

@end
