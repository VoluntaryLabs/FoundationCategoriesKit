//
//  NSMutableDictionary+extra.m
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 12/1/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import "NSMutableDictionary+extra.h"

@implementation NSMutableDictionary (extra)

- (void)removeKeysNotInArray:(NSArray *)keys
{
    NSSet *keySet = [NSSet setWithArray:keys];
    
    for (id key in self.allKeys)
    {
        if (![keySet member:key])
        {
            [self removeObjectForKey:key];
        }
    }
}

@end
