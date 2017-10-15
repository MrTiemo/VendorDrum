//
//  ChangePassViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/10.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ChangePassViewController.h"
#import "ChangeNextViewController.h"

@interface ChangePassViewController ()
@property (nonatomic,strong)UILabel     *labHuo;
@property (nonatomic,strong)UIButton    *btnHuo;
@property (nonatomic,strong)UIButton    *btnNext;
@property (nonatomic,strong)UITextField *textYan;
@property (nonatomic,strong)NSTimer *timer;

@property (nonatomic)int seconds;


@end

@implementation ChangePassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _labHuo = [[UILabel alloc] initWithFrame:CGRectMake(20, 84, DEVICEWIDTH-40, 66)];
    _labHuo.font = normalFontStyle;
    _labHuo.numberOfLines = 0;
    _labHuo.text = @"点击获取验证码,会向您绑定的手机号183****2152发送验证码，请注意查收！";
    [self.view addSubview:_labHuo];
    
    
    _textYan = [[UITextField alloc] initWithFrame:CGRectMake(20, 150, DEVICEWIDTH-100, 40)];
    _textYan.placeholder = @"验证码";
    _textYan.font = normalFontStyle;
    [self.view addSubview:_textYan];
    
    
    UIView *viewX = [[UIView alloc] initWithFrame:CGRectMake(20, 190, DEVICEWIDTH-40, 1)];
    viewX.backgroundColor = [UIColor colorWithRed:0.81 green:0.81 blue:0.82 alpha:1.00];
    [self.view addSubview:viewX];
    
    _btnHuo = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-80, 160, 60, 20)];
    [_btnHuo setTitle:@"获取验证码" forState:UIControlStateNormal];
    _btnHuo.titleLabel.font = labelFontStyle;
    [_btnHuo addTarget:self action:@selector(getNum) forControlEvents:UIControlEventTouchUpInside];
    [_btnHuo setTitleColor:[UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00] forState:UIControlStateNormal];
    [self.view addSubview:_btnHuo];
    
    //退出登陆
    _btnNext = [[UIButton alloc] initWithFrame:CGRectMake(30, 220, DEVICEWIDTH-60, 40)];
    [_btnNext setTitle:@"下一步" forState:UIControlStateNormal];
    _btnNext.backgroundColor = NavaCOLOR;
    _btnNext.layer.cornerRadius = 20;
    _btnNext.titleLabel.font = titleFontStyle;
    [_btnNext addTarget:self action:@selector(backNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnNext];
    
}
//点击注册
-(void)backNext{
    [SMSSDK commitVerificationCode:_textYan.text phoneNumber:@"13671032152" zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"验证成功");
            [KVNProgress showSuccessWithStatus:@"验证成功"];
            ChangeNextViewController *chan = [[ChangeNextViewController alloc] init];
            [self.navigationController pushViewController:chan animated:YES];
        }
        else
        {
            NSLog(@"错误信息:%@",error);
            [KVNProgress showErrorWithStatus:@"验证码错误"];
//            ChangeNextViewController *chan = [[ChangeNextViewController alloc] init];
//            [self.navigationController pushViewController:chan animated:YES];
            
        }
    }];
}
//获取验证码
-(void)getNum{
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:@"13671032152"
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
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    _seconds = 5;
}
-(void)timerFireMethod:(NSTimer *)theTimer {
    if (_seconds == 0) {
        [theTimer invalidate];
        _seconds = 5;
        [_btnHuo setTitle:@"获取验证码" forState: UIControlStateNormal];
        [_btnHuo setEnabled:YES];
    }else{
        [_btnHuo setEnabled:NO];
        NSString *title = [NSString stringWithFormat:@"%d秒后获取",_seconds];
        [_btnHuo setTitle:title forState:UIControlStateNormal];
        _seconds--;
        
    }
}

@end
