//
//  NSString+extra.h
//  Bitmarket
//
//  Created by Steve Dekorte on 1/25/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (extra)

- (NSString *)encodedBase64String;

@end


@interface NSString (extra)

- (NSString *)encodedBase64;
- (NSString *)decodedBase64;
- (NSData *)decodedBase64Data;

- (BOOL)containsString:(NSString *)other;
- (BOOL)containsCaseInsensitiveString:(NSString *)other;

- (NSString *)stringByTrimmingLeadingWhitespace;
- (NSString *)stringByTrimmingTrailingWhitespace;
- (NSString *)stringByTrimmingLeadingWhitespaceAndNewline;
- (NSString *)stringByTrimmingTrailingWhitespaceAndNewline;

- (NSString *)strip;
- (NSString *)stringWithReturnsRemoved;

- (NSRange)rangeBetweenString:(NSString *)startString andString:(NSString *)endString afterIndex:(NSUInteger)searchIndex;
- (NSMutableArray *)splitBetweenFirst:(NSString *)startString andString:(NSString *)endString;

- (NSString *)before:(NSString *)aString;
- (NSString *)after:(NSString *)aString;

- (NSString *)sansPrefix:(NSString *)aString;
- (NSString *)withPrefix:(NSString *)aString;

- (NSString *)capitalisedFirstCharacterString;

@end
