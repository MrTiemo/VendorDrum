//
//  DingDanViewController.m
//  ASJDemo
//
//  Created by 爱尚家 on 16/6/23.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "DingDanViewController.h"

@interface DingDanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation DingDanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单确认";
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 3;
    }else{
        
        return 2;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1) {
        return 30;

    }else{
    
        return 0.1;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section==1) {
        return @"请选择付款方式：";
    }else{
        return nil;
    }
}
//自定义sectionTitle的位置和样式
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *sectionTitle = [self tableView:tableView titleForHeaderInSection:section];
    if (sectionTitle == nil) {
        return nil;
    }
    // Create label with section title
    UILabel *label = [[UILabel alloc] init] ;
    label.frame = CGRectMake(10, 5, DEVICEWIDTH, 20);
    label.font =  [UIFont fontWithName:@"Arial" size: 15];
    label.textColor = [UIColor colorWithRed:1.00 green:0.48 blue:0.15 alpha:1.00];
    label.backgroundColor = [UIColor clearColor];
    label.text = sectionTitle;
    // Create header view and add label as a subview
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 5, DEVICEWIDTH, 20)];
    [view addSubview:label];
    view.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    return view;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.font =  [UIFont fontWithName:@"Arial" size: 15];
    if (indexPath.section==0) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row==0) {
            cell.textLabel.text = @"  订单编号：xxxxxxxxxxx";
        }else if (indexPath.row==1){
        cell.textLabel.text = @"  XX商品 2件  共100元";
        }else{
        cell.textLabel.text =@"  支付方式：在线支付  2016.7.5 12:00";
        }
    }else{
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xz"]];
        if (indexPath.row==0) {
            cell.imageView.image = [UIImage imageNamed:@"pay"];
            cell.textLabel.text = @"支 付 宝";
        }else{
            cell.imageView.image = [UIImage imageNamed:@"wei"];
            cell.textLabel.text = @"微    信";
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {

        
        if (indexPath.row==0) {
            
        }else{
        
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
