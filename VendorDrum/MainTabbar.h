//
//  MainViewController.h
//  CollectionDemo
//
//  Created by 爱尚家 on 16/6/9.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainNavigation.h"

@interface MainTabbar : UITabBarController<UITabBarControllerDelegate>

@property (strong, nonatomic) MainNavigation *firstNavigation;
@property (strong, nonatomic) MainNavigation *shopNavigation;
@property (strong, nonatomic) MainNavigation *myNavigation;
@property (strong, nonatomic) MainNavigation *orderNavigation;


@end
