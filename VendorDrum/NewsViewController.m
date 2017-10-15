//
//  NewsViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/5.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"
#import "ReadNewViewController.h"

@interface NewsViewController ()<UITableViewDelegate,UITableViewDataSource>
//@property (nonatomic, strong)UIScrollView *scroll;
@property (nonatomic, strong)UIButton *selBtnOne;
@property (nonatomic, strong)UIButton *selBtnTwo;
@property (nonatomic, strong)UIView   *pageLine;

@property (nonatomic, strong)UITableView *tableview;
@property (nonatomic, strong)NSMutableDictionary *arrOne;
@property (nonatomic, strong)NSMutableDictionary *arrTwo;
@property (nonatomic, strong)NSMutableDictionary *dic;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"我的消息";
    _dic = [[NSMutableDictionary alloc] init];
    //初始化数据字典
    _arrOne = [[NSMutableDictionary alloc]init];
    [_arrOne setValue:@"退款" forKey:@"title"];
    [_arrOne setValue:@"您的订单已经不知道掉哪去了，如果你有意见，你来打我啊，我勒个擦，真打啊！！我尼玛" forKey:@"nei"];
    [_arrOne setValue:@"2016.8.2 12:09:23" forKey:@"time"];
    [_arrOne setValue:@"0" forKey:@"pan"];
    
    //初始化数据字典
    _arrTwo = [[NSMutableDictionary alloc]init];
    [_arrTwo setValue:@"评价" forKey:@"title"];
    [_arrTwo setValue:@"如果你有意见，你来打我啊，我勒个擦，真打啊！！我尼玛.如果你有意见，你来打我啊，我勒个擦，真打啊！！我尼玛" forKey:@"nei"];
    [_arrTwo setValue:@"2015.8.2 1:22:23" forKey:@"time"];
    [_arrTwo setValue:@"1" forKey:@"pan"];

    
    UIColor *color = [UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00];
    //初始化选择按钮
    _selBtnOne = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH/2, 40)];
    [_selBtnOne setTitle:@"未查看" forState:UIControlStateNormal];
    [_selBtnOne setTitleColor:color forState:UIControlStateNormal];
    [_selBtnOne addTarget:self action:@selector(selOne) forControlEvents:UIControlEventTouchUpInside];
    _selBtnOne.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    _selBtnOne.titleLabel.font = normalFontStyle;
    [self.view addSubview:_selBtnOne];
    _selBtnTwo = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2, 64, DEVICEWIDTH/2, 40)];
    [_selBtnTwo setTitle:@"已查看" forState:UIControlStateNormal];
    [_selBtnTwo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_selBtnTwo addTarget:self action:@selector(selTwo) forControlEvents:UIControlEventTouchUpInside];
    _selBtnTwo.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    _selBtnTwo.titleLabel.font = normalFontStyle;
    [self.view addSubview:_selBtnTwo];
    //可以移动的小绿条
    _pageLine = [[UIView alloc] initWithFrame:CGRectMake(0, 104, DEVICEWIDTH/2, 3)];
    _pageLine.backgroundColor = color;
    [self.view addSubview:_pageLine];
    
    //tableview
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 107, DEVICEWIDTH, DEVICEHIGHT-107) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    
    _dic = _arrOne;
}
-(void)selOne{
    _pageLine.frame = CGRectMake(0, 104, DEVICEWIDTH/2, 3);
    [_selBtnOne setTitleColor:[UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00] forState:UIControlStateNormal];
    [_selBtnTwo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _dic = _arrOne;
    [_tableview reloadData];
}
-(void)selTwo{
    _pageLine.frame = CGRectMake(DEVICEWIDTH/2, 104, DEVICEWIDTH/2, 3);
    [_selBtnTwo setTitleColor:[UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00] forState:UIControlStateNormal];
    [_selBtnOne setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _dic = _arrTwo;
    [_tableview reloadData];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID = @"cell";
    NewsCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.titleLab.text = [NSString stringWithFormat:@"%@",[_dic objectForKey:@"title"]];
    cell.neiLab.text = [NSString stringWithFormat:@"%@",[_dic objectForKey:@"nei"]];
    cell.timeLab.text = [NSString stringWithFormat:@"%@",[_dic objectForKey:@"time"]];
    if ([[_dic objectForKey:@"pan"] isEqual:@"0"]) {
        cell.viewB.backgroundColor = [UIColor redColor];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ReadNewViewController *read = [[ReadNewViewController alloc] init];
    [self.navigationController pushViewController:read animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
