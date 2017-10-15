//
//  DingDetailViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/2.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "DingDetailViewController.h"
#import "DDetailCell.h"
#import "WuLiuViewController.h"
@interface DingDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView    *tableView;
@property (nonatomic,strong)NSMutableArray *arr;

@end
@implementation DingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    _arr = [[NSMutableArray alloc] initWithObjects:@"订单编号: 34256748374",@"付款方式: 支付宝",@"送货时间: 12:00－14:00",@"备注: 你可长点心吧", nil];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate       = self;
    _tableView.dataSource     = self;
    [self.view addSubview:_tableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==1){
        return 4;
    }else if (section==3){
        return 5;
    }else {
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        return 60;
    }else if (indexPath.section==1){
        if (indexPath.row<=1) {
            return 100;
        }else{
            return 30;
        }
    }else if (indexPath.section==2){
        return 50;
    }else{
        if (indexPath.row==4) {
            return 100;
        }else{
            return 40;
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1) {
        return 30;
    }else if (section==0){
        
        return 0.01;
    }
    else{
        return 5.0;
    }
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 30)];
    
    if (section==1) {
        
        UILabel *labName = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, (DEVICEWIDTH-20)/2, 30)];
        labName.text     = @"爱尚家水果店";
        labName.font     = normalFontStyle;
        UILabel *labTime = [[UILabel alloc] initWithFrame:CGRectMake((DEVICEWIDTH-20)/2+10, 0, (DEVICEWIDTH-20)/2, 30)];
        labTime.text = @"2016-3-12  15:22:12";
        labTime.font = labelFontStyle;
        labTime.textColor = [UIColor grayColor];
        labTime.textAlignment = NSTextAlignmentRight;
        [headV addSubview:labName];
        [headV addSubview:labTime];
    }
    return headV;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    DDetailCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[DDetailCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = labelFontStyle;
    cell.detailTextLabel.font = labelFontStyle;
    if (indexPath.section==0) {
        cell.imageView.image      = [UIImage imageNamed:@"myding"];
        UIImageView *ima          = [[UIImageView alloc] initWithFrame:CGRectMake(0, 57, DEVICEWIDTH, 3)];
        ima.image = [UIImage imageNamed:@"la"];
        [cell addSubview:ima];
        cell.textLabel.text       =   [NSString stringWithFormat:@"联系人:呵呵  电话:123123123"];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"地址: 山东啥呢干对哦好吧"];
    }else if (indexPath.section==1){
        if (indexPath.row<=1) {
            cell.proImage.image = [UIImage imageNamed:@"sg"];
            cell.nameLab.text   = @"商品名称";
            cell.priceLab.text  = @"¥ 23.00";
            cell.numLab.text    = @"x3";
        }else if(indexPath.row==2) {
            cell.jianLab.text   = @"共3件商品 合计¥50.00";
        }else{
            cell.YouHLab.text   = @"  优惠0元 实付¥50.00";
        }
    }else if (indexPath.section==2){
        //        cell.accessoryType       = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image     = [UIImage imageNamed:@"car"];
        cell.textLabel.text      = @"天天快递：243567542532";
        cell.textLabel.textColor = [UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00];
    }else{
        if (indexPath.row<4) {
            cell.textLabel.text  = [NSString stringWithFormat:@"%@",[_arr objectAtIndex:indexPath.row]];
        }else{
            [cell.kfBtn addTarget:self action:@selector(kfClick) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2) {
        //        WuLiuViewController *wuliu = [[WuLiuViewController alloc] init];
        //        [self.navigationController pushViewController:wuliu animated:YES];
    }
}
//联系店家
-(void)kfClick{
    NSLog(@"联系店家");
}
@end
