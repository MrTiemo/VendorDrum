//
//  MYViewController.m
//  VendorDrum_IOS
//
//  Created by 爱尚家 on 16/7/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "MYViewController.h"
#import "MYCell.h"
#import "NewsViewController.h"
#import "SellViewController.h"
#import "CouponViewController.h"
#import "AboutViewController.h"
#import "BalanceViewController.h"
#import "GetAddressViewController.h"
#import "CollectionViewController.h"
#import "FootprintViewController.h"
#import "LoginViewController.h"
#import "PersonViewController.h"
#import "MyStoreViewController.h"


@interface MYViewController ()<UITableViewDelegate,UITableViewDataSource,loginDelegate,TuiChuDelegate>
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong)NSMutableArray *ArrayOne;
@property (nonatomic,strong)NSMutableArray *ArrayTwo;
@property (nonatomic,strong)NSMutableArray *ArrayThree;

@property (nonatomic,strong)NSMutableArray *imageArr1;
@property (nonatomic,strong)NSMutableArray *imageArr2;
@property (nonatomic,strong)NSMutableArray *imageArr3;

@property (nonatomic,strong)NSString *loginStr; //

@end

@implementation MYViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
//    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    _loginStr = @"2";
    //显示的文字数组
    _ArrayOne = [[NSMutableArray alloc] initWithObjects:@" 我的消息",@" 我的收藏",@" 我的店铺",@" 收货地址管理", nil];
    _ArrayTwo = [[NSMutableArray alloc] initWithObjects:@" 我的余额",@" 我的优惠券",nil];
    _ArrayThree = [[NSMutableArray alloc] initWithObjects:@" 客服电话",@" 关于货郎鼓", nil];
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    //图标集合
    _imageArr1 = [[NSMutableArray alloc] initWithObjects:@"news",@"shouc",@"dian",@"dizhi", nil];
    _imageArr2 = [[NSMutableArray alloc] initWithObjects:@"yue",@"quan", nil];
    _imageArr3 = [[NSMutableArray alloc] initWithObjects:@"kefu",@"about",nil];
    //footerView
    UIView *viewFoot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 60)];
    UILabel *lab  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 20)];
    lab.textColor = [UIColor grayColor];
    lab.font = labelFontStyle;
    lab.text = @"Copyright©2016 爱尚家网上商城版权所有";
    lab.textAlignment = NSTextAlignmentCenter;
    [viewFoot addSubview:lab];
    UILabel *labB = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, DEVICEWIDTH, 20)];
    labB.textColor = [UIColor grayColor];
    labB.font = labelFontStyle;
    labB.text = @"经营性网站许可证号    鲁ICP备14031356号";
    labB.textAlignment = NSTextAlignmentCenter;
    [viewFoot addSubview:labB];
    //tableview
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    _tableview.tableFooterView = viewFoot;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
//        case 2:
//            return 3;
//            break;
//            
        default:
            return 2;
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section==0) {
        return 80;
    }else{
        return 40;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    MYCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    if (cell == nil) {
        cell = [[MYCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font =  normalFontStyle;
    cell.detailTextLabel.font = labelFontStyle;
    if (indexPath.section==0) {
        if ([_loginStr isEqual:@"2"]) {
            
            cell.imageHead.image = [UIImage imageNamed:@"headurl"];
            cell.nameLab.text = @"点击登陆";
            cell.numLab.text = @"";
            
        }else{
            cell.imageHead.image = [UIImage imageNamed:@"headurl"];
            cell.nameLab.text = @"我也不知道叫什么";
            cell.numLab.text = @"ID：432563746";
        }
    }else if (indexPath.section==1){
        cell.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[_imageArr1 objectAtIndex:indexPath.row]]];
        cell.titLab.text = [NSString stringWithFormat:@"%@",[_ArrayOne objectAtIndex:indexPath.row]];
    }else if (indexPath.section==2){
        cell.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[_imageArr2 objectAtIndex:indexPath.row]]];
        cell.titLab.text = [NSString stringWithFormat:@"%@",[_ArrayTwo objectAtIndex:indexPath.row]];
        if (indexPath.row==0) {
            NSString *contentStr = @"剩余：¥1200.00";
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:contentStr];
            //设置：在0-3个单位长度内的内容显示成红色
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, contentStr.length-3)];
            cell.detailTextLabel.attributedText = str;
        }else if (indexPath.row==1){
            NSString *contentStr = @"2张优惠券可用";
            NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:contentStr];
            //设置：在0-3个单位长度内的内容显示成红色
            [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0,1)];
            cell.detailTextLabel.attributedText = str;
        }
    }else{
        cell.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[_imageArr3 objectAtIndex:indexPath.row]]];
        cell.titLab.text = [NSString stringWithFormat:@"%@",[_ArrayThree objectAtIndex:indexPath.row]];
        if (indexPath.row==0) {
            cell.telephone.text = @"400-600-9999";
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if ([_loginStr isEqual:@"1"]) {
            PersonViewController *person = [[PersonViewController alloc] init];
            person.hidesBottomBarWhenPushed = YES;
            person.TuiDEle = self;
            [self.navigationController pushViewController:person animated:YES];
        }else{
            
            LoginViewController *login = [[LoginViewController alloc] init];
            login.hidesBottomBarWhenPushed = YES;
            login.DeleGate = self;
            [self.navigationController pushViewController:login animated:YES];
        }
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            NewsViewController *news = [[NewsViewController alloc] init];
            news.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:news animated:YES];
        }else if (indexPath.row==1){
            CollectionViewController *coll = [[CollectionViewController alloc] init];
            coll.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:coll animated:YES];
            
        }else if (indexPath.row==2){
            
            MyStoreViewController *mystore = [[MyStoreViewController alloc] init];
            mystore.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:mystore animated:YES];
//            FootprintViewController *footp = [[FootprintViewController alloc] init];
//            footp.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:footp animated:YES];
            
        }else{
            GetAddressViewController *getadd = [[GetAddressViewController alloc] init];
            getadd.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:getadd animated:YES];
        }
    }else if (indexPath.section==2){
        if (indexPath.row==1) {
            //优惠券
            CouponViewController * coup = [[CouponViewController alloc] init];
            coup.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:coup animated:YES];
//        }else if (indexPath.row==2) {
////            //我要卖
////            SellViewController *sell= [[SellViewController alloc] init];
////            sell.hidesBottomBarWhenPushed = YES;
////            sell.str = @"1";
////            [self.navigationController pushViewController:sell animated:YES];
//            
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请拨打客服电话咨询" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [alert show];
        }
        else{
            BalanceViewController *balance = [[BalanceViewController alloc] init];
            balance.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:balance animated:YES];
        }
    }else{
        if (indexPath.row==0) {
            //拨打电话
            UIWebView *callWebView = [[UIWebView alloc] init];
            NSURL *telURL = [NSURL URLWithString:@"tel:13671032152"];
            [callWebView loadRequest:[NSURLRequest requestWithURL:telURL]];
            [self.view addSubview:callWebView];
        }else{
            //关于货郎鼓
            AboutViewController *about = [[AboutViewController alloc] init];
            about.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:about animated:YES];
        }
    }
}
//登录以后传过来一个值，用来通知用户已经登陆，需要刷新界面
-(void)backLoginDel:(NSString *)str{
    _loginStr = str;
    [_tableview reloadData];
}
//通知用户已经退出登陆，需要刷新页面
-(void)backTui:(NSString *)str{
    _loginStr = str;
    [_tableview reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
