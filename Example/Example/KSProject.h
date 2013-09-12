//
//  KSProject.h
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "KSActionable.h"

@class KSTag;

@interface KSProject : KSActionable

@property (nonatomic, retain) KSTag *tags;

@end
