//
//  NSString+YSKZenHan.h
//  Pods
//
//  Created by 藤井洋介 on 2014/11/13.
//
//

#import <Foundation/Foundation.h>

@interface NSString (NSString_YSKZenHan)

// 半角→全角
- (NSString*) stringToFullwidth;

// 全角→半角
- (NSString*) stringToHalfwidth;

// カタカナ→ひらがな
- (NSString*) stringKatakanaToHiragana;

// ひらがな→カタカナ
- (NSString*) stringHiraganaToKatakana;

// ひらがな→ローマ字
- (NSString*) stringHiraganaToLatin;

// ローマ字→ひらがな
- (NSString*) stringLatinToHiragana;

// カタカナ→ローマ字
- (NSString*) stringKatakanaToLatin;

// ローマ字→カタカナ
- (NSString*) stringLatinToKatakana;

@end
