//
//  UIView+KSAdditions.m
//  Example
//
//  Created by Kevin Sylvestre on 9/11/13.
//  Copyright (c) 2013 Kevin Sylvestre. All rights reserved.
//

#import "UIView+KSAdditions.h"

@implementation UIView (KSAdditions)

+ (id)create
{
    id view = nil;
    NSString *name = NSStringFromClass([self class]);
    NSBundle *bundle = [NSBundle mainBundle];
	
	NSArray *views = [bundle loadNibNamed:name owner:nil options:nil];
    for (view in views) if ([view isKindOfClass:[self class]]) break;
	
	return view;
}

@end
