//
//  CancelDingViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/12.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "CancelDingViewController.h"
#import "CancelDingCell.h"
#import "YBAlertView.h"



@interface CancelDingViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation CancelDingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIView *viewFoot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 60)];
    viewFoot.backgroundColor = [UIColor whiteColor];
    _tableView.tableFooterView = viewFoot;
    
    UIButton *btnLeft = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, DEVICEWIDTH/2-20, 40)];
    btnLeft.backgroundColor = [UIColor colorWithRed:0.89 green:0.21 blue:0.22 alpha:1.00];
    [btnLeft setTitle:@"拒 绝" forState:UIControlStateNormal];
    [viewFoot addSubview:btnLeft];
    
    //中间的那个线
    UIView *baView = [[UIView alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2, 10, 0.5, 40)];
    baView.backgroundColor = [UIColor grayColor];
    [viewFoot addSubview:baView];
    
    UIButton *btnRight = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2+10, 10, DEVICEWIDTH/2-20, 40)];
    btnRight.backgroundColor = [UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00];
    [btnRight setTitle:@"同 意" forState:UIControlStateNormal];
        [btnRight addTarget:self action:@selector(SURETongyi) forControlEvents:UIControlEventTouchUpInside];
    [viewFoot addSubview:btnRight];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 5;
    }else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 1:
                return 10;
                break;
            case 3:
                return 30;
                break;
            case 4:
                return 50;
                break;
            default:
                return 80;
                break;
        }
    }else{
        return 80;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section==2) {
        return 0.01;
    }else{
        return 10;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    CancelDingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[CancelDingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0:
                cell.backgroundColor = [UIColor colorWithRed:0.42 green:0.42 blue:0.42 alpha:1.00];
                cell.labBianHao.text = @"订单编号：123847495734773";
                cell.labZFB.text = @"支付方式：支付宝";
                cell.labTime.text = @"创建时间：2016-09-16 07:46:01";
                cell.labZhuang.text = @"退款中";
                break;
            case 2:
                cell.imageV.image = [UIImage imageNamed:@"sg"];
                cell.labTitle.text = @"商品名称";
                cell.labPrice.text = @"¥18.00";
                cell.labNumber.text = @"x3";
                break;
            case 3:
                cell.labAllNum.text = @"共计2件商品";
                cell.labAllPirce.text = @"总价:¥36.00(邮费到付)";
                break;
            case 4:
                cell.labYouHui.text = @"优惠:¥3.00";
                cell.labShifu.text = @"实付:¥33.00";
                break;
            default:
                break;
        }
    }else if (indexPath.section==1){
        cell.labUser.text = @"收货人姓名：呵呵哒   13671032152";
        cell.labAddress.text = @"收货地址：山东省泰安市宁阳县迪联物流";
        cell.labBeiZhu.text = @"备注：我勒个槽，什么鬼";
    }else{
        cell.labQXFS.text = @"取消方式：取消订单";
        cell.labReason.text = @"取消原因：我不想买了";
        cell.labTuiPrice.text = @"退还金额：¥33.00";
    }
    return cell;
    
}
-(void)SURETongyi{
    [self clickFaHuoA];
}
-(void)clickFaHuoA{
    
    YBAlertView *alertView = [[YBAlertView alloc] initWithFrame:CGRectMake(50, DEVICEHIGHT/2 -100, DEVICEWIDTH-100, 150)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, alertView.width, 30)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"审核备注：";
    titleLabel.font = normalFontStyle;
    [alertView addSubview:titleLabel];
    
    UITextField *passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(titleLabel.frame) + 4, alertView.width-32, 60)];
    passwordTF.tag = 100;
    passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    passwordTF.layer.borderWidth = 1;
    passwordTF.layer.borderColor = [UIColor grayColor].CGColor;
    passwordTF.text = @"审核通过!";
    passwordTF.layer.cornerRadius = 5;
    passwordTF.font = normalFontStyle;
    passwordTF.delegate = self;
    passwordTF.returnKeyType = UIReturnKeyDone;
    [alertView addSubview:passwordTF];
    
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelBtn.frame = CGRectMake(16, CGRectGetMaxY(passwordTF.frame) + 10, passwordTF.width/2-10, 30);
    [cancelBtn addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitle:@"同意" forState:UIControlStateNormal];
    cancelBtn.backgroundColor = [UIColor colorWithRed:0.98 green:0.47 blue:0.13 alpha:1.00];
    cancelBtn.layer.borderWidth = 1;
    cancelBtn.layer.borderColor = [UIColor grayColor].CGColor;
    cancelBtn.layer.cornerRadius = 5;
    [alertView addSubview:cancelBtn];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    confirmBtn.frame = CGRectMake(CGRectGetMaxX(cancelBtn.frame)+10, CGRectGetMaxY(passwordTF.frame) + 10, passwordTF.width/2, 30);
    [confirmBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    [confirmBtn setTitle:@"取消" forState:UIControlStateNormal];
    confirmBtn.layer.borderWidth = 1;
    confirmBtn.layer.borderColor = [UIColor grayColor].CGColor;
    confirmBtn.layer.cornerRadius = 5;
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
    NSLog(@"审批备注：%@", tf.text);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
