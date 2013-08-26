//
//  NSObject+REST.h
//  REST
//
//  Created by Kevin Sylvestre on 7/31/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RESTSucess)(id object);
typedef void (^RESTFailure)(NSError *error);

@interface NSObject (REST)

- (NSDictionary *)REST_properties;

+ (void)REST_readRemote;
+ (void)REST_readRemoteWithIdentifier:(NSNumber *)identifier success:(RESTSucess)success failure:(RESTFailure)failure;
+ (void)REST_readRemoteWithPath:(NSString *)path success:(RESTSucess)success failure:(RESTFailure)failure;
+ (void)REST_readRemoteWithURL:(NSURL *)url success:(RESTSucess)success failure:(RESTFailure)failure;

- (void)REST_createRemote;
- (void)REST_createRemoteWithPath:(NSString *)path success:(RESTSucess)success failure:(RESTFailure)failure;
- (void)REST_createRemoteWithURL:(NSURL *)url success:(RESTSucess)success failure:(RESTFailure)failure;

- (void)REST_updateRemote;
- (void)REST_updateRemoteWithPath:(NSString *)path success:(RESTSucess)success failure:(RESTFailure)failure;
- (void)REST_updateRemoteWithURL:(NSURL *)url success:(RESTSucess)success failure:(RESTFailure)failure;

- (void)REST_deleteRemote;
- (void)REST_deleteRemoteWithPath:(NSString *)path success:(RESTSucess)success failure:(RESTFailure)failure;
- (void)REST_deleteRemoteWithURL:(NSURL *)url success:(RESTSucess)success failure:(RESTFailure)failure;

@end
