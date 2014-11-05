//
//  NSArray+extra.m
//  Bitmarket
//
//  Created by Steve Dekorte on 2/8/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import "NSArray+extra.h"
#import "NSMutableArray+extra.h"
#import "NSObject+extra.h"

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
        id result = [obj idNoWarningPerformSelector:aSelector];
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

// bool checks

// helpers
//NSMethodSignature *sig = [self.class instanceMethodSignatureForSelector:@selector(containsObject:)];

- (BOOL)allTrueForSelector:(SEL)aSelector
{
    return [self firstFalseForSelector:aSelector] == nil;

}

- (BOOL)allFalseForSelector:(SEL)aSelector
{
    return [self firstTrueForSelector:aSelector] == nil;
}

- (id)firstTrueForSelector:(SEL)aSelector
{
    for (id item in self)
    {
        if ([item respondsToSelector:aSelector])
        {
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            
            if ([item performSelector:aSelector])
            {
                return item;
            }
            
#pragma clang diagnostic pop
            
        }
    }
    
    return nil;
}

- (id)firstFalseForSelector:(SEL)aSelector
{
    for (id item in self)
    {
        if ([item respondsToSelector:aSelector])
        {
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            
            if (![item performSelector:aSelector])
            {
                return item;
            }
            
#pragma clang diagnostic pop
            
        }
    }
    
    return nil;
}

- (BOOL)beginsWithArray:(NSArray *)anArray
{
    NSArray *sub = [self subarrayWithRange:NSMakeRange(0, anArray.count)];
    return [sub isEqualToArray:anArray];
}

@end


