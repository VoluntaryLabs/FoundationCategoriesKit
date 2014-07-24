//
//  NSNumber+extra.m
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 7/24/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import "NSNumber+extra.h"

@implementation NSNumber (extra)

- (NSString *)asFormattedString
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    //[formatter setLocalizesFormat:NO];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setPartialStringValidationEnabled:YES];
    return [formatter stringFromNumber:self];
}

- (NSString *)asFormattedStringWithFractionalDigits:(NSUInteger)sigDigitCount
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setUsesSignificantDigits:YES];
    [formatter setMinimumFractionDigits:sigDigitCount];
    //[formatter setMinimumFractionDigits:sigDigitCount];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setPartialStringValidationEnabled:YES];
    return [formatter stringFromNumber:self];
}

@end
