//
//  CouponViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/5.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "CouponViewController.h"
#import "CouponCell.h"
#import "YBAlertView.h"

@interface CouponViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation CouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"优惠券";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStyleDone target:self action:@selector(AddCoupon)];
    
    //初始化tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 5.0;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static  NSString *cellID = @"cell";
    CouponCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[CouponCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageBack.image = [UIImage imageNamed:@"you"];
    cell.labNum.text = @"UY345643";
    cell.labTitle.text = @" 新用户注册专享5元红包\n(满39使用)\n 全场通用";
    cell.labTime.text = @"有效期:2016-12-2 至 2012-12-23";
    cell.imageBiao.image = [UIImage imageNamed:@"guoqi"];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


}
//添加购物券
-(void)AddCoupon{
    YBAlertView *alertView = [[YBAlertView alloc] initWithFrame:CGRectMake(50, kScreenH/2 - 150, kScreenW-100, 100)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, alertView.width, 30)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"请输入优惠券号码";
    titleLabel.font = normalFontStyle;
    [alertView addSubview:titleLabel];
    
    UITextField *passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(titleLabel.frame) + 4, alertView.width-32, 30)];
    passwordTF.tag = 100;
    passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    passwordTF.layer.borderWidth = 1;
    passwordTF.layer.borderColor = [UIColor orangeColor].CGColor;
    passwordTF.placeholder = @"优惠券编号";
    passwordTF.layer.cornerRadius = 5;
    passwordTF.font = normalFontStyle;
    //    passwordTF.secureTextEntry = YES;//密码模式
    [alertView addSubview:passwordTF];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelBtn.frame = CGRectMake(16, CGRectGetMaxY(passwordTF.frame) + 4, passwordTF.width/2, 30);
    [cancelBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [alertView addSubview:cancelBtn];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    confirmBtn.frame = CGRectMake(CGRectGetMaxX(cancelBtn.frame), CGRectGetMaxY(passwordTF.frame) + 4, passwordTF.width/2, 30);
    [confirmBtn addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [alertView addSubview:confirmBtn];
    [alertView show];
}

- (void)cancelClick:(UIButton *)btn
{
    [btn.superview performSelector:@selector(close)];
}


-  (void)confirmClick:(UIButton *)btn
{
    [btn.superview performSelector:@selector(close)];
    UITextField *tf = [btn.superview viewWithTag:100];
    NSLog(@"号码：%@", tf.text);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
