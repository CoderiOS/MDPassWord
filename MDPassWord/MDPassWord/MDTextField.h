//
//  MDTextField.h
//  MDPassWord
//
//  Created by ccit on 16/9/26.
//  Copyright © 2016年 CCIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDKeyBoard.h"

@interface MDTextField : UITextField <MDKeyBoardDelegate>

@property (nonatomic, copy)NSString *textContent;

@end
