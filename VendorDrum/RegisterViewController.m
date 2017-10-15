//
//  RegisterViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/13.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "RegisterViewController.h"
#import "KVNProgress.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *textPhone;
@property (nonatomic,strong)UITextField *textNum;
@property (nonatomic,strong)UITextField *textPass;
@property (nonatomic,strong)UITextField *textZhifu;
@property (nonatomic,strong)UIButton *numBtn;
@property (nonatomic,strong)UIButton *sureBtn;
@property (nonatomic,strong)NSTimer *timer;
@end



@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"baa"]];
    self.view.backgroundColor = [UIColor whiteColor];

    //手机号
    _textPhone = [[UITextField alloc] initWithFrame:CGRectMake(30, 70, DEVICEWIDTH-60, 50)];
    _textPhone.backgroundColor = [UIColor clearColor];
    _textPhone.delegate = self;
    UIColor *color = [UIColor grayColor];
    _textPhone.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"手机号" attributes:@{NSForegroundColorAttributeName: color}];
    [_textPhone setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    _textPhone.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_textPhone];
    //验证码
    _textNum = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, DEVICEWIDTH-60, 50)];
    _textNum.backgroundColor = [UIColor clearColor];
    _textNum.delegate=self;
    _textNum.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"短信验证码" attributes:@{NSForegroundColorAttributeName: color}];
    [_textNum setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    _textNum.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_textNum];
    //密码
    _textPass = [[UITextField alloc] initWithFrame:CGRectMake(30, 170, DEVICEWIDTH-60, 50)];
    _textPass.backgroundColor = [UIColor clearColor];
    _textPass.delegate=self;
    _textPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码(大于6位的数字或字母)" attributes:@{NSForegroundColorAttributeName: color}];
    [_textPass setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
//    _textPass.keyboardType =  UIKeyboardTypeNamePhonePad;
    _textPass.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:_textPass];
    //支付密码
    _textZhifu = [[UITextField alloc] initWithFrame:CGRectMake(30, 220, DEVICEWIDTH-60, 50)];
    _textZhifu.backgroundColor = [UIColor clearColor];
    _textZhifu.delegate=self;
    _textZhifu.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"支付密码(6位数字)" attributes:@{NSForegroundColorAttributeName: color}];
    [_textZhifu setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    _textZhifu.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_textZhifu];
    //线
    UIImageView *accImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 119, DEVICEWIDTH-60, 1)];
    accImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:accImage];
    //线
    UIImageView *numImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 169, DEVICEWIDTH-60, 1)];
    numImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:numImage];
    //线
    UIImageView *passImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 219, DEVICEWIDTH-60, 1)];
    passImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:passImage];
    //线
    UIImageView *zhifuImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 269, DEVICEWIDTH-60, 1)];
    zhifuImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:zhifuImage];
    //确定按钮
    _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 280, DEVICEWIDTH-60, 40)];
    [_sureBtn setTitle:@"注册" forState:UIControlStateNormal];
    _sureBtn.backgroundColor = NavaCOLOR;
    [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _sureBtn.layer.cornerRadius = 5;
    [_sureBtn addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sureBtn];
    //获取验证码按钮
    _numBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-100,130,70, 30)];
    [_numBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    _numBtn.backgroundColor = NavaCOLOR;
    _numBtn.titleLabel.font = labelFontStyle;
    [_numBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _numBtn.layer.cornerRadius = 5;
    [_numBtn addTarget:self action:@selector(NUM) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_numBtn];


    //给界面添加一个手势  点击空白区域 移除键盘
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped2:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    // See the documentation of all appearance propoerties
//    [KVNProgress appearance].statusColor = [UIColor whiteColor];
    [KVNProgress appearance].statusFont = normalFontStyle;
//    [KVNProgress appearance].circleStrokeForegroundColor = [UIColor whiteColor];
//    [KVNProgress appearance].circleStrokeBackgroundColor = [UIColor colorWithWhite:1.0f alpha:0.3f];
//    [KVNProgress appearance].circleFillBackgroundColor = [UIColor colorWithWhite:1.0f alpha:0.1f];
//    [KVNProgress appearance].backgroundFillColor = [UIColor colorWithRed:0.173f green:0.263f blue:0.856f alpha:0.9f];
//    [KVNProgress appearance].backgroundTintColor = [UIColor colorWithRed:0.173f green:0.263f blue:0.856f alpha:1.0f];
    [KVNProgress appearance].successColor = [UIColor greenColor];
    [KVNProgress appearance].errorColor = [UIColor redColor];
//    [KVNProgress appearance].circleSize = 110.0f;
    [KVNProgress appearance].lineWidth = 3.0f;
}
//点击注册
-(void)sure{
    [SMSSDK commitVerificationCode:_textNum.text phoneNumber:_textPhone.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"验证成功");
            [KVNProgress showSuccessWithStatus:@"注册成功"];
        }
        else
        {
            NSLog(@"错误信息:%@",error);
            [KVNProgress showErrorWithStatus:@"注册失败"];
            
        }
    }];
}
//获取验证码
-(void)NUM{
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_textPhone.text
                                   zone:@"86"
                       customIdentifier:nil
                                 result:^(NSError *error){
                                     if (!error) {
                                         NSLog(@"获取验证码成功");
                                         [KVNProgress showSuccessWithStatus:@"获取成功"];
                                     } else {
                                         NSLog(@"错误信息：%@",error);
                                         [KVNProgress showErrorWithStatus:@"获取失败"];
                                     }
                                 }
     ];
}
//点击空白区域，隐藏键盘
-(void)viewTapped2:(UITapGestureRecognizer*)tap1
{
    [_textPhone resignFirstResponder];
    [_textNum resignFirstResponder];
    [_textPass resignFirstResponder];
    [_textZhifu resignFirstResponder];
//    self.view.transform = CGAffineTransformMakeTranslation(0, 0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
