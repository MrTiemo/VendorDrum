//
//  WuLiuViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/2.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "WuLiuViewController.h"
#import "WuLiuCell.h"
@interface WuLiuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *listArr;
@end

@implementation WuLiuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"物流详情";
    _listArr = [[NSMutableArray alloc] initWithObjects:@"【泰安市】宁阳县集散 已发出",@"【泰安市】宁阳县集散 已发出",@"【泰安市】宁阳县集散 已发出",@"审核通过",@"订单提交成功，等待审核", nil];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==1) {
        return _listArr.count;
    }else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    WuLiuCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[WuLiuCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIColor *color = [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.00];
    if (indexPath.section==0) {
        cell.proImage.image = [UIImage imageNamed:@"sg"];
        cell.wuliu.text   = @"物流状态：待签收";
        cell.gongshi.text = @"承运公司：天天快递";
        cell.bianhao.text = @"运单编号：3456534782";
        cell.dianhua.text = @"官方电话：400-800-6666";
    }else if (indexPath.section==1){
        if (_listArr.count<2) {
            cell.imageWu.image = [UIImage imageNamed:@"gr"];
            cell.xinxiLab.text = [NSString stringWithFormat:@"%@",[_listArr objectAtIndex:indexPath.row]];
            cell.xinxiLab.textColor = [UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00];
            cell.timeLab.text = @"2016-12-12";
        }else {
            if (indexPath.row==0) {
                cell.ViewXia.backgroundColor = color;
                cell.imageWu.image = [UIImage imageNamed:@"gr"];
                cell.lineCell.backgroundColor = color;
                cell.xinxiLab.text = [NSString stringWithFormat:@"%@",[_listArr objectAtIndex:indexPath.row]];
                cell.xinxiLab.textColor = [UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00];
                cell.timeLab.text = @"2016-12-12";
            }else if (indexPath.row==_listArr.count-1){
                cell.ViewShang.backgroundColor = color;
                cell.imageWu.image = [UIImage imageNamed:@"hui"];
                cell.xinxiLab.text = [NSString stringWithFormat:@"%@",[_listArr objectAtIndex:indexPath.row]];
                cell.timeLab.text = @"2016-12-12";
            }else{
                cell.ViewXian.backgroundColor = color;
                cell.imageWu.image = [UIImage imageNamed:@"hui"];
                cell.lineCell.backgroundColor = color;
                cell.xinxiLab.text = [NSString stringWithFormat:@"%@",[_listArr objectAtIndex:indexPath.row]];
                cell.timeLab.text = @"2016-12-12";
            }
        }
    }else{
        [cell.sureBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return cell;
}

-(void)sureClick{


}

@end
