//
//  OrderViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/15.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderCell.h"
#import "DingDetailViewController.h"
#import "PingViewController.h"
#import "ZJAlertListView.h"
#import "WuLiuViewController.h"
#import "SellAfterViewController.h"
#import "LXAlertView.h"


@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource,ZJAlertListViewDelegate,ZJAlertListViewDatasource>

@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *arrDing;
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;
@property (nonatomic,retain)ZJAlertListView *alertList;
@property (nonatomic,strong)NSMutableArray *arrTui;



@property (nonatomic)NSInteger TuiNum;
@end

@implementation OrderViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"订单";
    ///////////////=======================///////////////////============================////////////////////////===========
    _arrDing = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
    _arrTui = [[NSMutableArray alloc] initWithObjects:@"我不想买了",@"信息填写错误,重新下单",@"商家缺货",@"其他", nil];
    _tableview= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 9;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 110;
    }else{
        return 50;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 30)];
    UILabel *labName = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, (DEVICEWIDTH-20)/2, 30)];
    labName.text = @"爱尚家水果店";
    labName.font = normalFontStyle;
    UILabel *labTime = [[UILabel alloc] initWithFrame:CGRectMake((DEVICEWIDTH-20)/2+10, 0, (DEVICEWIDTH-20)/2, 30)];
    labTime.text = @"2016-3-12  15:22:12";
    labTime.font = labelFontStyle;
    labTime.textColor = [UIColor grayColor];
    labTime.textAlignment = NSTextAlignmentRight;
    [headV addSubview:labName];
    [headV addSubview:labTime];
    return headV;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    OrderCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[OrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row==0) {
        cell.imagePro.image = [UIImage imageNamed:@"sg"];
        cell.nameLab.text  = @"水果拼盘";
        cell.priceLab.text = @"¥ 23.00";
        cell.numLab.text   = @"共3件商品";
        cell.shuLab.text   = @"x5";
        cell.jiaLab.text   = @"合计¥50.00(运费:¥5.00)";
    }else{
        NSString *str = [NSString stringWithFormat:@"%ld",indexPath.section+1];
        [cell backZhuangT:str];
        switch ([str intValue]) {
            case 1:
                [cell.BtnTwo   setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [cell.BtnThree addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 2:
                [cell.BtnTwo   setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [cell.BtnThree addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 3:
                [cell.BtnTwo   addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [cell.BtnThree addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 4:
                [cell.BtnOne   addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [cell.BtnTwo   addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [cell.BtnThree addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 5:
                //                [cell.BtnOne   addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [cell.BtnTwo   addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [cell.BtnThree addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 6:
                //                [cell.BtnOne   setTitle:@"已评价" forState:UIControlStateNormal];
                //                [cell.BtnTwo   addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [cell.BtnThree addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 7:
                [cell.BtnThree setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [cell.BtnTwo   addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
            default:
                [cell.BtnThree addTarget:self action:@selector(pickBtn:) forControlEvents:UIControlEventTouchUpInside];
                cell.BtnThree.titleLabel.font = labelFontStyle;
                break;
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DingDetailViewController *ding = [[DingDetailViewController alloc] init];
    ding.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:ding animated:YES];
}
//状态点击事件
-(void)pickBtn:(UIButton *)button{
    NSLog(@"%@",button.titleLabel.text);
    if ([button.titleLabel.text  isEqual: @"评价"]) {
        PingViewController *ping = [[PingViewController alloc] init];
        ping.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:ping animated:YES];
    }else if ([button.titleLabel.text  isEqual: @"取消订单"]){
        _alertList = [[ZJAlertListView alloc] initWithFrame:CGRectMake(0, 0, 250, 300)];
        _alertList.titleLabel.text = @"原因";
        _alertList.datasource = self;
        _alertList.delegate = self;
        __block OrderViewController* bObject = self;
        //点击确定的时候，调用它去做点事情
        [_alertList setDoneButtonWithBlock:^{
            NSIndexPath *selectedIndexPath = bObject.selectedIndexPath;
            NSLog(@"%ld",(long)selectedIndexPath.row);
            _TuiNum = selectedIndexPath.row;
            [bObject quxiaoD];
            [bObject.alertList dismiss];
        }];
        [_alertList show];
    }else if ([button.titleLabel.text  isEqual: @"查看物流"]){
        //物流信息
        WuLiuViewController *wuliu = [[WuLiuViewController alloc] init];
        wuliu.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:wuliu  animated:YES];
    }else if ([button.titleLabel.text  isEqual: @"申请售后"]){
        //申请售后
        SellAfterViewController *sellaf = [[SellAfterViewController alloc] init];
        sellaf.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:sellaf animated:YES];
    }else if ([button.titleLabel.text isEqual:@"确认收货"]){
        LXAlertView *alert=[[LXAlertView alloc] initWithTitle:nil message:@"收到货物再确认收货哦～" cancelBtnTitle:@"取消" otherBtnTitle:@"确认收货" clickIndexBlock:^(NSInteger clickIndex) {
            NSLog(@"点击index====%ld",(long)clickIndex);
        }];
        //alert.dontDissmiss=YES;
        //设置动画类型(默认是缩放)
        //_alert.animationStyle=LXASAnimationTopShake;
        [alert showLXAlertView];
    }
}
-(void)quxiaoD{
    
    NSLog(@"%@",_arrTui[_TuiNum]);
    
}
#pragma mark -设置行数
- (NSInteger)alertListTableView:(ZJAlertListView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)alertListTableView:(ZJAlertListView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableAlertListCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if ( self.selectedIndexPath && NSOrderedSame == [self.selectedIndexPath compare:indexPath])
    {
        cell.imageView.image = [UIImage imageNamed:@"checked"];
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"unchecked"];
    }
    cell.textLabel.font = labelFontStyle;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_arrTui[indexPath.row]];
    return cell;
}
- (void)alertListTableView:(ZJAlertListView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
- (void)alertListTableView:(ZJAlertListView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    UITableViewCell *cell = [tableView alertListCellForRowAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"checked"];
    NSLog(@"didSelectRowAtIndexPath:%ld", (long)indexPath.row);
}

@end
