//
//  MDPassWord.h
//  MDPassWord
//
//  Created by ccit on 16/9/12.
//  Copyright © 2016年 CCIT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MDKeyBoard;
@class MDTextField;
@interface MDPassWord : UIView

@property (nonatomic, copy)void (^showPassWord)(NSString *password);
@property (nonatomic, strong) MDKeyBoard *keyboardView;
@property (nonatomic, strong) MDTextField *mdTextField;

- (instancetype)initWithTitle:(NSString *)title;

@end
