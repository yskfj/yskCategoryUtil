//
//  NSString+YSKZenHan.m
//  Pods
//
//  Created by 藤井洋介 on 2014/11/13.
//
//

#import "NSString+YSKZenHan.h"

@implementation NSString (NSString_YSKZenHan)

- (NSString*) stringTransformWithTransform:(CFStringRef)transform reverse:(Boolean)reverse {
    NSMutableString* retStr = [[NSMutableString alloc] initWithString:self];
    CFStringTransform((CFMutableStringRef)retStr, NULL, transform, reverse);
    return retStr;
}

- (NSString*) stringToFullwidth {
    return [self stringTransformWithTransform:kCFStringTransformFullwidthHalfwidth
                                      reverse:true];
}

- (NSString*) stringToHalfwidth {
    return [self stringTransformWithTransform:kCFStringTransformFullwidthHalfwidth
                                      reverse:false];
}

- (NSString*) stringKatakanaToHiragana {
    return [self stringTransformWithTransform:kCFStringTransformHiraganaKatakana
                                      reverse:true];
}

- (NSString*) stringHiraganaToKatakana {
    return [self stringTransformWithTransform:kCFStringTransformHiraganaKatakana
                                      reverse:false];
}

- (NSString*) stringHiraganaToLatin {
    return [self stringTransformWithTransform:kCFStringTransformLatinHiragana
                                      reverse:true];
}

- (NSString*) stringLatinToHiragana {
    return [self stringTransformWithTransform:kCFStringTransformLatinHiragana
                                      reverse:false];
}

- (NSString*) stringKatakanaToLatin {
    return [self stringTransformWithTransform:kCFStringTransformLatinKatakana
                                      reverse:true];
}

- (NSString*) stringLatinToKatakana {
    return [self stringTransformWithTransform:kCFStringTransformLatinKatakana
                                      reverse:false];
}

- (NSString*) stringToReadableStr {
    if (self == nil) return nil;
    if ([self isEqualToString:@""]) return @"";
    
    NSArray *fragments = [self componentsSeparatedByString:@"\\u"];
    if([fragments count])
    {
        NSEnumerator *stringEnumerator = [fragments objectEnumerator];
        NSMutableString *decodedString =
        [[stringEnumerator nextObject] mutableCopy];
        
        NSString *nextFragment;
        while(nextFragment = [stringEnumerator nextObject])
        {
            if([nextFragment length] >= 4)
            {
                unichar decodedCharacter = 0;
                
                for(int c = 0; c < 4; c++)
                {
                    unichar hexValue = [nextFragment characterAtIndex:c];
                    
                    if(hexValue >= 'a')
                        hexValue = 0xa + (hexValue - 'a');
                    else
                        hexValue = hexValue - '0';
                    
                    decodedCharacter = (decodedCharacter << 4) + hexValue;
                }
                
                [decodedString appendFormat:@"%C", decodedCharacter];
                [decodedString appendString:[nextFragment substringFromIndex:4]];
            }
            else
            {
                // there seems to be a parsing error; maybe just append
                // next fragment?
            }
        }
        return decodedString;
    }
    return self;
}

@end
