//
//  UIColor+GDOUI.h
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


// UIImage+Tint.h

@interface UIImage (tintedImage)

- (UIImage *)tintedImageWithColor:(UIColor *)tintColor;

@end


