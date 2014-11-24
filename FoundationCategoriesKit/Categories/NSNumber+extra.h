//
//  NSNumber+extra.h
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 7/24/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (extra)

+ (NSNumber *)entropyNumber;

- (NSString *)asString;
- (NSString *)asUnsignedIntegerString;

- (NSString *)asFormattedString;
- (NSString *)asFormattedStringWithFractionalDigits:(NSUInteger)sigDigitCount;

- (NSNumber *)asNumber;

- (NSNumber *)multipliedBy:(NSNumber *)aNumber;
- (NSNumber *)addedTo:(NSNumber *)aNumber;

@end
