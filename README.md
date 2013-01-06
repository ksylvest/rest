# REST

REST is a iOS (Cocoa Touch) Static Library designed to provide a simplified interface for communicating with REST web services.

## Installation

Drag the 'REST' directory into your project. Select "Copy items into the destination group's folder" and "Create groups for any added folders".
  
## Examples

Book.h

    #import <Foundation/Foundation.h>

    @interface Book : NSObject 
    {
    	NSString *name;
    	NSString *author;
    }

    @property (nonatomic, retain) NSString *name;
    @property (nonatomic, retain) NSString *author;
    
    - (NSString *)serialize;
    + (id)deserialize:(NSData *)data;

    @end
    
Book.m

    #import "Book.h"

    @implementation Book

    @synthesize name;
    @synthesize author;

    - (void)dealloc
    {
        [name release];
        [author release];
        name = nil;
        author = nil;
    
        [super dealloc];
    }
    
    - (NSData *)serialize
    {
      
    }
    
    - (id)deserialize:(NSData *)data
    {
      
    }
    
    + (NSArray *)deserialize:(NSData *)data
    {
      
    }

    @end

## Copyright

Copyright (c) 2010 - 2013 Kevin Sylvestre. See LICENSE for details.
