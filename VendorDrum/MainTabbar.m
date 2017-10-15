//
//  MainViewController.m
//  CollectionDemo
//
//  Created by 爱尚家 on 16/6/9.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "MainTabbar.h"
#import "MainViewController.h"
#import "OrderViewController.h"
#import "MYViewController.h"
#import "ShoppingCartViewController.h"
@implementation MainTabbar
- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化界面
    MainViewController *first = [[MainViewController alloc] init];
    ShoppingCartViewController *shop = [[ShoppingCartViewController alloc] init];
    MYViewController *my = [[MYViewController alloc] init];
    OrderViewController *order = [[OrderViewController alloc] init];
    //设置根视图
    _firstNavigation = [[MainNavigation alloc] initWithRootViewController:first];
    _shopNavigation = [[MainNavigation alloc] initWithRootViewController:shop];
    _myNavigation = [[MainNavigation alloc] initWithRootViewController:my];
    _orderNavigation = [[MainNavigation alloc] initWithRootViewController:order];
    //初始化图片
    UIImage *first1   = [UIImage imageNamed:@"tab_home_page_nomal"];
    UIImage *shop1  = [UIImage imageNamed:@"tab_shopping_cart_nomal"];
    UIImage *order1  = [UIImage imageNamed:@"tab_product_list_nomal"];
    UIImage *wo1 = [UIImage imageNamed:@"tab_my_cloud_nomal"];
    //选中以后的图片
    UIImage *first2   = [UIImage imageNamed:@"tab_home_page_pressed"];
    UIImage *shop2 = [UIImage imageNamed:@"tab_shopping_cart_pressed"];
    UIImage *order2  = [UIImage imageNamed:@"tab_product_list_pressed"];
    UIImage *wo2 = [UIImage imageNamed:@"tab_my_cloud_pressed"];
    
    _firstNavigation.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:first1 selectedImage:first2];
    _shopNavigation.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"购物车" image:shop1 selectedImage:shop2];
    _orderNavigation.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"订单" image:order1 selectedImage:order2];
    _myNavigation.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:wo1 selectedImage:wo2];
    NSArray *rootControllerArray = @[_firstNavigation, _shopNavigation, _orderNavigation,_myNavigation];
    [self.tabBar setTintColor:NavaCOLOR];
    [self setViewControllers:rootControllerArray];
    self.delegate = self;
}
- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    viewController.view.backgroundColor = [UIColor blackColor];
}

-(void)cloneAccount:(NSNotification*)notification
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
