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

- (NSString*)urlDecode
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
        if( elements.count < 2) continue;
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [dict setObject:val forKey:key];
    }
    return dict;
}

- (NSURL*)URLByAppendingQueryStringDictionary:(NSDictionary*)queryDic
{
    NSString *scheme      = [self scheme];
    NSString *host        = [self host];
//    NSString *path        = [self path];
    NSString *path        = (NSString*)CFBridgingRelease(CFURLCopyPath((CFURLRef)self));
    NSNumber *port        = [self port];
    NSString *fragment    = [self fragment];
    __block NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:[self parseQueryString]];

    
    [queryDic enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
        [dic setObject:obj forKey:key];
    }];

    __block NSMutableString *queryString = @"".mutableCopy;
    [dic enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
        if ([queryString isEqualToString:@""]) {
            [queryString appendString:@"?"];
        } else {
            [queryString appendString:@"&"];
        }
        [queryString appendString:[NSString stringWithFormat:@"%@=%@",key,obj]];
    }];
    
    NSMutableString *url = [NSString stringWithFormat:@"%@://%@",scheme,host].mutableCopy;
    if (![port isEqualToNumber:@80] && port != nil) {
        [url appendString:[NSString stringWithFormat:@":%@",port]];
    }
    [url appendString:[NSString stringWithFormat:@"%@%@",path,queryString]];
    if (fragment != nil && ![fragment isEqualToString:@""]) {
        [url appendString:[NSString stringWithFormat:@"#%@",fragment]];
    }
    return [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
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

- (NSString*)urlDecode
{
    if (self == nil) return nil;
    return (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,(CFStringRef)self,CFSTR(""),kCFStringEncodingUTF8));
}

- (NSURL*)URLByAppendingQueryStringDictionary:(NSDictionary*)queryDic
{
    if (self == nil) return nil;
    return [[NSURL URLWithString:self] URLByAppendingQueryStringDictionary:queryDic];
}

- (NSString*)URLStringByAppendingQueryStringDictionary:(NSDictionary*)queryDic
{
    return [[self URLByAppendingQueryStringDictionary:queryDic] absoluteString];
}


@end
