//
//  MDInputView.m
//  MDPassWord
//
//  Created by ccit on 16/9/29.
//  Copyright © 2016年 CCIT. All rights reserved.
//

#import "MDInputView.h"
#import "UIColor+CommonColor.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MDInputView ()

@property (nonatomic, strong)UIView *view1;
@property (nonatomic, strong)UIView *view2;
@property (nonatomic, strong)UIView *view3;
@property (nonatomic, strong)UIView *view4;
@property (nonatomic, strong)UIView *view5;
@property (nonatomic, strong)NSMutableArray *rounds;
@property (nonatomic, strong)UIView *round1;
@property (nonatomic, strong)UIView *round2;
@property (nonatomic, strong)UIView *round3;
@property (nonatomic, strong)UIView *round4;
@property (nonatomic, strong)UIView *round5;
@property (nonatomic, strong)UIView *round6;

@end
@implementation MDInputView

- (id)init {
    if (self = [super init]) {
        self.layer.borderWidth = 0.8;
        self.layer.borderColor = [UIColor colorWithRGBValue:0xc8cace andAlpha:1.0].CGColor;
        [self setHLine];
    }
    return self;
}

- (void)setRoundsView:(int)num {
    for (UIView *round in _rounds) {
        round.hidden = YES;
    }
    
    [self.rounds enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < num) {
            ((UIView *)obj).hidden = NO;
        }
    }];
    
}

- (void)setHLine {
    _view1 = [self createHLine];
    _view1.backgroundColor = [UIColor colorWithRGBValue:0xc8cace andAlpha:1.0];
    _view1.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_view1];
    
    _view2 = [self createHLine];
    _view2.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_view2];
    
    _view3= [self createHLine];
    _view3.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_view3];
    
    _view4 = [self createHLine];
    _view4.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_view4];
    
    _view5 = [self createHLine];
    _view5.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_view5];
    
    _rounds = [[NSMutableArray alloc] init];
    
    [self createRounds];
}

- (void)createRounds {
    _round1 = [[UIView alloc] init];
    _round1.backgroundColor = [UIColor blackColor];
    _round1.translatesAutoresizingMaskIntoConstraints = NO;
    [_rounds addObject:_round1];
    
    _round2 = [[UIView alloc] init];
    _round2.backgroundColor = [UIColor blackColor];
    _round2.translatesAutoresizingMaskIntoConstraints = NO;
    [_rounds addObject:_round2];
    
    _round3 = [[UIView alloc] init];
    _round3.backgroundColor = [UIColor blackColor];
    _round3.translatesAutoresizingMaskIntoConstraints = NO;
    [_rounds addObject:_round3];
    
    _round4 = [[UIView alloc] init];
    _round4.backgroundColor = [UIColor blackColor];
    _round4.translatesAutoresizingMaskIntoConstraints = NO;
    [_rounds addObject:_round4];
    
    _round5 = [[UIView alloc] init];
    _round5.backgroundColor = [UIColor blackColor];
    _round5.translatesAutoresizingMaskIntoConstraints = NO;
    [_rounds addObject:_round5];
    
    _round6 = [[UIView alloc] init];
    _round6.backgroundColor = [UIColor blackColor];
    _round6.translatesAutoresizingMaskIntoConstraints = NO;
    [_rounds addObject:_round6];
    
    [self addSubview:_round1];
    [self addSubview:_round2];
    [self addSubview:_round3];
    [self addSubview:_round4];
    [self addSubview:_round5];
    [self addSubview:_round6];
    [self setRoundsView:0];
}

- (void)layoutSubviews {
    
    NSString *vVFL_view1 = [NSString stringWithFormat:@"V:|-0-[_view1]-0-|"];
    NSArray *vCons_view1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_view1 options:0 metrics:nil views:@{@"_view1":_view1}];
    NSString *hVFL_view1 = [NSString stringWithFormat:@"H:|-%f-[_view1(0.5)]", self.frame.size.width / 6] ;
    NSArray *hCons_view1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_view1 options:0 metrics:nil views:@{@"_view1":_view1}];
    
    [self addConstraints:vCons_view1];
    [self addConstraints:hCons_view1];
    
    NSString *vVFL_view2 = [NSString stringWithFormat:@"V:|-0-[_view2]-0-|"];
    NSArray *vCons_view2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_view2 options:0 metrics:nil views:@{@"_view2":_view2}];
    NSString *hVFL_view2 = [NSString stringWithFormat:@"H:[_view1]-%f-[_view2(0.5)]", self.frame.size.width / 6] ;
    NSArray *hCons_view2 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_view2 options:0 metrics:nil views:@{@"_view2":_view2, @"_view1":_view1}];
    
    [self addConstraints:vCons_view2];
    [self addConstraints:hCons_view2];
    
    NSString *vVFL_view3 = [NSString stringWithFormat:@"V:|-0-[_view3]-0-|"];
    NSArray *vCons_view3 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_view3 options:0 metrics:nil views:@{@"_view3":_view3}];
    NSString *hVFL_view3 = [NSString stringWithFormat:@"H:[_view2]-%f-[_view3(0.5)]", self.frame.size.width / 6] ;
    NSArray *hCons_view3 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_view3 options:0 metrics:nil views:@{@"_view2":_view2, @"_view3":_view3}];
    
    [self addConstraints:vCons_view3];
    [self addConstraints:hCons_view3];
    
    NSString *vVFL_view4 = [NSString stringWithFormat:@"V:|-0-[_view4]-0-|"];
    NSArray *vCons_view4 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_view4 options:0 metrics:nil views:@{@"_view4":_view4}];
    NSString *hVFL_view4 = [NSString stringWithFormat:@"H:[_view3]-%f-[_view4(0.5)]", self.frame.size.width / 6] ;
    NSArray *hCons_view4 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_view4 options:0 metrics:nil views:@{@"_view3":_view3, @"_view4":_view4}];
    
    [self addConstraints:vCons_view4];
    [self addConstraints:hCons_view4];
    
    NSString *vVFL_view5 = [NSString stringWithFormat:@"V:|-0-[_view5]-0-|"];
    NSArray *vCons_view5 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_view5 options:0 metrics:nil views:@{@"_view5":_view5}];
    NSString *hVFL_view5 = [NSString stringWithFormat:@"H:[_view4]-%f-[_view5(0.5)]", self.frame.size.width / 6] ;
    NSArray *hCons_view5 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_view5 options:0 metrics:nil views:@{@"_view4":_view4, @"_view5":_view5}];
    
    [self addConstraints:vCons_view5];
    [self addConstraints:hCons_view5];
    
    NSString *vVFL_round1 = [NSString stringWithFormat:@"V:[_round1(%f)]", self.frame.size.width / 12];
    NSArray *vCons_round1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_round1 options:0 metrics:nil views:@{@"_round1":_round1}];
    NSString *hVFL_round1 = [NSString stringWithFormat:@"H:|-%f-[_round1(%f)]", self.frame.size.width / 24, self.frame.size.width / 12] ;
    NSArray *hCons_round1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_round1 options:0 metrics:nil views:@{@"_round1":_round1}];
    _round1.layer.cornerRadius = self.frame.size.width / 24;
    
    [self addConstraints:vCons_round1];
    [self addConstraints:hCons_round1];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_round1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    NSString *vVFL_round2 = [NSString stringWithFormat:@"V:[_round2(%f)]", self.frame.size.width / 12];
    NSArray *vCons_round2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_round2 options:0 metrics:nil views:@{@"_round2":_round2}];
    NSString *hVFL_round2 = [NSString stringWithFormat:@"H:[_view1]-%f-[_round2(%f)]", self.frame.size.width / 24, self.frame.size.width / 12] ;
    NSArray *hCons_round2 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_round2 options:0 metrics:nil views:@{@"_round2":_round2, @"_view1":_view1}];
    _round2.layer.cornerRadius = self.frame.size.width / 24;
    
    [self addConstraints:vCons_round2];
    [self addConstraints:hCons_round2];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_round2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    NSString *vVFL_round3 = [NSString stringWithFormat:@"V:[_round3(%f)]", self.frame.size.width / 12];
    NSArray *vCons_round3 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_round3 options:0 metrics:nil views:@{@"_round3":_round3}];
    NSString *hVFL_round3 = [NSString stringWithFormat:@"H:[_view2]-%f-[_round3(%f)]", self.frame.size.width / 24, self.frame.size.width / 12] ;
    NSArray *hCons_round3 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_round3 options:0 metrics:nil views:@{@"_round3":_round3, @"_view2":_view2}];
    _round3.layer.cornerRadius = self.frame.size.width / 24;
    
    [self addConstraints:vCons_round3];
    [self addConstraints:hCons_round3];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_round3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    NSString *vVFL_round4 = [NSString stringWithFormat:@"V:[_round4(%f)]", self.frame.size.width / 12];
    NSArray *vCons_round4 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_round4 options:0 metrics:nil views:@{@"_round4":_round4}];
    NSString *hVFL_round4 = [NSString stringWithFormat:@"H:[_view3]-%f-[_round4(%f)]", self.frame.size.width / 24, self.frame.size.width / 12] ;
    NSArray *hCons_round4 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_round4 options:0 metrics:nil views:@{@"_round4":_round4, @"_view3":_view3}];
    _round4.layer.cornerRadius = self.frame.size.width / 24;
    
    [self addConstraints:vCons_round4];
    [self addConstraints:hCons_round4];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_round4 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    NSString *vVFL_round5 = [NSString stringWithFormat:@"V:[_round5(%f)]", self.frame.size.width / 12];
    NSArray *vCons_round5 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_round5 options:0 metrics:nil views:@{@"_round5":_round5}];
    NSString *hVFL_round5 = [NSString stringWithFormat:@"H:[_view4]-%f-[_round5(%f)]", self.frame.size.width / 24, self.frame.size.width / 12] ;
    NSArray *hCons_round5 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_round5 options:0 metrics:nil views:@{@"_round5":_round5, @"_view4":_view4}];
    _round5.layer.cornerRadius = self.frame.size.width / 24;
    
    [self addConstraints:vCons_round5];
    [self addConstraints:hCons_round5];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_round5 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    NSString *vVFL_round6 = [NSString stringWithFormat:@"V:[_round6(%f)]", self.frame.size.width / 12];
    NSArray *vCons_round6 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL_round6 options:0 metrics:nil views:@{@"_round6":_round6}];
    NSString *hVFL_round6 = [NSString stringWithFormat:@"H:[_view5]-%f-[_round6(%f)]", self.frame.size.width / 24, self.frame.size.width / 12] ;
    NSArray *hCons_round6 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL_round6 options:0 metrics:nil views:@{@"_round6":_round6, @"_view5":_view5}];
    _round6.layer.cornerRadius = self.frame.size.width / 24;
    
    [self addConstraints:vCons_round6];
    [self addConstraints:hCons_round6];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_round6 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

- (UIView *)createHLine {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor colorWithRGBValue:0xe0e0e0 andAlpha:1];
    
    return view;
}
@end
