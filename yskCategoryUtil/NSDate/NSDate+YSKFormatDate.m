//
//  NSDate+YSKFormatDate.m
//

#import "NSDate+YSKFormatDate.h"

@implementation NSDate(YSKFormatDate)

-(NSString*)getDateString
{
    return [self stringWithFormat:@"yyyy/MM/dd HH:mm"];
}

-(NSString*)stringWithFormat:(NSString*)format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"JST"];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

@end


@implementation NSString(YSKFormatDate)

-(NSDate*)dateWithFormat:(NSString*)format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"JST"];
    [formatter setDateFormat:format];
    return [formatter dateFromString:self];
}

@end