//
//  MDTextField.m
//  MDPassWord
//
//  Created by ccit on 16/9/26.
//  Copyright © 2016年 CCIT. All rights reserved.
//

#import "MDTextField.h"
#import "MDKeyBoard.h"
#import "MDInputView.h"
@interface MDTextField ()

@property (nonatomic, strong) MDInputView *mdin;

@end

@implementation MDTextField

- (instancetype)init {
    if (self = [super init]) {
        MDKeyBoard *md = [MDKeyBoard keyboardView];
        md.delegate = self;
        self.font = [UIFont systemFontOfSize:0.0];
        self.inputView = md;
        [self becomeFirstResponder];
    }
    return self;
}

- (void)layoutSubviews {
    _mdin = [[MDInputView alloc] init];
    _mdin.frame = self.bounds;
    [self addSubview:_mdin];
}

- (void)getTheKeyboardNum:(UIButton *)btn {
    if (btn.tag <= 9 || btn.tag == 0) {
        if (self.text.length < 6) {
            [self insertText:[NSString stringWithFormat:@"%ld",(long)btn.tag]];
        }
    }else if (btn.tag == 12){
        [self deleteBackward];
    }
    [_mdin setRoundsView:(int)self.text.length];
    self.textContent = self.text;
    NSLog(@"%@", self.text);
}

@end
