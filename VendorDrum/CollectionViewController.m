//
//  CollectionViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/5.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionCell.h"
#import "LXAlertView.h"

@interface CollectionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title                = @"我的收藏";
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
    
    return 3;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
    
}
//自定义头视图  显示时间
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *viewH = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 30)];
    UILabel *lab  = [[UILabel alloc] initWithFrame:viewH.frame];
    lab.text      = @"2015. 3. 21";
    lab.font      = normalFontStyle;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor     = [UIColor grayColor];
    [viewH addSubview:lab];
    return viewH;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    CollectionCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[CollectionCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imagePro.image = [UIImage imageNamed:@"sg"];
    cell.nameLab.text   = @"水果至尊无敌拼盘";
    cell.numLab.text    = @"(已售231件)";
    cell.priceLab.text  = @"¥ 12.00";
    [cell.ShouBtn addTarget:self action:@selector(shouBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.ShouBtn.titleLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
    cell.ShouBtn.tag = indexPath.row;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld----%ld",(long)indexPath.section,(long)indexPath.row);
    
}
//点击收藏按钮
-(void)shouBtn:(UIButton *)button{
    
    NSInteger num = [button.titleLabel.text integerValue];
    NSLog(@"%ld---------%ld",(long)num,(long)button.tag);
    
    LXAlertView *alert=[[LXAlertView alloc] initWithTitle:nil message:@"小主～取消收藏就看不到喽～" cancelBtnTitle:@"取消" otherBtnTitle:@"确定" clickIndexBlock:^(NSInteger clickIndex) {
        NSLog(@"点击index====%ld",(long)clickIndex);
    }];
    //alert.dontDissmiss=YES;
    //设置动画类型(默认是缩放)
    //_alert.animationStyle=LXASAnimationTopShake;
    [alert showLXAlertView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
