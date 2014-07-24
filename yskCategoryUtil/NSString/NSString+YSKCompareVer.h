//
//  NSString+YSKCompareVer.h
//  ShopApp
//
//  Created by 藤井洋介 on 2014/06/20.
//  Copyright (c) 2014年 Golf Digest Online Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(YSKCompareVersionString)

-(BOOL)isGreaterThan:(NSString*)str;
-(BOOL)isLessThan:(NSString*)str;
-(BOOL)isGreaterThanOrEqual:(NSString*)str;
-(BOOL)isLessThanOrEqual:(NSString*)str;

+ (BOOL) checkVersionFrom:(NSString *)minVer to:(NSString *)maxVer;


@end
