//
//  NSURL+YSKQueryString.h
//  ShopApp
//
//  Created by 藤井洋介 on 2014/06/20.
//  Copyright (c) 2014年 Golf Digest Online Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (YSKQueryString)

- (NSURL*)URLByAppendingQueryString:(NSString *)queryString;
- (NSURL*)replaceSchemeTo:(NSString*)scheme;
- (NSString*)urlEncode;
- (NSDictionary *)parseQueryString;

@end

@interface NSString (YSKQueryString)

- (NSURL*)URLByAppendingQueryString:(NSString *)queryString;
- (NSString*)URLStringByAppendingQueryString:(NSString *)queryString;
- (NSString*)urlEncode;

@end
