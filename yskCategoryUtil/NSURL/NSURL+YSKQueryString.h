//
//  NSURL+YSKQueryString.h
//

#import <Foundation/Foundation.h>

@interface NSURL (YSKQueryString)

- (NSURL*)URLByAppendingQueryString:(NSString *)queryString;
- (NSURL*)replaceSchemeTo:(NSString*)scheme;
- (NSString*)urlEncode;
- (NSDictionary *)parseQueryString;
- (NSURL*)URLByAppendingQueryStringDictionary:(NSDictionary*)queryDic;


@end

@interface NSString (YSKQueryString)

- (NSURL*)URLByAppendingQueryString:(NSString *)queryString;
- (NSString*)URLStringByAppendingQueryString:(NSString *)queryString;
- (NSString*)urlEncode;
- (NSURL*)URLByAppendingQueryStringDictionary:(NSDictionary*)queryDic;
- (NSString*)URLStringByAppendingQueryStringDictionary:(NSDictionary*)queryDic;

@end
