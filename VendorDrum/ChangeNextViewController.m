//
//  ChangeNextViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/10.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ChangeNextViewController.h"

@interface ChangeNextViewController ()
@property (nonatomic,strong)UIButton    *btnSure;
@property (nonatomic,strong)UITextField *textOld;
@property (nonatomic,strong)UITextField *textNew;

@end

@implementation ChangeNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认密码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _textOld  = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, DEVICEWIDTH-40, 40)];
    _textOld.font = normalFontStyle;
    _textOld.placeholder = @" 旧密码";
    [self.view addSubview:_textOld];
    
    UIView *viewY = [[UIView alloc] initWithFrame:CGRectMake(20, 140, DEVICEWIDTH-40, 1)];
    viewY.backgroundColor = [UIColor colorWithRed:0.81 green:0.81 blue:0.82 alpha:1.00];
    [self.view addSubview:viewY];
    
    _textNew = [[UITextField alloc] initWithFrame:CGRectMake(20, 150, DEVICEWIDTH-100, 40)];
    _textNew.placeholder = @" 新密码(大于6位的数字和字母)";
    _textNew.font = normalFontStyle;
    [self.view addSubview:_textNew];
    
    
    UIView *viewX = [[UIView alloc] initWithFrame:CGRectMake(20, 190, DEVICEWIDTH-40, 1)];
    viewX.backgroundColor = [UIColor colorWithRed:0.81 green:0.81 blue:0.82 alpha:1.00];
    [self.view addSubview:viewX];
    
    //退出登陆
    _btnSure = [[UIButton alloc] initWithFrame:CGRectMake(30, 220, DEVICEWIDTH-60, 40)];
    [_btnSure setTitle:@"确定修改" forState:UIControlStateNormal];
    _btnSure.backgroundColor = NavaCOLOR;
    _btnSure.layer.cornerRadius = 20;
    _btnSure.titleLabel.font = titleFontStyle;
    [_btnSure addTarget:self action:@selector(backSure) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnSure];
}
-(void)backSure{

    [self.navigationController popToRootViewControllerAnimated:YES];

}

@end
