//
//  Session.h
//  Example
//
//  Created by Kevin Sylvestre on 1/6/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "REST/REST.h"

@interface Session : NSObject

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

@end
