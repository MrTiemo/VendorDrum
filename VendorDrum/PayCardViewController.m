//
//  WithdrawalsController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "PayCardViewController.h"
#import "SpecificViewController.h"

@interface PayCardViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
@property (nonatomic,strong)UITextField *labelN;
@property (nonatomic,strong)UITextField *labelName;
@property (nonatomic,strong)UILabel *labelY;
@property (nonatomic,strong)UIButton *btnT;

@end

@implementation PayCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提 现";
    self.view.backgroundColor = [UIColor whiteColor];
    //
    _labelY = [[UILabel alloc] initWithFrame:CGRectMake(30,84, DEVICEWIDTH-60, DEVICEWIDTH/6)];
    _labelY.text = @"        开户人姓名需与卡号用户一致,提现金额会退回到您填写的支付卡上,申请成功后请及时查看您的支付账号";
    _labelY.font = labelFontStyle;
    _labelY.numberOfLines = 0;
    [self.view addSubview:_labelY];
    
    //输入姓名
    _labelName = [[UITextField alloc] initWithFrame:CGRectMake(30, DEVICEWIDTH/3+44, DEVICEWIDTH-60, 40)];
    _labelName.font = normalFontStyle;
    _labelName.placeholder = @"开户姓名";
    _labelName.delegate = self;
    //返回键的类型
    _labelName.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_labelName];
    
    //下标的线
    UIView *viewy = [[UITextField alloc] initWithFrame:CGRectMake(0, 39, DEVICEWIDTH-60, 1)];
    viewy.backgroundColor = [UIColor grayColor];
    [_labelName addSubview:viewy];
    
    //输入卡号
    _labelN = [[UITextField alloc] initWithFrame:CGRectMake(30, DEVICEWIDTH/3+84, DEVICEWIDTH-60, 40)];
    _labelN.font = normalFontStyle;
    _labelN.placeholder = @"输入您的支付宝或银行卡号";
    _labelN.delegate = self;
    //返回键的类型
    _labelN.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_labelN];
    //下标的线
    UIView *viewX = [[UITextField alloc] initWithFrame:CGRectMake(0, 39, DEVICEWIDTH-60, 1)];
    viewX.backgroundColor = [UIColor grayColor];
    [_labelN addSubview:viewX];
    //提现按钮
    _btnT = [[UIButton alloc] initWithFrame:CGRectMake(30, DEVICEWIDTH/3+144, DEVICEWIDTH-60, 40)];
    [_btnT setTitle:@"提  现" forState:UIControlStateNormal];
    _btnT.backgroundColor = NavaCOLOR;
    _btnT.layer.cornerRadius = 20;
    _btnT.titleLabel.font = titleFontStyle;
    [_btnT addTarget:self action:@selector(btnTX:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnT];
    //余额明细
    UIButton *btnY = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, DEVICEWIDTH/3+190, DEVICEWIDTH/3, 30)];
    [btnY setTitle:@"余额明细" forState:UIControlStateNormal];
    btnY.titleLabel.font = normalFontStyle;
    [btnY setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btnY addTarget:self action:@selector(btnYE) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnY];
    //温馨提示
    UILabel *labelT = [[UILabel alloc] initWithFrame:CGRectMake(30,DEVICEWIDTH/3+230, DEVICEWIDTH-60, DEVICEWIDTH/3)];
    labelT.text = @"温馨提示：\n        提现成功后，货郎鼓处理时限为3-5个工作日，银行处理时间为2-3个工作日";
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
-(void)btnTX:(UIButton *)button{
    if ([button.titleLabel.text  isEqual: @"提  现"]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请确认您的帐号为:"  message:[NSString stringWithFormat:@"%@\n%@",_labelName.text,_labelN.text]  delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"重新填写", nil];
        alert.delegate = self;
        [alert show];
    }else{
        _tabBarController = [[MainTabbar alloc]init];
        APP_DELEGATE.window.rootViewController = _tabBarController;
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==0) {
        _labelY.text = @"        提现申请成功，请耐心等待工作人员的审核";
        [_labelN removeFromSuperview];
        [_labelName removeFromSuperview];
        [_btnT setTitle:@"去逛逛" forState:UIControlStateNormal];
        _btnT.backgroundColor = [UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00];
    }
}
//余额
-(void)btnYE{
    SpecificViewController *spec = [[SpecificViewController alloc] init];
    [self.navigationController pushViewController:spec animated:YES];
}
#pragma mark -- UITextfield
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
