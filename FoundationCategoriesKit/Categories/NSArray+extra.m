//
//  NSArray+extra.m
//  Bitmarket
//
//  Created by Steve Dekorte on 2/8/14.
//  Copyright (c) 2014 Bitmarkets.org. All rights reserved.
//

#import "NSArray+extra.h"
#import "NSMutableArray+extra.h"

@implementation NSArray (extra)

- (NSArray *)reversedArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    
    for (id element in enumerator)
    {
        [array addObject:element];
    }
    
    return array;
}

- (NSArray *)sortedStrings
{
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (id)firstObjectOfClass:(Class)aClass
{
    for (NSObject *obj in self)
    {
        if ([obj isKindOfClass:aClass])
        {
            return obj;
        }
    }
    
    return nil;
}

- (id)objectAfter:(id)anObject
{
    NSInteger index = [self indexOfObject:anObject];
    
    if (index != -1)
    {
        NSInteger nextIndex = index + 1;
        
        if (nextIndex < [self count])
        {
            return [self objectAtIndex:nextIndex];
        }
    }
    
    return nil;
}

- (id)objectBefore:(id)anObject
{
    id lastObject = nil;
    
    for (NSObject *obj in self)
    {
        if (obj == anObject)
        {
            return lastObject;
        }
    }
    
    return nil;
}

- (NSArray *)map:(SEL)aSelector
{
    NSMutableArray *results = [NSMutableArray array];
    
    for (NSObject *obj in self)
    {
        id result = [obj performSelector:aSelector];
        [results addObject:result];
    }
    
    return [NSArray arrayWithArray:results];
}

- (NSArray *)sansFirstObject
{
    NSMutableArray *results = [NSMutableArray arrayWithArray:self];
    [results removeFirstObject];
    return [NSArray arrayWithArray:results];
}

@end


