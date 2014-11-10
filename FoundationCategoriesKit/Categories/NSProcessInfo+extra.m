//
//  NSProcessInfo+extra.m
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 11/10/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import "NSProcessInfo+extra.h"
#import "NSString+extra.h"

@implementation NSProcessInfo (extra)

- (NSNumber *)majorMinorOSXVersionNumber
{
    /*
     NSOperatingSystemVersion version;
     
     version.majorVersion = 10;
     version.minorVersion = 10;
     */
    
    if ([[NSProcessInfo processInfo] respondsToSelector:@selector(operatingSystemVersionString)])
    {
        NSString *version = [[NSProcessInfo processInfo] operatingSystemVersionString];
        
        // example: 'Version 10.10 (Build 14A389)'
        
        version = [[version after:@"Version "] before:@" "];
        NSLog(@"version = '%@'", version);
        
        NSArray *parts = [version componentsSeparatedByString:@"."];
        //NSInteger majorVersion = ((NSString *)[parts objectAtIndex:0]).intValue;
        //NSInteger minorVersion = ((NSString *)[parts objectAtIndex:1]).intValue;
        
        NSString *majorMinor = [NSString stringWithFormat:@"%@.%@",
                                [parts objectAtIndex:0],
                                [parts objectAtIndex:1]
                                ];
        
        NSNumber *versionNumber = [NSNumber numberWithFloat:majorMinor.floatValue];
        NSLog(@"versionNumber = %@", versionNumber);
        
        return versionNumber;
    }
    
    return NO;
}

@end
