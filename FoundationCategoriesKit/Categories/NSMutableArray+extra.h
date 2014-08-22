//
//  NSMutableArray+extra.h
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 8/22/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (extra)

- (void)reverse;
- (void)mergeWith:(NSArray *)otherArray;
- (id)removeFirstObject;


@end
