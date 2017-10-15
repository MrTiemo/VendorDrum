//
//  MainNavationcontroller.m
//  CollectionDemo
//
//  Created by 爱尚家 on 16/6/9.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "MainNavigation.h"

@implementation MainNavigation

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = NavaCOLOR;
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(20, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

}
- (BOOL)shouldAutorotate
{
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
