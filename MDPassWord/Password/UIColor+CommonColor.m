//
//  UIColor+CommonColor.m
//  MDPassWord
//
//  Created by ccit on 16/9/26.
//  Copyright © 2016年 CCIT. All rights reserved.
//

#import "UIColor+CommonColor.h"

@implementation UIColor (CommonColor)

+ (UIColor *)colorWithRGBValue:(NSUInteger)RGBValue andAlpha:(CGFloat)AlphaValue {
    
    CGFloat a =(CGFloat) (RGBValue / 0x10000);
    CGFloat b =(CGFloat) (RGBValue % 0x10000 / 0x100);
    CGFloat c =(CGFloat) (RGBValue % 0x100);
    
    
    return [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:AlphaValue];
}

@end
