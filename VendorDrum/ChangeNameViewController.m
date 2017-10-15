//
//  ChangeNameViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/10.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ChangeNameViewController.h"

@interface ChangeNameViewController ()
@property (nonatomic,strong)UILabel     *labOne;
@property (nonatomic,strong)UIButton    *btnSure;
@property (nonatomic,strong)UITextField *textName;

@end

@implementation ChangeNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户名";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _textName = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, DEVICEWIDTH-100, 40)];
    _textName.placeholder = @"用户名(5~24个字符之间)";
    _textName.font = normalFontStyle;
    [self.view addSubview:_textName];
    
    UIView *viewX = [[UIView alloc] initWithFrame:CGRectMake(20, 120, DEVICEWIDTH-40, 1)];
    viewX.backgroundColor = [UIColor colorWithRed:0.81 green:0.81 blue:0.82 alpha:1.00];
    [self.view addSubview:viewX];
    
    _labOne = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, DEVICEWIDTH, 20)];
    _labOne.font = labelFontStyle;
    _labOne.numberOfLines = 0;
    _labOne.textAlignment = NSTextAlignmentCenter;
    _labOne.textColor = NavaCOLOR;
    _labOne.text = @"注意！用户名只能修改一次";
    [self.view addSubview:_labOne];
    
    //退出登陆
    _btnSure = [[UIButton alloc] initWithFrame:CGRectMake(30, 180, DEVICEWIDTH-60, 40)];
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
