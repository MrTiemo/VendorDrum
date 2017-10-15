//
//  UIWindow+Extension.m
//  NiceAlertSheet
//
//  Created by Jax on 16/6/7.
//  Copyright © 2016年 Jax. All rights reserved.
//

#import "UIWindow+Extension.h"

@implementation UIWindow (Extension)

+ (UIWindow *)lastWindow {
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] &&
            window.windowLevel == UIWindowLevelNormal &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds))
            return window;
    }
    
    return [UIApplication sharedApplication].keyWindow;
}

@end
