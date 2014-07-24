//
//  NSDate+YSKFormatDate.h
//

#import <Foundation/Foundation.h>

@interface NSDate(YSKFormatDate)

-(NSString*)getDateString;
-(NSString*)stringWithFormat:(NSString*)format;
-(NSInteger)getAge;

@end


@interface NSString(YSKFormatDate)

-(NSDate*)dateWithFormat:(NSString*)format;

@end