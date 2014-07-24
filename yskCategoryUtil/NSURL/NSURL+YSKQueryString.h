//
//  NSURL+YSKQueryString.h
//  NSURLやNSString型のURLにパラメータを付与する
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
