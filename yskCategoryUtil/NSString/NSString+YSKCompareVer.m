//
//  NSString+YSKCompareVer.m
//

#import "NSString+YSKCompareVer.h"

@implementation NSString(YSKCompareVersionString)

-(BOOL)isGreaterThan:(NSString*)str
{
    NSComparisonResult result = [self compare:str options:NSNumericSearch];
    if (result == NSOrderedAscending) return YES;
    return NO;
}
-(BOOL)isLessThan:(NSString*)str
{
    NSComparisonResult result = [self compare:str options:NSNumericSearch];
    if (result == NSOrderedDescending) return YES;
    return NO;
}
-(BOOL)isGreaterThanOrEqual:(NSString*)str
{
    NSComparisonResult result = [self compare:str options:NSNumericSearch];
    if (result == NSOrderedDescending) return NO;
    return YES;
}
-(BOOL)isLessThanOrEqual:(NSString*)str
{
    NSComparisonResult result = [self compare:str options:NSNumericSearch];
    if (result == NSOrderedAscending) return NO;
    return YES;
}

+ (BOOL) checkVersionFrom:(NSString *)minVer to:(NSString *)maxVer {
    BOOL ret = YES;
    NSString *ver = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    if (minVer == nil || [minVer isEqualToString:@""]) minVer = @"0";
    if (maxVer == nil || [maxVer isEqualToString:@""]) maxVer = @"100";
    NSComparisonResult minComp = [minVer compare:ver options:NSNumericSearch];
    NSComparisonResult maxComp = [maxVer compare:ver options:NSNumericSearch];
    if (minComp == NSOrderedDescending) {
        ret = NO;
    }
    if (maxComp == NSOrderedAscending) {
        ret = NO;
    }
    return ret;
}


@end
