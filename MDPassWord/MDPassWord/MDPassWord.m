//
//  MDPassWord.m
//  MDPassWord
//
//  Created by ccit on 16/9/12.
//  Copyright © 2016年 CCIT. All rights reserved.
//

#import "MDPassWord.h"
#import "MDTextField.h"
#import "MDKeyBoard.h"
#import "UIColor+CommonColor.h"
#import "MDInputView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MDPassWord ()

@property (nonatomic, strong) UIView *whiteView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *cancleBtn;
@property (nonatomic, strong) NSString *titleName;


@end

@implementation MDPassWord

- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        self.titleName = title;
        [self careteUI]; // 创建UI
        [self createSize]; // 添加约束
    }
    return self;
}

- (void)careteUI {
    self.whiteView = [[UIView alloc] init];
    self.whiteView.translatesAutoresizingMaskIntoConstraints = NO;
    self.whiteView.backgroundColor = [UIColor whiteColor];
//    [UIColor colorWithRed:238 / 255.0 green:238 / 255.0 blue:242 / 255.0 alpha:1.0];
    
    self.lineView = [[UIView alloc] init];
    self.lineView.translatesAutoresizingMaskIntoConstraints = NO;
    self.lineView.backgroundColor = [UIColor colorWithRGBValue:0xdddddd andAlpha:1.0];;
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.text = self.titleName;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor colorWithRGBValue:0x333333 andAlpha:1.0];
    
    self.cancleBtn = [[UIButton alloc] init];
    self.cancleBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.cancleBtn setImage:[UIImage imageNamed:@"wrong"] forState:UIControlStateNormal];
    [self.cancleBtn addTarget:self action:@selector(removeTheView:) forControlEvents:UIControlEventTouchUpInside];
    
    _keyboardView = [[MDKeyBoard alloc] init];
    _keyboardView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    self.mdTextField = [[MDTextField alloc] init];
    self.mdTextField.translatesAutoresizingMaskIntoConstraints = NO;
    _keyboardView.delegate = self.mdTextField;
    [self.mdTextField addObserver:self forKeyPath:@"textContent" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    
    [self addSubview:self.whiteView];
    [self.whiteView addSubview:self.lineView];
    [self.whiteView addSubview:self.titleLabel];
    [self.whiteView addSubview:self.cancleBtn];
    [self.whiteView addSubview:_keyboardView];
    [self.whiteView addSubview:self.mdTextField];
}

- (void)createSize {
    NSString *vVFL = [NSString stringWithFormat:@"V:|-%f-[_whiteView]-0-|", SCREEN_HEIGHT / 3];
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:@{@"_whiteView":_whiteView}];
    NSString *hVFL = @"H:|-0-[_whiteView]-0-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:nil views:@{@"_whiteView":_whiteView}];
    
    [self addConstraints:vCons];
    [self addConstraints:hCons];
    
    NSString *vVFL_line = @"V:|-50-[_lineView(0.5)]";
    NSArray *vCons_line = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_line options:0 metrics:nil views:@{@"_whiteView":_whiteView, @"_lineView":_lineView}];
    NSString *hVFL_line = @"H:|-15-[_lineView]-15-|";
    NSArray *hCons_line = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_line options:0 metrics:nil views:@{@"_lineView":_lineView}];
    
    [self.whiteView addConstraints:vCons_line];
    [self.whiteView addConstraints:hCons_line];
    
    NSString *vVFL_textField = @"V:[_lineView]-20-[_mdTextField(50)]";
    NSArray *vCons_textField = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_textField options:0 metrics:nil views:@{@"_lineView":_lineView, @"_mdTextField":_mdTextField}];
    NSString *hVFL_textField = @"H:|-20-[_mdTextField]-20-|";
    NSArray *hCons_textField = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_textField options:0 metrics:nil views:@{@"_mdTextField":_mdTextField}];
    
    [self.whiteView addConstraints:vCons_textField];
    [self.whiteView addConstraints:hCons_textField];

    
    NSString *vVFL_title = @"V:|-5-[_titleLabel(40)]";
    NSArray *vCons_title = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_title options:0 metrics:nil views:@{@"_whiteView":_whiteView, @"_titleLabel":_titleLabel}];
    NSString *hVFL_title = @"H:|-80-[_titleLabel]-80-|";
    NSArray *hCons_title = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_title options:0 metrics:nil views:@{@"_titleLabel":_titleLabel}];
    
    [self.whiteView addConstraints:vCons_title];
    [self.whiteView addConstraints:hCons_title];
    
    NSString *vVFL_cancleBtn = @"V:|-15-[_cancleBtn(15)]";
    NSArray *vCons_cancleBtn = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_cancleBtn options:0 metrics:nil views:@{@"_whiteView":_whiteView, @"_cancleBtn":_cancleBtn}];
    NSString *hVFL_cancleBtn = @"H:|-15-[_cancleBtn(15)]";
    NSArray *hCons_cancleBtn = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_cancleBtn options:0 metrics:nil views:@{@"_cancleBtn":_cancleBtn}];
    
    [self.whiteView addConstraints:vCons_cancleBtn];
    [self.whiteView addConstraints:hCons_cancleBtn];
    
    
    NSString *vVFL_keyboard = @"V:[_keyboardView(216)]-0-|";
    NSArray *vCons_keyboard = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_keyboard options:0 metrics:nil views:@{@"_keyboardView":_keyboardView}];
    NSString *hVFL_keyboard = @"H:|-0-[_keyboardView]-0-|";
    NSArray *hCons_keyboard = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_keyboard options:0 metrics:nil views:@{@"_keyboardView":_keyboardView}];
    
    [self.whiteView addConstraints:vCons_keyboard];
    [self.whiteView addConstraints:hCons_keyboard];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (self.mdTextField.text.length == 6) {
          [self removeFromSuperview];
        if (self.showPassWord) {
            self.showPassWord(self.mdTextField.text);
        }
    }
}

- (void)removeTheView:(UIButton *)sender {
    [self removeFromSuperview];
}

- (void)dealloc {
    [self.mdTextField removeObserver:self forKeyPath:@"textContent"];
}

@end
