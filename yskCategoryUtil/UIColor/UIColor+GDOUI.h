//
//  UIColor+GDOUI.h
//  TourApp
//
//  Created by 藤井洋介 on 2014/03/04.
//  Copyright (c) 2014年 Golf Digest Online Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FlatUI)

// Calc Color
+ (UIColor *) colorWithHexString: (NSString *) hexString;
+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;

+ (UIColor *) colorWithGDOCornerPathname:(NSString *)name;
+ (UIColor *) colorWithGDOCornerPathname:(NSString *)name opacity:(CGFloat)opacity;

// GDO Color
+ (UIColor *)gdoColor;
+ (UIColor *)styleNeoAthleteColor;
+ (UIColor *)styleGoldColor;
+ (UIColor *)styleWomanColor;
+ (UIColor *)styleWorldColor;
+ (UIColor *)tourAsianColor;
+ (UIColor *)tourOneasiaColor;
+ (UIColor *)tourJpgaColor;
+ (UIColor *)tourJlpgaColor;
+ (UIColor *)tourJgtoColor;
+ (UIColor *)tourEupgColor;
+ (UIColor *)tourChampColor;
+ (UIColor *)tourLpgaColor;
+ (UIColor *)tourPgaColor;

+ (UIColor *)golftecColor;

// FlatUI Color
+ (UIColor *)turquoiseFlatColor;
+ (UIColor *)greenSeaFlatColor;
+ (UIColor *)emeraldFlatColor;
+ (UIColor *)nephritisFlatColor;
+ (UIColor *)peterRiverFlatColor;
+ (UIColor *)belizeHoleFlatColor;
+ (UIColor *)amethystFlatColor;
+ (UIColor *)wisteriaFlatColor;
+ (UIColor *)wetAsphaltFlatColor;
+ (UIColor *)midnightBlueFlatColor;
+ (UIColor *)sunFlowerFlatColor;
+ (UIColor *)orangeFlatColor;
+ (UIColor *)carrotFlatColor;
+ (UIColor *)pumpkinFlatColor;
+ (UIColor *)alizarinFlatColor;
+ (UIColor *)pomegranateFlatColor;
+ (UIColor *)cloudsFlatColor;
+ (UIColor *)silverFlatColor;
+ (UIColor *)concreteFlatColor;
+ (UIColor *)asbestosFlatColor;

@end