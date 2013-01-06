//
//  NSData+RESTEncodings.h
//  REST
//
//  Created by Kevin Sylvestre on 6/26/12.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

@interface NSData (REST_Encodings)

@property (nonatomic, readonly) NSData *REST_base64encode;
@property (nonatomic, readonly) NSData *REST_base64decode;

@end
