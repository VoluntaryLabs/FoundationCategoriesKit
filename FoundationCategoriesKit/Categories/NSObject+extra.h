//
//  NSObject+extra.h
//  Bitmessage
//
//  Created by Steve Dekorte on 2/21/14.
//  Copyright (c) 2014 Bitmarkets.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (extra)

+ (Class)viewClass;
+ (Class)firstViewClass;

- (id)idNoWarningPerformSelector:(SEL)aSelector;
- (void)noWarningPerformSelector:(SEL)aSelector;
- (void)noWarningPerformSelector:(SEL)aSelector withObject:anArgument;

- (BOOL)boolPerformSelector:(SEL)aSelector;

// perform
/*
- (void)voidPerformSelector:(SEL)aSelector;
- (void)voidPerformSelector:(SEL)aSelector withObject:(id)aValue;
- (id)idPerformSelector:(SEL)aSelector;
- (NSInteger)nsintegerPerformSelector:(SEL)aSelector;
 */

@end
