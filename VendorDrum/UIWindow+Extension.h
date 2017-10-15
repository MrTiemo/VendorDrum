//
//  UIWindow+Extension.h
//  NiceAlertSheet
//
//  Created by Jax on 16/6/7.
//  Copyright © 2016年 Jax. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenWidth [UIScreen  mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface UIWindow (Extension)

+ (UIWindow *)lastWindow;

@end
