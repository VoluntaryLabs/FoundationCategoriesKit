//
//  NSDictionaryKeyProxy.h
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 5/3/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionaryKeyProxy : NSProxy

@property (assign, nonatomic) NSDictionary *dict;

@end