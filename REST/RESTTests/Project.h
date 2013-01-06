//
//  Project.h
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject

@property (nonatomic, strong) NSNumber *identifier;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *notes;

@property (nonatomic, strong) NSDate *due;

@property (nonatomic, strong) NSArray *tasks;

@end
