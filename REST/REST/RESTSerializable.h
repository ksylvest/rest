//
//  RESTSerializable.h
//  REST
//
//  Created by Kevin Sylvestre on 9/12/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RESTSerializable <NSObject>

@optional

- (void)REST_deserialize:(NSDictionary *)data;
- (NSDictionary *)REST_serialize;

@end
