//
//  NSArray+extra.h
//  Bitmarket
//
//  Created by Steve Dekorte on 2/8/14.
//  Copyright (c) 2014 Bitmarkets.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (extra)

- (NSArray *)reversedArray;
- (NSArray *)sortedStrings;

- (id)firstObjectOfClass:(Class)aClass;

- (id)objectAfter:(id)anObject;
- (id)objectBefore:(id)anObject;

- (NSArray *)map:(SEL)aSelector;

- (NSArray *)sansFirstObject;

@end

