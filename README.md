# REST

REST is a iOS (Cocoa Touch) Static Library designed to provide a simplified interface for communicating with REST web services.

## Installation

Drag the 'REST' directory into your project. Select "Copy items into the destination group's folder" and "Create groups for any added folders".
  
## Examples

**Book.h**

    #import <Foundation/Foundation.h>
    #import <CoreData/CoreData.h>
    
    @interface Book : NSManagedObject 
    
    @property (nonatomic, retain) NSNumber *identifier;
    @property (nonatomic, retain) NSString *publication;
    @property (nonatomic, retain) NSString *name;
    @property (nonatomic, retain) NSString *author;
    @property (nonatomic, retain) NSString *genre;
    
    @end
    
**Book.m**

    #import "Book.h"

    @implementation Book
    
    - (NSDictionary *)REST_serialize
    {
        return @{
            @"id": self.identifier,
            @"name": self.name,
            @"author": self.author,
            @"genre": self.genre
        };
    }
    
    - (id)REST_deserialize:(NSDictionary *)data
    {
         self.identifier = [data objectForKey:@"id"];
        self.name = [data objectForKey:@"name"];
        self.author = [data objectForKey:@"author"];
        self.genre  = [data objectForKey:@"genre"]
    }

    @end

**Example.m**

    #import "REST.h"
    ...

    Book *book = [Book REST_findBy:@{ @"name": @"The Catcher in the Rye" }];
    NSArray *books = [Book REST_where:@{ @"author": @"J. D. Salinger" }];

    Book *book = [Book REST_find:@1];
    NSArray *books = [Book REST_find:@[@2,@3]]

    RESTScope *scope = [Book REST_scope];
    scope = [scope REST_where:@{ @"author": @"J. D. Salinger" }];
    scope = [scope REST_where:@"(name like[CD] %@) AND (published > %@)", @"Catcher", @"July 16, 1951"];
    scope = [scope REST_order:@"name"];
    scope = [scope REST_order:@"name"];
    scope = [scope REST_limit:@8];
    scope = [scope REST_offset:@2];
    NSFetchedResultsController *frc = [scope REST_fetchedResultsController];
    NSArray *array = [scope REST_array];

    Book *book = [Book REST_create:@{ @"name": @"The Catcher in the Rye" }];
    
    Book *book = [Book REST_create:@{ @"name": @"The Catcher in the Rye" } do:^ (Book *book) {
        book.author = @"J. D. Salinger";
        book.genre = @"Novel";
        book.publication = [NSDate dateWithNaturalLanguageString:@"July 16, 1951"];
    }];

    Book *book = [Book REST_findOrCreateBy:@{ @"name": @"The Catcher in the Rye" }];
    
    Book *book = [Book REST_findOrCreateBy:@{ @"name": @"The Catcher in the Rye" } do:^ (Book *book) {
        book.author = @"J. D. Salinger";
        book.genre = @"Novel";
        book.publication = [NSDate dateWithNaturalLanguageString:@"July 16, 1951"];
    }];

## Copyright

Copyright (c) 2010 - 2013 Kevin Sylvestre. See LICENSE for details.
