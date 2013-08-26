//
//  NSData+REST_Encodings.h
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (REST_Encodings)

- (NSData *)REST_base64encode;
- (NSData *)REST_base64decode;

@end
