//
//  PayViewController.m
//  ASJDemo
//
//  Created by 爱尚家 on 16/6/23.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "PayViewController.h"
#import "DingDanViewController.h"
#import "GetAddressViewController.h"
#import "NiceAlertSheet.h"
#import "PayCell.h"
#import "CouponViewController.h"

@interface PayViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,GetaddDelegate>
{
    
    BOOL setBool; ///<判断按钮是否选择
    
}
@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)UIView *OrderView;
@property (nonatomic, strong)NSMutableDictionary *ListArray;//保存用户信息的字典
@property (nonatomic, strong)NSMutableArray *ArrPay;
@property (nonatomic, strong)NSMutableArray *ArrGo;
@property (nonatomic, strong)NSMutableArray *ArrTime;
@property (nonatomic, strong)NSString *StrPay;
@property (nonatomic, strong)NSString *StrGo;
@property (nonatomic, strong)NSString *StrTime;   ///<时间
@property (nonatomic, strong)NSString *StrYouhui; ///<优惠
@property (nonatomic, strong)NSString *StrBeizhu; ///<备注
@property (nonatomic, strong)NSString *StrZhifu;  ///<支付宝还是微信
@property (nonatomic, strong)UILabel  *allNum;    ///<总共几件
@property (nonatomic, strong)UILabel  *AllPrice;  ///<总价格
@property (nonatomic, strong)UIButton *goPay;     ///<提交订单


@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
    self.view.backgroundColor = [UIColor whiteColor];
    setBool = YES;
    NSLog(@"%@",_arrShop);
    //初始化tableview
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    //    _tableview.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableview];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,80)];
    _tableview.tableFooterView = v;
    int num = 0;
    for (NSMutableDictionary *dic in _arrShop) {
        int x = [[dic objectForKey:@"goodsNum"] intValue];
        num = num+x;
    }
    //底部的提交订单按钮和显示金额和数量的view
    _OrderView = [[UIView alloc] initWithFrame:CGRectMake(0, DEVICEHIGHT-50, DEVICEWIDTH, 50)];
    _OrderView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    _allNum = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH/2, 50)];
    _allNum.text = [NSString stringWithFormat:@"合计： "];
    _allNum.font = normalFontStyle;
    _allNum.textAlignment = NSTextAlignmentRight;
    _AllPrice = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2, 0, DEVICEWIDTH/4, 50)];
    _AllPrice.text = [NSString stringWithFormat:@"%@",_Aprice];
    NSLog(@"%@",_Aprice);
    _AllPrice.font = normalFontStyle;
    _AllPrice.textColor = [UIColor redColor];
    _goPay = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4*3, 0, DEVICEWIDTH/4, 50)];
    [_goPay setTitle:@"订单结算" forState:UIControlStateNormal];
    [_goPay setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _goPay.backgroundColor = [UIColor colorWithRed:0.94 green:0.13 blue:0.43 alpha:1.00];
    [_goPay addTarget:self action:@selector(gozhifu) forControlEvents:UIControlEventTouchUpInside];//button 点击回调方法
    [_OrderView addSubview:_allNum];
    [_OrderView addSubview:_AllPrice];
    [_OrderView addSubview:_goPay];
    [self.view addSubview:_OrderView];
    //初始化字典
    _ListArray = [[NSMutableDictionary alloc] init];
    [_ListArray setValue:@"小明" forKey:@"Person"];
    [_ListArray setValue:@"13671032152" forKey:@"Phone"];
    [_ListArray setValue:@"山东省泰安市宁阳县政府" forKey:@"Address"];
    [_ListArray setValue:@"旁边" forKey:@"address"];
    //默认方式
    _StrPay = @"在线支付";
    _StrZhifu = @"支付宝";
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 1;
    }else if (section==1){
        return 5;
    }else{
        return 3;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 60;
    }else if (indexPath.section==2){
        return 80;
    }else{
        return 40;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    PayCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[PayCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    //取消选择高亮状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //右边的剪头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section==0) {
        cell.imageView.image = [UIImage imageNamed:@"myding"];
        UIImageView *ima = [[UIImageView alloc] initWithFrame:CGRectMake(0, 57, DEVICEWIDTH, 3)];
        ima.image = [UIImage imageNamed:@"la"];
        [cell addSubview:ima];
        cell.textLabel.font = labelFontStyle;
        cell.detailTextLabel.font = labelFontStyle;
        cell.textLabel.text =   [NSString stringWithFormat:@"联系人:%@  电话:%@",_ListArray[@"Person"],_ListArray[@"Phone"]];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"地址: %@%@",_ListArray[@"Address"],_ListArray[@"address"]];
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            cell.accessoryType =  UITableViewCellAccessoryNone;
            cell.listLab.text = @"余额抵扣";
            cell.dataLab.text = @"120.00";
            cell.dataLab.textColor = [UIColor redColor];
            [cell.sureBtn addTarget:self action:@selector(yue:) forControlEvents:UIControlEventTouchUpInside];
        }else if (indexPath.row==1){
            cell.listLab.text = @"付款方式";
            cell.dataLab.text = _StrPay;
        }else if (indexPath.row==2){
            cell.listLab.text = @"支付方式";
            cell.dataLab.text = _StrZhifu;
        }
        else if (indexPath.row==3){
            cell.listLab.text = @"优惠信息";
            cell.dataLab.text = @"2张优惠券可用";
        }else{
            cell.accessoryType =  UITableViewCellAccessoryNone;
            cell.textV.delegate = self;
        }
    }else{
        cell.accessoryType =  UITableViewCellAccessoryNone;
        cell.imagePro.image = [UIImage imageNamed:@"tou"];
        cell.nameLab.text = @"西红柿";
        cell.priceLab.text  = @"100元";
        cell.numLab.text = @"x8";
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        GetAddressViewController *getadd = [[GetAddressViewController alloc] init];
        getadd.deleGate = self;
        [self.navigationController pushViewController:getadd animated:YES];
    }else if(indexPath.section==1){
        if (indexPath.row==1) {
            NiceAlertSheet *alertSheet = [[NiceAlertSheet alloc] initWithMessage:@"选择付款方式" choiceButtonTitles:@[@"在线支付",@"货到付款"]];
            [alertSheet show];
            alertSheet.choiceButtonClickedBlock = ^(NSInteger i) {
                if (i==0) {
                    _StrPay = @"在线支付";
                }else{
                    _StrPay = @"货到付款";
                }
                [_tableview reloadData];
            };
        }else if (indexPath.row==2){
            NiceAlertSheet *alertSheet = [[NiceAlertSheet alloc] initWithMessage:@"选择支付方式" choiceButtonTitles:@[@"支付宝",@"微信"]];
            [alertSheet show];
            alertSheet.choiceButtonClickedBlock = ^(NSInteger i) {
                if (i==0) {
                    _StrZhifu = @"支付宝";
                }else{
                    _StrZhifu = @"微信";
                }
                [_tableview reloadData];
            };
        }
        else if (indexPath.row==3){
            CouponViewController *coupon = [[CouponViewController alloc] init];
            [self.navigationController pushViewController:coupon animated:YES];
        }
    }
}
#pragma mark -- UiTextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    NSLog(@"%ld========%@",(long)textField.tag, textField.text);
    return YES;
}
//跳转到支付界面
-(void)gozhifu{
//    DingDanViewController *ding = [[DingDanViewController alloc] init];
    //    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [self.navigationController pushViewController:ding animated:YES];
    NSLog(@"调用%@",_StrZhifu);
    
}
//选择余额抵扣按钮
-(void)yue:(UIButton *)button{
    
    if (setBool==YES) {
        [button setImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        setBool = NO;
    }else{
        [button setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];
        setBool = YES;
    }
}
//使用代理获取下个界面选取的地址
-(void)Getbackadd:(NSMutableDictionary *)dic{
    //初始化字典
    _ListArray = [[NSMutableDictionary alloc] init];
    _ListArray = dic;
    [_tableview reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
