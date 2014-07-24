#import <Foundation/Foundation.h>

@interface YSKCookieUtil : NSObject

+ (instancetype)sharedInstance;

- (void)storageKey:(NSString*)key;
- (void)saveCookiesToStorage;
- (void)loadCookiesFromStorage;
- (void)deleteCookiesFromStorage;
- (NSString*)getCookieFromStorageForKey:(NSString*)key domain:(NSString*)domain;

@end
