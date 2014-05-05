//
//  NSDictionaryKeyProxy.m
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 5/3/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import "NSDictionaryKeyProxy.h"

@implementation NSDictionaryKeyProxy

- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSString *key = NSStringFromSelector([invocation selector]);
    id result = [self.dict objectForKey:key];
    if (result)
    {
        [invocation setReturnValue:(void *)CFBridgingRetain(result)]; // this right?
    }
}

@end
