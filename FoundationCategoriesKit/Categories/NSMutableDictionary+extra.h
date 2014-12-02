//
//  NSMutableDictionary+extra.h
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 12/1/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (extra)

- (void)removeKeysNotInArray:(NSArray *)keys;

@end
