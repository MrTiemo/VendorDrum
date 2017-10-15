//
//  MyStoreViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/7.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "MyStoreViewController.h"
#import "TiBaoViewController.h"
#import "AdministrationVC.h"
#import "StoreDingViewController.h"

@interface MyStoreViewController ()


@end

@implementation MyStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    /////////////
    UIButton *btnA = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 100, DEVICEWIDTH/3, DEVICEWIDTH/3)];
    [btnA setTitle:@"店铺管理" forState:UIControlStateNormal];
    btnA.layer.cornerRadius = DEVICEWIDTH/6;
    btnA.backgroundColor = [UIColor colorWithRed:0.22 green:0.51 blue:0.89 alpha:1.00];
    [btnA addTarget:self action:@selector(btnA) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnA];
    
    
    ////////////
    UIButton *btnB = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 150+DEVICEWIDTH/3, DEVICEWIDTH/3, DEVICEWIDTH/3)];
    [btnB setTitle:@"订单管理" forState:UIControlStateNormal];
    btnB.layer.cornerRadius = DEVICEWIDTH/6;
    btnB.backgroundColor = [UIColor colorWithRed:0.89 green:0.21 blue:0.22 alpha:1.00];
    [btnB addTarget:self action:@selector(btnB) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnB];
    
    
    ////////////
    UIButton *btnC = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, DEVICEWIDTH/3*2+200, DEVICEWIDTH/3, DEVICEWIDTH/3)];
    [btnC setTitle:@"商品管理" forState:UIControlStateNormal];
    btnC.layer.cornerRadius = DEVICEWIDTH/6;
    btnC.backgroundColor = [UIColor colorWithRed:0.17 green:0.67 blue:0.25 alpha:1.00];
    [btnC addTarget:self action:@selector(btnC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnC];
}
-(void)btnA{
    AdministrationVC *admin = [[AdministrationVC alloc] init];
    [self.navigationController pushViewController:admin animated:YES];
}
-(void)btnB{
    StoreDingViewController *store = [[StoreDingViewController alloc] init];
    [self.navigationController pushViewController:store animated:YES];
    
}
-(void)btnC{
    TiBaoViewController *tibao = [[TiBaoViewController alloc] init];
    [self.navigationController pushViewController:tibao animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
