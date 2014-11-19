//
//  NSDate+extra.h
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 11/12/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (extra)

+ (NSDate *)fromNumber:(NSNumber *)dateNumber;
- (NSNumber *)asNumber;

- (NSTimeInterval)ageInSeconds;

- (NSString *)itemDateString;
- (NSString *)itemDateTimeString;

+ (void)waitFor:(NSTimeInterval)dt;

@end
