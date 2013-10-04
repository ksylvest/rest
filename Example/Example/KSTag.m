//
//  KSTag.m
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSTag.h"
#import "KSActionable.h"

const NSString * KSTagIdentifier = @"id";
const NSString * KSTagName = @"name";

@implementation KSTag

@dynamic identifier;
@dynamic name;
@dynamic actionable;

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Serializable

- (void)REST_deserialize:(NSDictionary *)data
{
    self.identifier = data[KSActionableIdentifier];
    self.name = data[KSActionableName];
}

- (NSDictionary *)REST_serialize
{
    return @{
             KSActionableIdentifier: self.identifier,
             KSActionableName: self.name,
             };
}


@end
