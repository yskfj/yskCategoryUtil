//
//  NSBundle+YSKMainBundle.h
//  plist関連の各種設定を取得する
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
