//
//  NSArray+extra.h
//  Bitmarket
//
//  Created by Steve Dekorte on 2/8/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
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

// tests

- (BOOL)allTrueForSelector:(SEL)aSelector;
- (BOOL)allFalseForSelector:(SEL)aSelector;

- (id)firstTrueForSelector:(SEL)aSelector;
- (id)firstFalseForSelector:(SEL)aSelector;

@end

