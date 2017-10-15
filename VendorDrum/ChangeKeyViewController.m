//
//  BackKeyViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/17.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ChangeKeyViewController.h"

@interface ChangeKeyViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *textName;
@property (nonatomic,strong)UITextField *textPass;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UIButton *TimerBtn;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic)int seconds;


@end

@implementation ChangeKeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"找回密码";
    //初始化计时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    //短信验证码
    _textName = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, DEVICEWIDTH-120, 50)];
    _textName.textColor =BlackColor;
    _textName.delegate = self;
    UIColor *color = [UIColor grayColor];
    _textName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"短信验证码" attributes:@{NSForegroundColorAttributeName: color}];
    [_textName setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    _textName.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_textName];
    //密码
    _textPass = [[UITextField alloc] initWithFrame:CGRectMake(30, 150, DEVICEWIDTH-90, 50)];
    _textPass.textColor =BlackColor;
    _textPass.delegate=self;
    _textPass.secureTextEntry = YES;
    _textPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码(大于6位的数字或字母)" attributes:@{NSForegroundColorAttributeName: color}];
    [_textPass setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_textPass];
    //线
    UIImageView *accImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 149, DEVICEWIDTH-60, 1)];
    accImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:accImage];
    //线
    UIImageView *passImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 199, DEVICEWIDTH-60, 1)];
    passImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:passImage];
    //倒计时和获取按钮
    _TimerBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-90, 110, 60, 30)];
    _TimerBtn.backgroundColor = NavaCOLOR;
    [_TimerBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_TimerBtn setTitleColor:BlackColor forState:UIControlStateNormal];
    _TimerBtn.titleLabel.font = labelFontStyle;
    [_TimerBtn addTarget:self action:@selector(goYanz) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_TimerBtn];
    //登录按钮
    _button = [[UIButton alloc] initWithFrame:CGRectMake(30, 220, DEVICEWIDTH-60, 40)];
    [_button setTitle:@"提 交" forState:UIControlStateNormal];
    _button.backgroundColor = NavaCOLOR;
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button.layer.cornerRadius = 20;
    [_button addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    //给界面添加一个手势  点击空白区域 移除键盘
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped1:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    _seconds = 5;
}
-(void)timerFireMethod:(NSTimer *)theTimer {
    if (_seconds == 0) {
        [theTimer invalidate];
        _seconds = 5;
        [_TimerBtn setTitle:@"获取验证码" forState: UIControlStateNormal];
        [_TimerBtn setEnabled:YES];
    }else{
        [_TimerBtn setEnabled:NO];
        NSString *title = [NSString stringWithFormat:@"%d秒后获取",_seconds];
        [_TimerBtn setTitle:title forState:UIControlStateNormal];
        [_TimerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _seconds--;
       
    }
}
//提交按钮点击事件
-(void)goNext{
    
    NSArray * ctrlArray = self.navigationController.viewControllers;
    [self.navigationController popToViewController:[ctrlArray objectAtIndex:1] animated:YES];
}
//点击输入框的时候整个视图上移，防止键盘遮挡输入框
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
//点击空白区域，隐藏键盘
-(void)viewTapped1:(UITapGestureRecognizer*)tap1
{
    [_textName resignFirstResponder];
    [_textPass resignFirstResponder];
}
-(void)goYanz{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    _seconds = 5;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
