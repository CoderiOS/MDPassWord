//
//  MDKeyBoard.h
//  MDPassWord
//
//  Created by ccit on 16/9/26.
//  Copyright © 2016年 CCIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MDKeyBoardDelegate <NSObject>

- (void)getTheKeyboardNum:(UIButton *)btn;

@end
@interface MDKeyBoard : UIView


@property (nonatomic, weak) id<MDKeyBoardDelegate> delegate;

+ (id)keyboardView;

@end
