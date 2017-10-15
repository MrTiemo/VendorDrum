//
//  LoginViewController.h
//  ASJDemo
//
//  Created by 爱尚家 on 16/6/23.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainNavigation.h"
#import "MainTabbar.h"
#define APP_DELEGATE    [UIApplication sharedApplication].delegate


@protocol loginDelegate <NSObject>

-(void)backLoginDel:(NSString *)str;

@end

@interface LoginViewController : UIViewController
@property (strong, nonatomic) MainTabbar *tabBarController;
@property (strong, nonatomic) id<loginDelegate>DeleGate;
@end
