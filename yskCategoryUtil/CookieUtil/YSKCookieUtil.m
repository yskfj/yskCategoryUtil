#import "YSKCookieUtil.h"

static NSString *const kDefaultStorageKey = @"YSKCookieUtilSavedHTTPCookies";

@interface YSKCookieUtil()

@property (nonatomic,strong) NSString *storageKey;

@end


@implementation YSKCookieUtil

+ (instancetype)sharedInstance
{
    static YSKCookieUtil *_sharedInstance= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[YSKCookieUtil alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.storageKey = kDefaultStorageKey;
    }
    return self;
}

- (void)storageKey:(NSString *)key
{
    self.storageKey = key;
}

- (void)saveCookiesToStorage
{
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject:
                           [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    [[NSUserDefaults standardUserDefaults] setObject:cookiesData
                                              forKey:self.storageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)loadCookiesFromStorage
{
    NSData *cookiesData = [[NSUserDefaults standardUserDefaults]
                           objectForKey:self.storageKey];
    if (cookiesData) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesData];
        for (NSHTTPCookie *cookie in cookies)
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    }

}
- (void)deleteCookiesFromStorage
{
    NSHTTPCookieStorage *cookieStrage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (id obj in [cookieStrage cookies]) {
        [cookieStrage deleteCookie:obj];
    }
}
- (NSString*)getCookieFromStorageForKey:(NSString*)key domain:(NSString*)domain
{
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [cookieJar cookies]) {
        if ([domain isEqualToString:cookie.domain] && [key isEqualToString:cookie.name]) {
            return cookie.value;
        }
    }
    return nil;
}


@end
