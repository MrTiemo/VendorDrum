
//
//  StoreDingViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/9.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "StoreDingViewController.h"
#import "XFSegmentView.h"          //类型选择
#import "storeDingCell.h"
#import "YBAlertView.h"           //弹框
#import "FaHuoViewController.h"  //发货界面
#import "CancelDingViewController.h"
#import "ReturnMoneyViewController.h"




@interface StoreDingViewController ()<UITableViewDataSource,UITableViewDelegate,XFSegmentViewDelegate,UITextFieldDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *arrData;


@property (nonatomic)NSInteger num;

@end

@implementation StoreDingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单管理";
    self.view.backgroundColor = [UIColor whiteColor];
    //上边的选择类别
    XFSegmentView *segView=[[XFSegmentView alloc]initWithFrame:Frame(0, 64, DEVICEWIDTH, 40)];
    [self.view addSubview:segView];
    segView.delegate = self;
    segView.titles = @[@"全部",@"待发货",@"待签收",@"退款中"];
    segView.titleFont = normalFontStyle;
    
    //tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 104, DEVICEWIDTH, DEVICEHIGHT-104) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _arrData = [[NSMutableArray alloc] init];
    
}
-(void)segmentView:(XFSegmentView *)segmentView didSelectIndex:(NSInteger)index{
    
    //    self.view.backgroundColor = [UIColor colorWithRed:0.89 green:0.21*index blue:0.22 alpha:1.00];
    NSLog(@"%ld",(long)index);
    _num = index;
    [_tableView reloadData];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (_num==1) {
        return 4;
    }else if (_num==2){
        return 3;
    }else if (_num==3){
        return 5;
    }else{
        if (section==0) {
            return 3;
        }else if (section==1){
            return 4;
        }else{
            return 5;
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row==0) {
        return 30;
    }else if(indexPath.row==1){
        return 80;
    }else if(indexPath.row==2){
        return 30;
    }else if (indexPath.row==3){
        return 40;
    }else{
        return 40;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    storeDingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[storeDingCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (_num==1) {//＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊待发货＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
        switch (indexPath.row) {
            case 0:
                cell.labUsername.text = @"哪有那么多烂好人";
                cell.labBian.text = @"订单编号:342409840423";
                cell.labZhuang.text = @"待支付";
                cell.labBackground.backgroundColor = [UIColor grayColor];
                break;
            case 1:
                cell.imaV.image = [UIImage imageNamed:@"sg"];
                cell.labProName.text = @"我是什么鬼啊";
                cell.labPrice.text = @"88.0元";
                cell.labNum.text = @"X3";
                break;
            case 2:
                cell.labGongji.text = @"共22件商品";
                cell.labAllprice.text = @"总价:1290元(邮费到付)";
                break;
                
            default:
                [cell.buttonLeft setTitle:@"无需物流" forState:UIControlStateNormal];
                [cell.buttonRight setTitle:@"手动发货" forState:UIControlStateNormal];
                [cell.buttonLeft addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [cell.buttonRight addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
        }
    }else if (_num==2){//＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊待签收＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
        switch (indexPath.row) {
            case 0:
                cell.labUsername.text = @"哪有那么多烂好人";
                cell.labBian.text = @"订单编号:342409840423";
                cell.labZhuang.text = @"待支付";
                cell.labBackground.backgroundColor = [UIColor grayColor];
                break;
            case 1:
                cell.imaV.image = [UIImage imageNamed:@"sg"];
                cell.labProName.text = @"我是什么鬼啊";
                cell.labPrice.text = @"88.0元";
                cell.labNum.text = @"X3";
                break;
            default:
                cell.labGongji.text = @"共22件商品";
                cell.labAllprice.text = @"总价:1290元(邮费到付)";
                break;
        }
    }else if (_num==3){//＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊待退款＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
        
        
        switch (indexPath.row) {
            case 0:
                cell.labUsername.text = @"哪有那么多烂好人";
                cell.labBian.text = @"订单编号:342409840423";
                cell.labZhuang.text = @"待支付";
                cell.labBackground.backgroundColor = [UIColor grayColor];
                break;
            case 1:
                cell.imaV.image = [UIImage imageNamed:@"sg"];
                cell.labProName.text = @"我是什么鬼啊";
                cell.labPrice.text = @"88.0元";
                cell.labNum.text = @"X3";
                break;
                
            case 2:
                cell.labGongji.text = @"共22件商品";
                cell.labAllprice.text = @"总价:1290元(邮费到付)";
                break;
            case 3:
                
                cell.labTui.text = @"取消订单";
                cell.labBackTui.backgroundColor = [UIColor grayColor];
                cell.labReason.text = @"我不想买了,  咋地，瞅你咋地，你妹的";
                break;
                
            default:
                [cell.buttonLeft setTitle:@"拒绝" forState:UIControlStateNormal];
                [cell.buttonLeft addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [cell.buttonRight setTitle:@"同意" forState:UIControlStateNormal];
                [cell.buttonRight addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
        }
    }else{//＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊全部＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊
        if (indexPath.row==0) {
            cell.labUsername.text = @"哪有那么多烂好人";
            cell.labBian.text = @"订单编号:342409840423";
            cell.labZhuang.text = @"待支付";
            cell.labBackground.backgroundColor = [UIColor grayColor];
        }else if (indexPath.row==1){
            cell.imaV.image = [UIImage imageNamed:@"sg"];
            cell.labProName.text = @"我是什么鬼啊";
            cell.labPrice.text = @"88.0元";
            cell.labNum.text = @"X3";
        }else if (indexPath.row==2){
            cell.labGongji.text = @"共22件商品";
            cell.labAllprice.text = @"总价:1290元(邮费到付)";
        }
        if (indexPath.section==1){
            if (indexPath.row==3) {
                [cell.buttonLeft setTitle:@"无需物流" forState:UIControlStateNormal];
                [cell.buttonRight setTitle:@"手动发货" forState:UIControlStateNormal];
                [cell.buttonLeft addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [cell.buttonRight addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
            }
        }else{
            if (indexPath.row==3) {
                cell.labTui.text = @"取消订单";
                cell.labBackTui.backgroundColor = [UIColor grayColor];
                cell.labReason.text = @"我不想买了,  咋地，瞅你咋地，你妹的";
            }else if(indexPath.row==4){
                [cell.buttonLeft setTitle:@"拒绝" forState:UIControlStateNormal];
                [cell.buttonLeft addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [cell.buttonRight setTitle:@"同意" forState:UIControlStateNormal];
                [cell.buttonRight addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                
            }
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_num==1) {
        
        if (indexPath.section==0) {
            CancelDingViewController *cancel = [[CancelDingViewController alloc] init];
            [self.navigationController pushViewController:cancel animated:YES];
        }else{
            FaHuoViewController *fahuo = [[FaHuoViewController alloc] init];
            [self.navigationController pushViewController:fahuo animated:YES];
        }
        
    }else if (_num==3){
        ReturnMoneyViewController *returnMon = [[ReturnMoneyViewController alloc] init];
        [self.navigationController pushViewController:returnMon animated:YES];
    
    }
 
    NSLog(@"%ld",(long)indexPath.section);
}
-(void)pickBtn:(UIButton *)button{
    //判断是在哪一个类型下（  0 全部 1 待发货  2 待签收 3 退款中）
    if (_num==1) {
        if ([button.titleLabel.text containsString:@"无"]) {
            NSLog(@"1");
        }else
        {
            [self clickFaHuo];
        }
    }else if (_num==2){
        
        
    }else if (_num==3){
        if ([button.titleLabel.text containsString:@"绝"]) {
            NSLog(@"3");
            
        }else{
            NSLog(@"4");
        }
    }else{
        if ([button.titleLabel.text containsString:@"无"]) {
            NSLog(@"1");
        }else if ([button.titleLabel.text containsString:@"手"]) {
            [self clickFaHuo];
        }else if ([button.titleLabel.text containsString:@"绝"]) {
            NSLog(@"3");
        }else{
            NSLog(@"4");
        }
    }
}
-(void)clickFaHuo{
    
    YBAlertView *alertView = [[YBAlertView alloc] initWithFrame:CGRectMake(50, DEVICEHIGHT/2 -100, DEVICEWIDTH-100, 150)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, alertView.width, 30)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"请输入发货信息";
    titleLabel.font = normalFontStyle;
    [alertView addSubview:titleLabel];
    
    UITextField *passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(titleLabel.frame) + 4, alertView.width-32, 30)];
    passwordTF.tag = 100;
    passwordTF.borderStyle = UITextBorderStyleRoundedRect;
    passwordTF.layer.borderWidth = 1;
    passwordTF.layer.borderColor = [UIColor grayColor].CGColor;
    passwordTF.placeholder = @"物流公司";
    passwordTF.layer.cornerRadius = 5;
    passwordTF.font = normalFontStyle;
    passwordTF.delegate = self;
    passwordTF.returnKeyType = UIReturnKeyDone;
    [alertView addSubview:passwordTF];
    
    UITextField *passwordNum = [[UITextField alloc] initWithFrame:CGRectMake(16, CGRectGetMaxY(titleLabel.frame) + 40, alertView.width-32, 30)];
    passwordNum.tag = 101;
    passwordNum.borderStyle = UITextBorderStyleRoundedRect;
    passwordNum.layer.borderWidth = 1;
    passwordNum.layer.borderColor = [UIColor grayColor].CGColor;
    passwordNum.placeholder = @"物流编号";
    passwordNum.layer.cornerRadius = 5;
    passwordNum.font = normalFontStyle;
    passwordNum.returnKeyType = UIReturnKeyDone;
    passwordNum.delegate = self;
    [alertView addSubview:passwordNum];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelBtn.frame = CGRectMake(16, CGRectGetMaxY(passwordNum.frame) + 10, passwordNum.width/2-10, 30);
    [cancelBtn addTarget:self action:@selector(confirmClick:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitle:@"发货" forState:UIControlStateNormal];
    cancelBtn.backgroundColor = [UIColor colorWithRed:0.98 green:0.47 blue:0.13 alpha:1.00];
    cancelBtn.layer.borderWidth = 1;
    cancelBtn.layer.borderColor = [UIColor grayColor].CGColor;
    cancelBtn.layer.cornerRadius = 5;
    [alertView addSubview:cancelBtn];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    confirmBtn.frame = CGRectMake(CGRectGetMaxX(cancelBtn.frame)+10, CGRectGetMaxY(passwordNum.frame) + 10, passwordNum.width/2, 30);
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
    UITextField *tn = [btn.superview viewWithTag:101];
    NSLog(@"快递名：%@－－－快递号码：%@", tf.text,tn.text);
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField  resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
