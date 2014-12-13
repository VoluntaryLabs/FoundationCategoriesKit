//
//  NSBundle+extras.m
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 12/12/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import "NSBundle+extras.h"

@implementation NSBundle (extras)

+ (NSString *)pathForResource:(NSString *)name
{
    NSArray *allBundles = [NSBundle.allBundles arrayByAddingObjectsFromArray:NSBundle.allFrameworks];
    
    for (NSBundle *bundle in allBundles)
    {
        NSString *path = [bundle pathForResource:name ofType:nil];
        
        if (path)
        {
            return path;
        }
    }
    
    return [[NSBundle mainBundle] pathForResource:name ofType:nil];
}

@end
