//
//  NSArray+extra.m
//  Bitmarket
//
//  Created by Steve Dekorte on 2/8/14.
//  Copyright (c) 2014 Bitmarkets.org. All rights reserved.
//

#import "NSArray+extra.h"

@implementation NSArray (extra)

- (NSArray *)reversedArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
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
    
    return results;
}

@end





@implementation NSMutableArray (extra)

- (void)reverse
{
    if ([self count] == 0)
    {
        return;
    }
    
    NSUInteger i = 0;
    NSUInteger j = [self count] - 1;
    
    while (i < j)
    {
        [self exchangeObjectAtIndex:i
                  withObjectAtIndex:j];
        
        i++;
        j--;
    }
}

- (void)mergeWith:(NSArray *)otherArray
{
    NSMutableSet *selfSet = [NSMutableSet setWithArray:self];
    NSMutableSet *otherSet = [NSMutableSet setWithArray:otherArray];

    //NSLog(@"begin merge");
    if (NO)
    {
        NSMutableSet *addSet = [NSMutableSet setWithArray:otherArray];
        [addSet minusSet:selfSet];
        
        NSMutableSet *removeSet = [NSMutableSet setWithArray:self];
        [removeSet minusSet:otherSet];
        
        [selfSet minusSet:removeSet];
        [selfSet unionSet:addSet];
    }
    else
    {
        // we want to keep around our existing objects
        
        // but remove those not in the other set
        //NSLog(@"intersect");
        [selfSet intersectSet:otherSet];
        
        //NSLog(@"union");
        // and any new items in the after
        [selfSet unionSet:otherSet];
    }
    //NSLog(@"done merge");
    
    [self removeAllObjects];
    [self addObjectsFromArray:[selfSet allObjects]];
}

- (id)removeFirstObject
{
    if (self.count > 0)
    {
        id firstObject = self.firstObject;
        [self removeObjectAtIndex:0.0];
        return firstObject;
    }
    
    return nil;
}


@end
