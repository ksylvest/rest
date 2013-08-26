//
//  NSData+REST_Encodings.m
//  REST
//
//  Created by Kevin Sylvestre on 8/25/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "NSData+REST_Encodings.h"

@implementation NSData (REST_Encodings)

static char padding = '=';

static char alphabet[64] =
{
    'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
    'Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f',
    'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v',
    'w','x','y','z','0','1','2','3','4','5','6','7','8','9','+','/',
};

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

- (char)REST_encode:(char)c
{
    return alphabet[c];
}

- (char)REST_decode:(char)c
{
    for (char r = 0; r < 64; r++) if (alphabet[r] == c) return r;
    return '\0';
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Encodings

- (NSData *)REST_base64encode
{
    const unsigned char *bytes = [self bytes];
    size_t length = [self length];
    
    NSMutableData *result = [NSMutableData data];
    
    for (size_t i = 0; i < length; i += 3)
    {
        uint32_t n = 0;
        
        if (i + 0 < length) n += bytes[i + 0] << 16;
        if (i + 1 < length) n += bytes[i + 1] <<  8;
        if (i + 2 < length) n += bytes[i + 2] <<  0;
        
        char buffer[4] =
        {
            (i + 0 < length) ? [self REST_encode:(uint8_t)((n >> 18) & 0x3F)] : padding,
            (i + 0 < length) ? [self REST_encode:(uint8_t)((n >> 12) & 0x3F)] : padding,
            (i + 1 < length) ? [self REST_encode:(uint8_t)((n >>  6) & 0x3F)] : padding,
            (i + 2 < length) ? [self REST_encode:(uint8_t)((n >>  0) & 0x3F)] : padding,
        };
        
        [result appendBytes:buffer length:4];
    }
    
    return result;
}

- (NSData *)REST_base64decode
{
    const unsigned char *bytes = [self bytes];
    size_t length = [self length];
    
    NSMutableData *result = [NSMutableData data];
    
    for (size_t i = 0; i < length; i += 4)
    {
        uint32_t n = 0;
        
        if (bytes[i + 0] != padding) { n += [self REST_decode:bytes[i + 0]] << 18; }
        if (bytes[i + 1] != padding) { n += [self REST_decode:bytes[i + 1]] << 12; }
        if (bytes[i + 2] != padding) { n += [self REST_decode:bytes[i + 2]] <<  6; }
        if (bytes[i + 3] != padding) { n += [self REST_decode:bytes[i + 3]] <<  0; }
        
        char buffer[3] =
        {
            (uint8_t)((n >> 16) & 0xFF),
            (uint8_t)((n >>  8) & 0xFF),
            (uint8_t)((n >>  0) & 0xFF),
        };
        
        size_t length = 0;
        
        if (bytes[i + 1] != padding) { length++; }
        if (bytes[i + 2] != padding) { length++; }
        if (bytes[i + 3] != padding) { length++; }
        
        [result appendBytes:buffer length:length];
    }
    
    return result;
}

@end
