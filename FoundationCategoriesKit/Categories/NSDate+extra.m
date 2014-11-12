//
//  NSDate+extra.m
//  FoundationCategoriesKit
//
//  Created by Steve Dekorte on 11/12/14.
//  Copyright (c) 2014 voluntary.net. All rights reserved.
//

#import "NSDate+extra.h"

@implementation NSDate (extra)

- (NSNumber *)asNumber
{
    return [NSNumber numberWithDouble:[self timeIntervalSince1970]];
}

+ (NSDate *)fromNumber:(NSNumber *)dateNumber
{
    if (dateNumber == nil)
    {
        return nil;
    }
    
    return [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)dateNumber.doubleValue];
}

- (NSTimeInterval)ageInSeconds
{
    return -[self timeIntervalSinceNow];
}


- (NSString *)itemDateString
{
    NSDate *date = self;
    
    if (date)
    {
        //return [NSString stringWithFormat:@"%@", date];
        
        NSTimeInterval dt = -[date timeIntervalSinceNow];
        NSInteger mins = dt/60;
        NSInteger hours = mins/60;
        NSInteger days = hours/24;
        //NSInteger weeks = days/7;
        
        NSString *messageYear = [date
                                 descriptionWithCalendarFormat:@"%Y" timeZone:nil
                                 locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
        NSString *currentYear = [[NSDate date]
                                 descriptionWithCalendarFormat:@"%Y" timeZone:nil
                                 locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
        
        BOOL sameYear = [messageYear isEqualToString:currentYear];
        
        
        NSString *messageHour = [date
                                 descriptionWithCalendarFormat:@"%I" timeZone:nil
                                 locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
        
        if ([messageHour hasPrefix:@"0"])
        {
            messageHour = [messageHour stringByReplacingOccurrencesOfString:@"0" withString:@""];
        }
        
        NSString *messageMin = [date descriptionWithCalendarFormat:@"%M" timeZone:nil
                                                            locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]].lowercaseString;
        NSString *amPm = [date descriptionWithCalendarFormat:@"%p" timeZone:nil
                                                      locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]].lowercaseString;
        /*
         if (hours < 1)
         {
         return [NSString stringWithFormat:@"%imin", (int)mins];
         }
         */
        
        if (days < 1)
        {
            //return [NSString stringWithFormat:@"%ihr", (int)hours];
            return [NSString stringWithFormat:@"%@:%@%@", messageHour, messageMin, amPm];
        }
        
        if (days < 2)
        {
            //return [NSString stringWithFormat:@"Yesterday at %@:%@%@", messageHour, messageMin, amPm];
            return @"Yesterday";
        }
        
        /*
         if (weeks < 1)
         {
         return [NSString stringWithFormat:@"%iwk", (int)days];
         }
         */
        
        if (!sameYear)
        {
            return [date
                    descriptionWithCalendarFormat:@"%b %d %Y" timeZone:nil
                    locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
        }
        
        return [date
                descriptionWithCalendarFormat:@"%b %d" timeZone:nil
                locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
    }
    
    return @"";
}

- (NSString *)itemDateTimeString
{
    NSDate *date = self;
    
    if (date)
    {
        //NSString *testString = [NSString stringWithFormat:@"%@", date];
        
        NSTimeInterval dt = -[date timeIntervalSinceNow];
        NSInteger mins = dt/60;
        NSInteger hours = mins/60;
        NSInteger days = hours/24;
        //NSInteger weeks = days/7;
        
        NSString *messageYear = [date
                                 descriptionWithCalendarFormat:@"%Y" timeZone:nil
                                 locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
        NSString *currentYear = [[NSDate date]
                                 descriptionWithCalendarFormat:@"%Y" timeZone:nil
                                 locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        //[formatter setDateFormat:@"h:mm:ss a"];
        [formatter setDateFormat:@"h:mm a"];
        NSString *time = [formatter stringFromDate:date];
        
        //NSString *time = [date descriptionWithCalendarFormat:@"%H:%M:%S" timeZone:nil
        //locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
        
        BOOL sameYear = [messageYear isEqualToString:currentYear];
        
        
        /*
         if (hours < 1)
         {
         return [NSString stringWithFormat:@"%imin", (int)mins];
         }
         */
        
        if (days < 1)
        {
            //return [NSString stringWithFormat:@"%ihr", (int)hours];
            return [NSString stringWithFormat:@"Today %@ ",  time];
        }
        
        if (days < 2)
        {
            return [NSString stringWithFormat:@"Yesterday %@ ",  time];
        }
        
        /*
         if (weeks < 1)
         {
         return [NSString stringWithFormat:@"%iwk", (int)days];
         }
         */
        
        if (!sameYear)
        {
            return [date
                    descriptionWithCalendarFormat:@"%b %d %Y" timeZone:nil
                    locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
        }
        
        return [date
                descriptionWithCalendarFormat:@"%b %d" timeZone:nil
                locale:[[NSUserDefaults standardUserDefaults] dictionaryRepresentation]];
    }
    
    return @"";
}


@end
