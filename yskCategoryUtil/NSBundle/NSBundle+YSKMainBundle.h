//
//  NSBundle+YSKMainBundle.h
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
