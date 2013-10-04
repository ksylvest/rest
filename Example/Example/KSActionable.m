//
//  KSActionable.m
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "KSActionable.h"
#import "KSTag.h"

const NSString * KSActionableIdentifier = @"id";
const NSString * KSActionableName = @"name";
const NSString * KSActionableNotes = @"notes";
const NSString * KSActionableDue = @"due";
const NSString * KSActionableTags = @"tags";

@implementation KSActionable

@dynamic identifier;
@dynamic name;
@dynamic notes;
@dynamic due;
@dynamic tags;

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Serializable

- (void)REST_deserialize:(NSDictionary *)data
{
    self.identifier = data[KSActionableIdentifier];
    self.name = data[KSActionableName];
    self.notes = data[KSActionableNotes];
    self.due = data[KSActionableDue];
}

- (NSDictionary *)REST_serialize
{
    return @{
             KSActionableIdentifier: self.identifier,
             KSActionableName: self.name,
             KSActionableNotes: self.notes,
             KSActionableDue: self.due,
             };
}

@end
