//
//  NSObject+REST_Serialization.h
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (REST_Serialization)

+ (id)REST_deserialize:(NSArray *)data;
- (void)REST_deserialize:(NSDictionary *)data;
- (NSDictionary *)REST_serialize;

@end
