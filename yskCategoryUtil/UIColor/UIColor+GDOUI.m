//
//  UIColor+GDOUI.m
//  TourApp
//
//  Created by 藤井洋介 on 2014/03/04.
//  Copyright (c) 2014年 Golf Digest Online Inc. All rights reserved.
//

#import "UIColor+GDOUI.h"

@implementation UIColor (FlatUI)

# pragma mark Calc Color

+ (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}


+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

# pragma mark GDO Color

+ (UIColor *) colorWithGDOCornerPathname:(NSString *)name {
    return [self colorWithGDOCornerPathname:name opacity:1.0f];
}

+ (UIColor *) colorWithGDOCornerPathname:(NSString *)name opacity:(CGFloat)opacity {
    NSString *k = @"gdo";
    NSDictionary *d = @{
                        @"gdo":@"#3695d7",
                        @"neo-athlete":@"#017ca6",
                        @"style-golf":@"#694114",
                        @"woman":@"#dd4a99",
                        @"world":@"#ff4d22",
                        @"asian":@"#093f7f",
                        @"oneasia":@"#ec0927",
                        @"jpga":@"#253b90",
                        @"jlpga":@"#ee5678",
                        @"jgto":@"#016948",
                        @"eupg":@"#0168aa",
                        @"champ":@"#6a0701",
                        @"lpga":@"#c94143",
                        @"pga":@"#0a1e63"
                        };
    if ([[d allKeys] containsObject:name]) {
        k = name;
    }
    return [UIColor colorWithHexString:d[k]];

}


+ (UIColor *)gdoColor {
    return [UIColor colorWithHexString:@"#2C81CD"];
}
+ (UIColor *)styleNeoAthleteColor {
    return [UIColor colorWithGDOCornerPathname:@"neo-athlete"];
}
+ (UIColor *)styleGoldColor {
    return [UIColor colorWithGDOCornerPathname:@"style-gold"];
}
+ (UIColor *)styleWomanColor {
    return [UIColor colorWithGDOCornerPathname:@"woman"];
}
+ (UIColor *)styleWorldColor {
    return [UIColor colorWithGDOCornerPathname:@"world"];
}
+ (UIColor *)tourAsianColor {
    return [UIColor colorWithGDOCornerPathname:@"asian"];
}
+ (UIColor *)tourOneasiaColor {
    return [UIColor colorWithGDOCornerPathname:@"oneasia"];
}
+ (UIColor *)tourJpgaColor {
    return [UIColor colorWithGDOCornerPathname:@"jpga"];
}
+ (UIColor *)tourJlpgaColor {
    return [UIColor colorWithGDOCornerPathname:@"jlpga"];
}
+ (UIColor *)tourJgtoColor {
    return [UIColor colorWithGDOCornerPathname:@"jgto"];
}
+ (UIColor *)tourEupgColor {
    return [UIColor colorWithGDOCornerPathname:@"eupg"];
}
+ (UIColor *)tourChampColor {
    return [UIColor colorWithGDOCornerPathname:@"champ"];
}
+ (UIColor *)tourLpgaColor {
    return [UIColor colorWithGDOCornerPathname:@"lpga"];
}
+ (UIColor *)tourPgaColor {
    return [UIColor colorWithGDOCornerPathname:@"pga"];
}


# pragma mark FlatUI Color

+ (UIColor *)turquoiseFlatColor
{
    return [UIColor colorWithRed:0.10196078431372549 green:0.7372549019607844 blue:0.611764705882353 alpha:1.0];
}

+ (UIColor *)greenSeaFlatColor
{
    return [UIColor colorWithRed:0.08627450980392157 green:0.6274509803921569 blue:0.5215686274509804 alpha:1.0];
}

+ (UIColor *)emeraldFlatColor
{
    return [UIColor colorWithRed:0.1803921568627451 green:0.8 blue:0.44313725490196076 alpha:1.0];
}

+ (UIColor *)nephritisFlatColor
{
    return [UIColor colorWithRed:0.15294117647058825 green:0.6823529411764706 blue:0.3764705882352941 alpha:1.0];
}

+ (UIColor *)peterRiverFlatColor
{
    return [UIColor colorWithRed:0.20392156862745098 green:0.596078431372549 blue:0.8588235294117647 alpha:1.0];
}

+ (UIColor *)belizeHoleFlatColor
{
    return [UIColor colorWithRed:0.1607843137254902 green:0.5019607843137255 blue:0.7254901960784313 alpha:1.0];
}

+ (UIColor *)amethystFlatColor
{
    return [UIColor colorWithRed:0.6078431372549019 green:0.34901960784313724 blue:0.7137254901960784 alpha:1.0];
}

+ (UIColor *)wisteriaFlatColor
{
    return [UIColor colorWithRed:0.5568627450980392 green:0.26666666666666666 blue:0.6784313725490196 alpha:1.0];
}

+ (UIColor *)wetAsphaltFlatColor
{
    return [UIColor colorWithRed:0.20392156862745098 green:0.28627450980392155 blue:0.3686274509803922 alpha:1.0];
}

+ (UIColor *)midnightBlueFlatColor
{
    return [UIColor colorWithRed:0.17254901960784313 green:0.24313725490196078 blue:0.3137254901960784 alpha:1.0];
}

+ (UIColor *)sunFlowerFlatColor
{
    return [UIColor colorWithRed:0.9450980392156862 green:0.7686274509803922 blue:0.058823529411764705 alpha:1.0];
}

+ (UIColor *)orangeFlatColor
{
    return [UIColor colorWithRed:0.9529411764705882 green:0.611764705882353 blue:0.07058823529411765 alpha:1.0];
}

+ (UIColor *)carrotFlatColor
{
    return [UIColor colorWithRed:0.9019607843137255 green:0.49411764705882355 blue:0.13333333333333333 alpha:1.0];
}

+ (UIColor *)pumpkinFlatColor
{
    return [UIColor colorWithRed:0.8274509803921568 green:0.32941176470588235 blue:0.0 alpha:1.0];
}

+ (UIColor *)alizarinFlatColor
{
    return [UIColor colorWithRed:0.9058823529411765 green:0.2980392156862745 blue:0.23529411764705882 alpha:1.0];
}

+ (UIColor *)pomegranateFlatColor
{
    return [UIColor colorWithRed:0.7529411764705882 green:0.2235294117647059 blue:0.16862745098039217 alpha:1.0];
}

+ (UIColor *)cloudsFlatColor
{
    return [UIColor colorWithRed:0.9254901960784314 green:0.9411764705882353 blue:0.9450980392156862 alpha:1.0];
}

+ (UIColor *)silverFlatColor
{
    return [UIColor colorWithRed:0.7411764705882353 green:0.7647058823529411 blue:0.7803921568627451 alpha:1.0];
}

+ (UIColor *)concreteFlatColor
{
    return [UIColor colorWithRed:0.5843137254901961 green:0.6470588235294118 blue:0.6509803921568628 alpha:1.0];
}

+ (UIColor *)asbestosFlatColor
{
    return [UIColor colorWithRed:0.4980392156862745 green:0.5490196078431373 blue:0.5529411764705883 alpha:1.0];
}

@end