//
//  MDKeyBoard.m
//  MDPassWord
//
//  Created by ccit on 16/9/26.
//  Copyright © 2016年 CCIT. All rights reserved.
//

#import "MDKeyBoard.h"
#import "UIColor+CommonColor.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MDKeyBoard ()

@property (nonatomic, strong) NSArray *numArray;

@end
@implementation MDKeyBoard

- (id)init {
    if (self = [super init]) {
        [self setKeyBoardNum];
    }
    return self;
}

+ (id)keyboardView {
    MDKeyBoard *md = [[self alloc] init];
    return md;
}

- (void)setKeyBoardNum {
    self.numArray = [[NSArray alloc] init];
    self.numArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"",@"0",@" "];
    
    for (int i = 0; i < 12; i++) {
        UIButton *numBtn = [[UIButton alloc] init];
        CGFloat x = SCREEN_WIDTH / 3;
        CGFloat y = 216 / 4;
        numBtn.frame = CGRectMake(i % 3 * x, i / 3 * y, x, y);
        [numBtn setTitle:self.numArray[i] forState:UIControlStateNormal];
        numBtn.layer.borderWidth = 0.25;
        numBtn.layer.borderColor = [UIColor colorWithRGBValue:0xc8cace andAlpha:1.0].CGColor;
        numBtn.enabled = YES;
        numBtn.tag = i + 1;
        if (i == 9) {
            
        }else if (i == 11) {
            [numBtn setImage:[UIImage imageNamed:@"cross"] forState:UIControlStateNormal];
        }else {
            
            if (i == 10) {
                numBtn.tag = 0;
            }
            
            [numBtn.titleLabel setFont:[UIFont systemFontOfSize:26]];
            [numBtn setTitleColor:[UIColor colorWithRGBValue:0x000000 andAlpha:1.0] forState:UIControlStateNormal];
        }
        [numBtn addTarget:self action:@selector(keyValuePress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:numBtn];
    }
}

- (void)keyValuePress:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(getTheKeyboardNum:)])
    {
        [self.delegate getTheKeyboardNum:sender];
    }
}

@end
