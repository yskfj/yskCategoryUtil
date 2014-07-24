//
//  NSDate+YSKFormatDate.h
//  ShopApp
//
//  Created by 藤井洋介 on 2014/06/20.
//  Copyright (c) 2014年 Golf Digest Online Inc. All rights reserved.
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