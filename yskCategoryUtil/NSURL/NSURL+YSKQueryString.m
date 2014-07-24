//
//  NSURL+YSKQueryString.m
//

#import "NSURL+YSKQueryString.h"

@implementation NSURL (YSKQueryString)

- (NSURL *)URLByAppendingQueryString:(NSString *)queryString {
    if (![queryString length]) {
        return self;
    }
    
    NSString *URLString = [[NSString alloc] initWithFormat:@"%@%@%@", [self absoluteString],
                           [self query] ? @"&" : @"?", queryString];
    NSURL *theURL = [NSURL URLWithString:URLString];
    return theURL;
}

- (NSURL*)replaceSchemeTo:(NSString*)scheme;
{
    NSString *str = [self absoluteString];
    NSInteger colon = [str rangeOfString:@":"].location;
    if (colon != NSNotFound) {
        str = [str substringFromIndex:colon];
        str = [scheme stringByAppendingString:str];
    }
    return [NSURL URLWithString:str];
}

- (NSString*)urlEncode
{
    NSString *str = [self absoluteString];
    return [str urlEncode];
}

- (NSDictionary *)parseQueryString
{
    NSString *query = [self query];
    if (self == nil) return @{};
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [dict setObject:val forKey:key];
    }
    return dict;
}

@end

@implementation NSString (YSKQueryString)

- (NSURL *)URLByAppendingQueryString:(NSString *)queryString
{
    if (![queryString length]) {
        return [NSURL URLWithString:self];
    }
    
    NSString *URLString = [[NSString alloc] initWithFormat:@"%@%@%@", self,
                           [self rangeOfString:@"?"].length > 0 ? @"&" : @"?", queryString];
    NSURL *theURL = [NSURL URLWithString:URLString];
    return theURL;
}


- (NSString *)URLStringByAppendingQueryString:(NSString *)queryString
{
    if (![queryString length]) {
        return self;
    }
    return [NSString stringWithFormat:@"%@%@%@", self,
            [self rangeOfString:@"?"].length > 0 ? @"&" : @"?", queryString];
}

- (NSString *)urlEncode
{
    if (self == nil) return nil;
    return (NSString*)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
kCFAllocatorDefault,(CFStringRef)self,NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]",kCFStringEncodingUTF8));
}

@end
