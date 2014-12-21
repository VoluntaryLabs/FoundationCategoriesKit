//
//  NSException+extras.m
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 12/15/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import "NSException+extras.h"
#import "NSDictionary+json.h"

@implementation NSException (extras)


- (NSString *)fullDescription
{
    NSMutableString *s = [[NSMutableString alloc] init];
    [s appendFormat:@"exception:\n"];
    [s appendFormat:@"name: '%@'\n", self.name];
    [s appendFormat:@"reason: '%@'\n", self.reason];
    //[s appendFormat:@"userInfo: '%@'\n", self.userInfo.asJsonString];
    [s appendFormat:@"stack: '%@'\n", self.callStackSymbols];
    return s;
    
}

@end
