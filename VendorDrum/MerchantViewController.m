//
//  MerchantViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/15.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "MerchantViewController.h"
#import "MerchantCell.h"
#import "ZLPhoto.h"
#import "UserThinkViewController.h"
@interface MerchantViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation MerchantViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"店铺一号";
    //初始化tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-80, DEVICEHIGHT-100, 60, 60)];
    [button setBackgroundImage:[UIImage imageNamed:@"Tele"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(CallT) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else{
        return 1;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 150;
        }else{
            return 50;
        }
    }
//    else if (indexPath.section==1){
//        return 60;
//    }
    else{
        
        return 200;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 5.0;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    MerchantCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell = [[MerchantCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.backgroundColor = [UIColor colorWithRed:0.97 green:0.43 blue:0.44 alpha:1.00];
            cell.HeadImageView.image = [UIImage imageNamed:@"sg"];
            [cell.scBtn addTarget:self action:@selector(shoucangBtn:) forControlEvents:UIControlEventTouchUpInside];
            cell.AddressLab.text = @"山东省泰安市宁阳县";
            cell.ZhuYingLab.text = @"主营:黄瓜，西红柿，玉米，茄子等";
        }else{
            cell.timeLab.text = @"开店时间";
            cell.danLab.text = @"成交单数";
            cell.shouLab.text = @"收藏次数";
            cell.TimeLab.text = @"2年";
            cell.DanLab.text = @"26";
            cell.ShouLab.text = @"3";
        }
    }
//    else if (indexPath.section==1){
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.XinYuLab.text = @"信誉评价";
//        [cell.starRatingView setScore:3.0/5 withAnimation:YES];
//        cell.numXinLab.text = @"3.0";
//        cell.PingLab.text = @"(23条评价)";
//    }
    else if (indexPath.section==1){
        cell.ZhanLab.text = @"店铺展示";
        cell.JieShaoLab.text = @"店铺介绍:这特么是一个什么店铺，你猜呢，好吧，这特么不是一个店铺，是个黑店，小伙子，你上当了～～";
        NSLog(@"%ld",(long)cell.zhanBtn.tag);
    }
    else{
        cell.ShangPinLab.text = @"商品信息";
        cell.GoBtn.text = @"去店铺>>";
        NSLog(@"%ld",(long)cell.Product.tag);
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==1) {
        UserThinkViewController *userthink = [[UserThinkViewController alloc] init];
        [self.navigationController pushViewController:userthink animated:YES];
    }
}
//拨打电话
-(void)CallT{
    UIWebView *callWebView = [[UIWebView alloc] init];
    NSURL *telURL = [NSURL URLWithString:@"tel:13671032152"];
    [callWebView loadRequest:[NSURLRequest requestWithURL:telURL]];
    [self.view addSubview:callWebView];
}
//收藏店铺
-(void)shoucangBtn:(UIButton *)button{

    [button setBackgroundImage:[UIImage imageNamed:@"s2"] forState:UIControlStateNormal];

}
@end
