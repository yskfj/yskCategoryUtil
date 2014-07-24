//
//  NSBundle+YSKMainBundle.h
//  ShopApp
//
//  Created by 藤井洋介 on 2014/06/20.
//  Copyright (c) 2014年 Golf Digest Online Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle(YSKMainBundle)

+ (id)infoValueFromMainBundleForKey:(NSString*)key;

+(NSString *)getApplicationVersion;
+(NSString *)getApplicationBuildVersion;
+(NSString *)getApplicationName;
+(NSString *)getApplicationBundleIdentifer;
+(NSString *)getApplicationUrlScheme;

@end
