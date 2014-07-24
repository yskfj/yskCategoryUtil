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
-(NSInteger)getAge
{
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSYearCalendarUnit
                                       fromDate:self
                                       toDate:now
                                       options:0];
    return [ageComponents year];
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