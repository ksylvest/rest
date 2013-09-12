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

@end
