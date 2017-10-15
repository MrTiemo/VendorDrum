//
//  BalanceViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/5.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "BalanceViewController.h"
#import "WithdrawalsController.h"
#import "SpecificViewController.h"

@interface BalanceViewController ()
@end

@implementation BalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的余额";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //金钱图标
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 84, DEVICEWIDTH/3, DEVICEWIDTH/3)];
    imageV.image = [UIImage imageNamed:@"mon1"];
    imageV.layer.cornerRadius = DEVICEWIDTH/6;
    [self.view addSubview:imageV];
    //当前余额
    UILabel *labelY = [[UILabel alloc] initWithFrame:CGRectMake(0, DEVICEWIDTH/3+114, DEVICEWIDTH/2, 20)];
    labelY.text = @"当前余额 ";
    labelY.font = normalFontStyle;
    labelY.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:labelY];
    //金额数量
    UILabel *labelN = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2, DEVICEWIDTH/3+114, DEVICEWIDTH/2, 20)];
    labelN.text = @"¥1200.00";
    labelN.textColor = NavaCOLOR;
    labelN.font = normalFontStyle;
    labelN.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:labelN];
    //提现按钮
    UIButton *btnT = [[UIButton alloc] initWithFrame:CGRectMake(30, DEVICEWIDTH/3+144, DEVICEWIDTH-60, 40)];
    [btnT setTitle:@"提  现" forState:UIControlStateNormal];
    btnT.backgroundColor = NavaCOLOR;
    btnT.layer.cornerRadius = 20;
    btnT.titleLabel.font = titleFontStyle;
    [btnT addTarget:self action:@selector(btnTX) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnT];
    //余额明细
    UIButton *btnY = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, DEVICEWIDTH/3+190, DEVICEWIDTH/3, 30)];
    [btnY setTitle:@"余额明细" forState:UIControlStateNormal];
    btnY.titleLabel.font = normalFontStyle;
    [btnY setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnY addTarget:self action:@selector(btnYE) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnY];
    //温馨提示
    UILabel *labelT = [[UILabel alloc] initWithFrame:CGRectMake(30,DEVICEWIDTH/3+230, DEVICEWIDTH-60, DEVICEWIDTH/3)];
    labelT.text = @"温馨提示：\n    若当前有提现正在进行，则该笔提现金额暂被冻结，且无法继续申请该提现；该笔提现完成后可以继续申请提现";
    labelT.numberOfLines = 0;
    labelT.font = labelFontStyle;
    [self.view addSubview:labelT];
    
    //客服
    UILabel *labelNum = [[UILabel alloc] initWithFrame:CGRectMake(0,DEVICEHIGHT-60, DEVICEWIDTH, 20)];
    labelNum.font = labelFontStyle;
    labelNum.text = @"如有疑问，请拨打客服电话：400-6666-520";
    labelNum.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labelNum];
    
}
//提现
-(void)btnTX{
    WithdrawalsController *Withd = [[WithdrawalsController alloc] init];
    [self.navigationController pushViewController:Withd animated:YES];
}
//余额
-(void)btnYE{
    SpecificViewController *spec = [[SpecificViewController alloc] init];
    [self.navigationController pushViewController:spec animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
