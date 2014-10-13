//
//  NSMutableArray+extra.m
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 8/22/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import "NSMutableArray+extra.h"




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
    return [self popFirst];
}

- (id)popLast
{
    if (self.count > 0)
    {
        id lastObject = self.lastObject;
        [self removeLastObject];
        return lastObject;
    }
    
    return nil;
}

- (id)popFirst
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
