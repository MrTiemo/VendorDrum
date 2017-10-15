//
//  BackKeyViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/17.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "BackKeyViewController.h"

@interface BackKeyViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *textName;
@property (nonatomic,strong)UITextField *textPass;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UIButton *numBtn;
@property (nonatomic,strong)NSArray* changeArray;
@property (nonatomic,strong)NSMutableString* changeString;
@end

@implementation BackKeyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"找回密码";
    [self getNumTitle];
    //手机号
    _textName = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, DEVICEWIDTH-60, 50)];
    _textName.textColor =BlackColor;
    _textName.delegate = self;
    UIColor *color = [UIColor grayColor];
    _textName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"手机号" attributes:@{NSForegroundColorAttributeName: color}];
    [_textName setValue:[UIFont boldSystemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    _textName.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:_textName];
    //验证码
    _textPass = [[UITextField alloc] initWithFrame:CGRectMake(30, 150, DEVICEWIDTH-90, 50)];
    _textPass.textColor =BlackColor;
    _textPass.delegate=self;
    _textPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"验证码" attributes:@{NSForegroundColorAttributeName: color}];
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
    //登录按钮
    _button = [[UIButton alloc] initWithFrame:CGRectMake(30, 220, DEVICEWIDTH-60, 40)];
    [_button setTitle:@"下一步" forState:UIControlStateNormal];
    _button.backgroundColor = NavaCOLOR;
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button.layer.cornerRadius = 20;
    [_button addTarget:self action:@selector(goNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
   //验证码 button
    _numBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-90, 160, 60, 30)];
    [_numBtn setTitle:[NSString stringWithFormat:@"%@",_changeString] forState:UIControlStateNormal];
    [_numBtn setTitleColor:[UIColor colorWithRed:0.69 green:0.16 blue:0.40 alpha:1.00] forState:UIControlStateNormal];
    [_numBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [_numBtn addTarget:self action:@selector(getNum) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_numBtn];
    //给界面添加一个手势  点击空白区域 移除键盘
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped1:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
}
-(void)getNumTitle{
    //用了大写字母,自己感觉要比小写好点吧，方法比较笨，嘿嘿
    _changeArray = [[NSArray alloc] initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",
                    @"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil];
    NSMutableString *getStr = [[NSMutableString alloc] initWithCapacity:5]; //可变字符串，存取得到的随机数
    _changeString = [[NSMutableString alloc] initWithCapacity:6] ; //可变string，最终想要的验证码
    for(NSInteger i = 0; i < 5; i++) //得到四个随机字符，取四次，可自己设长度
    {
        NSInteger index = arc4random() % ([_changeArray count] - 1);  //得到数组中随机数的下标
        getStr = [_changeArray objectAtIndex:index];  //得到数组中随机数，赋给getStr
        _changeString = (NSMutableString *)[_changeString stringByAppendingString:getStr];
        //把随机字符加到可变string后面，循环四次后取完
    }
}
//下一步按钮点击事件
-(void)goNext{
    
    [self.navigationController pushViewController:[NSClassFromString(@"ChangeKeyViewController")new] animated:YES];
    
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
//验证码切换
-(void)getNum{
    [self getNumTitle];
    [_numBtn setTitle:[NSString stringWithFormat:@"%@",_changeString] forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
