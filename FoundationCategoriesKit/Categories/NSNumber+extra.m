//
//  NSNumber+extra.m
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 7/24/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import "NSNumber+extra.h"

@implementation NSNumber (extra)

+ (NSNumber *)entropyNumber
{
    unsigned int entropy = (unsigned int)time(NULL) + (unsigned int)clock();
    srandom(entropy);
    
    return [NSNumber numberWithLong:random()];
}

- (NSString *)asUnsignedIntegerString
{
    return [NSString stringWithFormat:@"%ul", self.unsignedIntValue];
}

- (NSString *)asString
{
    return self.asFormattedString;
}

- (NSString *)asFormattedString
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    //[formatter setLocalizesFormat:NO];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setPartialStringValidationEnabled:YES];
    return [formatter stringFromNumber:self];
}

- (NSString *)asFormattedStringWithFractionalDigits:(NSUInteger)fracDigits
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    //[formatter setUsesSignificantDigits:YES];
    [formatter setMinimumFractionDigits:fracDigits];
    [formatter setMaximumFractionDigits:fracDigits];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setPartialStringValidationEnabled:YES];
    return [formatter stringFromNumber:self];
}

- (NSNumber *)asNumber
{
    return self;
}

@end
