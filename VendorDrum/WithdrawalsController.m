//
//  WithdrawalsController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "WithdrawalsController.h"
#import "SpecificViewController.h"
#import "ACPayPwdAlert.h"
#import "PayCardViewController.h"
#import "ForgetPayKeyViewController.h"

@interface WithdrawalsController ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *labelN;
@property (nonatomic,strong)UILabel *labelY;
@property (nonatomic,strong)ACPayPwdAlert *pwdAlert;
@property (nonatomic,strong)UIButton *btnTT;
@end

@implementation WithdrawalsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提 现";
    self.view.backgroundColor = [UIColor whiteColor];
    //
    _labelY = [[UILabel alloc] initWithFrame:CGRectMake(30,84, DEVICEWIDTH-60, DEVICEWIDTH/6)];
    _labelY.text = @"        开户人姓名需与卡号用户一致,提现金额会退回到您填写的支付卡上,申请成功后请及时查看您的支付账号";
    _labelY.font = normalFontStyle;
    _labelY.numberOfLines = 0;
    [self.view addSubview:_labelY];
    //输入金额
    _labelN = [[UITextField alloc] initWithFrame:CGRectMake(30, DEVICEWIDTH/3+84, DEVICEWIDTH-60, 40)];
    _labelN.font = normalFontStyle;
    _labelN.placeholder = @"输入您的提现金额";
    _labelN.delegate = self;
    _labelN.keyboardType =  UIKeyboardTypeNumbersAndPunctuation;
    //返回键的类型
    _labelN.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:_labelN];
    //下标的线
    UIView *viewX = [[UITextField alloc] initWithFrame:CGRectMake(0, 39, DEVICEWIDTH-60, 1)];
    viewX.backgroundColor = [UIColor grayColor];
    [_labelN addSubview:viewX];
    //提现按钮
    _btnTT = [[UIButton alloc] initWithFrame:CGRectMake(30, DEVICEWIDTH/3+144, DEVICEWIDTH-60, 40)];
    [_btnTT setTitle:@"提  现" forState:UIControlStateNormal];
    _btnTT.backgroundColor = [UIColor colorWithRed:0.89 green:0.89 blue:0.90 alpha:1.00];
    _btnTT.layer.cornerRadius = 20;
    _btnTT.titleLabel.font = titleFontStyle;
    [_btnTT addTarget:self action:@selector(btnTXX:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnTT];
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
-(void)btnTXX:(UIButton *)button{
    [_labelN resignFirstResponder];
    __block WithdrawalsController *weakSelf = self;
    _pwdAlert = [[ACPayPwdAlert alloc] init];
    _pwdAlert.title = @"请输入支付密码";
    _pwdAlert.completeAction = ^(NSString *pwd){
        NSLog(@"==pwd:%@", pwd);
        PayCardViewController *pay = [[PayCardViewController alloc] init];
        [weakSelf.navigationController pushViewController:pay animated:YES];
    };
    //忘记支付密码
    _pwdAlert.forget = ^(NSString *pwd){
        ForgetPayKeyViewController *forgetpay = [[ForgetPayKeyViewController alloc] init];
        [weakSelf.navigationController pushViewController:forgetpay animated:YES];    };
    [_pwdAlert show];
}
//余额
-(void)btnYE{
    [_labelN resignFirstResponder];
    SpecificViewController *spec = [[SpecificViewController alloc] init];
    [self.navigationController pushViewController:spec animated:YES];
}
#pragma mark -- UITextfield
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    _btnTT.enabled = NO;
    _btnTT.backgroundColor = [UIColor colorWithRed:0.89 green:0.89 blue:0.90 alpha:1.00];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    _btnTT.enabled = YES;
    _btnTT.backgroundColor = NavaCOLOR;
    return YES;
}

@end
