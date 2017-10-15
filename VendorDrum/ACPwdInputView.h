//
//  ACPwdInputView.h
//  ACPayPwdView
//
//  Created by ablett on 16/6/16.
//  Copyright © 2016年 ablett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACPwdInputView : UIView

@property (assign, nonatomic) NSUInteger length;                       ///< 支付密码长度
@property (copy, nonatomic) void (^inputDidCompletion)(NSString *pwd); ///< 输入完成回调

@end
