//
//  LoginViewController.m
//  ASJDemo
//
//  Created by 爱尚家 on 16/6/23.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UIImageView *imageview;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UIButton *zhucheBtn;
@property (nonatomic,strong)UIButton *eyeBtn;
@property (nonatomic,strong)UITextField *textName;
@property (nonatomic,strong)UITextField *textPass;
@property (nonatomic)BOOL keyEye;
@end
@implementation LoginViewController
@synthesize DeleGate =_dele;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.view.backgroundColor = [UIColor whiteColor];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"baa"]];
    //模糊效果
    UIBlurEffect *light = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *lightView = [[UIVisualEffectView alloc]initWithEffect:light];
    lightView.frame = self.view.bounds;
    lightView.alpha = 0.2;
    [self.view addSubview:lightView];
    //用户名
    _textName = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, DEVICEWIDTH-90, 50)];
    _textName.textColor =BlackColor;
    _textName.delegate = self;
    _textName.textAlignment = NSTextAlignmentCenter;
    //左边的图片
    UIImageView *accIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    accIcon.image = [UIImage imageNamed:@"user"];
    UIView  *account = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [account addSubview:accIcon];
    _textName.leftView = account;
    _textName.leftViewMode = UITextFieldViewModeAlways;
    UIColor *color = [UIColor grayColor];
    _textName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"手机号" attributes:@{NSForegroundColorAttributeName: color}];
    [_textName setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    _textName.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_textName];
    //密码
    _textPass = [[UITextField alloc] initWithFrame:CGRectMake(30, 150, DEVICEWIDTH-90, 50)];
    _textPass.textColor =BlackColor;
    _textPass.delegate=self;
    _textPass.secureTextEntry = YES;
    _textPass.textAlignment = NSTextAlignmentCenter;
    //左边的图片
    UIImageView *accpass = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    accpass.image = [UIImage imageNamed:@"pass"];
    UIView  *accoun = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [accoun addSubview:accpass];
    _textPass.leftView = accoun;
    _textPass.leftViewMode = UITextFieldViewModeAlways;
    _textPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName: color}];
    [_textPass setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:_textPass];
    //是否显示密码的按钮
    _eyeBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-70, 170, 40, 20)];
    [_eyeBtn setBackgroundImage:[UIImage imageNamed:@"bukejian"] forState:UIControlStateNormal];
    [_eyeBtn addTarget:self action:@selector(eyeBtnDid) forControlEvents:UIControlEventTouchUpInside];
    _keyEye = YES;
    [self.view addSubview:_eyeBtn];
    //线
    UIImageView *accImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 149, DEVICEWIDTH-60, 1)];
    accImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:accImage];
    //线
    UIImageView *passImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 199, DEVICEWIDTH-60, 1)];
    passImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:passImage];
    //线
    UIImageView *shuImage = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICEWIDTH-60)/2+29, 280, 1, 30)];
    shuImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:shuImage];
    //登录按钮
    _button = [[UIButton alloc] initWithFrame:CGRectMake(30, 220, DEVICEWIDTH-60, 40)];
    [_button setTitle:@"登 录" forState:UIControlStateNormal];
    _button.backgroundColor = NavaCOLOR;
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button.layer.cornerRadius = 20;
    [_button addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    //没有帐号？
    _zhucheBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 280, (DEVICEWIDTH-60)/2, 30)];
    [_zhucheBtn setTitle:@"立即注册" forState:UIControlStateNormal];
    _zhucheBtn.titleLabel.font = normalFontStyle;
    [_zhucheBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_zhucheBtn addTarget:self action:@selector(zhuche) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_zhucheBtn];
    //忘记密码？
    UIButton *forgetPass = [[UIButton alloc] initWithFrame:CGRectMake((DEVICEWIDTH-60)/2+30, 280, (DEVICEWIDTH-60)/2, 30)];
    [forgetPass setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetPass setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    forgetPass.titleLabel.font = normalFontStyle;
    [forgetPass addTarget:self action:@selector(forget) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPass];
    //给界面添加一个手势  点击空白区域 移除键盘
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped1:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
}
//登录按钮点击事件
-(void)login{
//    _tabBarController = [[MainTabbar alloc]init];
//    APP_DELEGATE.window.rootViewController = _tabBarController;
    [self.DeleGate backLoginDel:@"1"];
    [self.navigationController popViewControllerAnimated:YES];
}
//注册按钮点击事件
-(void)zhuche{
    RegisterViewController *reg = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:reg animated:YES];
}
//忘记密码点击事件
-(void)forget{
    
    [self.navigationController pushViewController:[NSClassFromString(@"BackKeyViewController")new] animated:YES];
}
//点击输入框的时候整个视图上移，防止键盘遮挡输入框
-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    self.view.transform = CGAffineTransformMakeTranslation(0, -100);
}
//点击空白区域，隐藏键盘
-(void)viewTapped1:(UITapGestureRecognizer*)tap1
{
    [_textName resignFirstResponder];
    [_textPass resignFirstResponder];
//    self.view.transform = CGAffineTransformMakeTranslation(0, 0);
}
//是否隐藏密码
-(void)eyeBtnDid{
    if (_keyEye) {
        [_eyeBtn setBackgroundImage:[UIImage imageNamed:@"jian"] forState:UIControlStateNormal];
        _keyEye = NO;
        _textPass.secureTextEntry = NO;
    }else{
        [_eyeBtn setBackgroundImage:[UIImage imageNamed:@"bukejian"] forState:UIControlStateNormal];
        _keyEye = YES;
        _textPass.secureTextEntry = YES;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
