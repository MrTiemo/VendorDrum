//
//  TiBaoViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/18.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "TiBaoViewController.h"
#import "TiBaoCell.h"
#import "InputViewController.h"


@interface TiBaoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIButton    *selBtnOne; ///<第一个按钮 待审核
@property (nonatomic, strong)UIButton    *selBtnTwo; ///<第二个按钮 已审核
@property (nonatomic, strong)UIView      *pageLine;  ///<小绿条
@property (nonatomic, strong)UITableView *tableview; ///<tableview
@property (nonatomic, strong)NSString    *str;       ///<点击了哪一个
@end

@implementation TiBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //新增按钮
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"新增十" style:UIBarButtonItemStyleDone target:self action:@selector(productAdd)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"xinzeng"] style:UIBarButtonItemStyleDone target:self action:@selector(productAdd)];
    
    
    
    self.title = @"我的提报";
    _str=@"0";
    UIColor *color = [UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00];
    //初始化选择按钮
    _selBtnOne = [[UIButton alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH/2, 40)];
    [_selBtnOne setTitle:@"待审核" forState:UIControlStateNormal];
    [_selBtnOne setTitleColor:color forState:UIControlStateNormal];
    [_selBtnOne addTarget:self action:@selector(selO) forControlEvents:UIControlEventTouchUpInside];
    _selBtnOne.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    _selBtnOne.titleLabel.font = normalFontStyle;
    [self.view addSubview:_selBtnOne];
    
    _selBtnTwo = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2, 64, DEVICEWIDTH/2, 40)];
    [_selBtnTwo setTitle:@"已审核" forState:UIControlStateNormal];
    [_selBtnTwo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_selBtnTwo addTarget:self action:@selector(selT) forControlEvents:UIControlEventTouchUpInside];
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
    
}
-(void)selO{
    _pageLine.frame = CGRectMake(0, 104, DEVICEWIDTH/2, 3);
    [_selBtnOne setTitleColor:[UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00] forState:UIControlStateNormal];
    [_selBtnTwo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _str = @"0";
    [_tableview reloadData];
}
-(void)selT{
    _pageLine.frame = CGRectMake(DEVICEWIDTH/2, 104, DEVICEWIDTH/2, 3);
    [_selBtnTwo setTitleColor:[UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00] forState:UIControlStateNormal];
    [_selBtnOne setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _str = @"1";
    [_tableview reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([_str isEqual:@"0"]) {
        return 2;
    }else{
        return 3;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    TiBaoCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[TiBaoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.imaV.image = [UIImage imageNamed:@"sg"];
    cell.nameLab.text = @"商品种类";
    cell.pirceLab.text = @"12元/斤";
    cell.yunFeiLab.text = @"电话协商";
    cell.timeLab.text = @"2016-3-12";
    if ([_str isEqual:@"0"]) {
        
        if (indexPath.row==0) {
            cell.KuOrTimeLab.text = @"8月中旬";
            cell.KuOrTimeLab.textColor = [UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00];
        }else{
            cell.KuOrTimeLab.text = @"库存:10000";
        }
        cell.zhuangTaiLab.text = @"待审核";
    }else{
        switch (indexPath.row) {
            case 0:
                cell.KuOrTimeLab.text = @"8月中旬";
                cell.KuOrTimeLab.textColor = [UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00];
                cell.editBtn.tag = indexPath.row+1;
                [cell.editBtn addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
//                cell.DownBtn.tag= indexPath.row+1;
//                [cell.DownBtn addTarget:self action:@selector(updownBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 1:
                cell.KuOrTimeLab.text = @"库存:10000";
                cell.editBtn.tag = indexPath.row+1;
                [cell.editBtn addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
//                cell.UpBtn.tag= indexPath.row+1;
//                [cell.UpBtn addTarget:self action:@selector(updownBtn:) forControlEvents:UIControlEventTouchUpInside];
                break;
            case 2:
                cell.KuOrTimeLab.text = @"库存:10000";
                cell.editBtn.tag = indexPath.row+1;
                [cell.editBtn addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
                cell.zhuangTaiLab.frame = CGRectMake(DEVICEWIDTH-135,70,60,25);
                cell.zhuangTaiLab.text = @"审核不通过";
                break;
//            case 3:
//                cell.KuOrTimeLab.text = @"库存:0";
//                cell.ZeroIma.tag = 1001;
//                break;
            default:
                break;
        }
    }
    return cell;
}
-(void)edit:(UIButton *)button{
    
    NSLog(@"编辑＝＝＝＝＝＝＝＝%ld",(long)button.tag);
    InputViewController*input = [[InputViewController alloc] init];
    [self.navigationController pushViewController:input animated:YES];
    
}
//-(void)updownBtn:(UIButton *)button{
//    
//    if ([button.titleLabel.text  isEqual: @"上架"]) {
//        
//        NSLog(@"上架＝＝＝＝＝＝＝＝%ld",(long)button.tag);
//        
//    }else{
//        
//        NSLog(@"下架＝＝＝＝＝＝＝＝%ld",(long)button.tag);
//        
//    }
//}
-(void)productAdd{
    InputViewController*input = [[InputViewController alloc] init];
    [self.navigationController pushViewController:input animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
