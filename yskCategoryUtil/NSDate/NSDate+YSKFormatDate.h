//
//  NSDate+YSKFormatDate.h
//  NSDate型やNSString型の日付を指定形式でフォーマットする
//

#import <Foundation/Foundation.h>

@interface NSDate(YSKFormatDate)

-(NSString*)getDateString;
-(NSString*)stringWithFormat:(NSString*)format;

@end


@interface NSString(YSKFormatDate)

-(NSDate*)dateWithFormat:(NSString*)format;

@end