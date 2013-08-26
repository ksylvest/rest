//
//  NSString+REST_Encodings.h
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (REST_Encodings)

- (NSString *)REST_base64encode;
- (NSString *)REST_base64decode;

@end
