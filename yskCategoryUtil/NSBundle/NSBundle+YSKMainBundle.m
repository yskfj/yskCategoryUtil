//
//  NSBundle+YSKMainBundle.m
//

#import "NSBundle+YSKMainBundle.h"

@implementation NSBundle(YSKMainBundle)

+ (id)infoValueFromMainBundleForKey:(NSString*)key
{
    if (key == nil) return nil;
    if ([[[self mainBundle] localizedInfoDictionary] objectForKey:key])
        return [[[self mainBundle] localizedInfoDictionary] objectForKey:key];
    return [[[self mainBundle] infoDictionary] objectForKey:key];
}

+ (NSString *)getApplicationVersion {
    return [self infoValueFromMainBundleForKey:@"CFBundleShortVersionString"];
}
+ (NSString *)getApplicationBuildVersion {
    return [self infoValueFromMainBundleForKey:@"CFBundleVersion"];
}
+ (NSString *)getApplicationName {
    return [self infoValueFromMainBundleForKey:@"CFBundleDisplayName"];
}
+(NSString *)getApplicationBundleIdentifer
{
    return [[self mainBundle] bundleIdentifier];
}
+(NSString *) getApplicationUrlScheme {
    return [[[[[[self mainBundle] infoDictionary] valueForKey:@"CFBundleURLTypes"] objectAtIndex:0] valueForKey:@"CFBundleURLSchemes"] objectAtIndex:0];
}
@end