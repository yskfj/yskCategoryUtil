//
//  NSString+YSKCompareVer.h
//

#import <Foundation/Foundation.h>

@interface NSString(YSKCompareVersionString)

-(BOOL)isGreaterThan:(NSString*)str;
-(BOOL)isLessThan:(NSString*)str;
-(BOOL)isGreaterThanOrEqual:(NSString*)str;
-(BOOL)isLessThanOrEqual:(NSString*)str;

+ (BOOL) checkVersionFrom:(NSString *)minVer to:(NSString *)maxVer;


@end
