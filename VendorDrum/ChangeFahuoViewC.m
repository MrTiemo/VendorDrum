//
//  ChangeFahuoViewC.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/12.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ChangeFahuoViewC.h"
#import "ChangeFahuoCell.h"
#import "TWSelectCityView.h"



@interface ChangeFahuoViewC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *arrLei;   ///<类型
@property (nonatomic,strong)NSMutableArray *arrUser;  ///<用户信息

@property (nonatomic,strong)NSString *strAddress;  ///<用户地址，精确到县

@end

@implementation ChangeFahuoViewC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"信息修改";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIView *footV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 80)];
    footV.backgroundColor = [UIColor whiteColor];
    _tableView.tableFooterView = footV;
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(40, 20, DEVICEWIDTH-80, 40)];
    btn.backgroundColor = [UIColor colorWithRed:0.17 green:0.67 blue:0.25 alpha:1.00];
    [btn setTitle:@"确认修改" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnXiugai) forControlEvents:UIControlEventTouchUpInside];
    btn.layer.cornerRadius = 20;
    [footV addSubview:btn];
    
    _arrLei = [[NSMutableArray alloc] initWithObjects:@"收货人",@"联系电话",@"收货地址",@"详细地址",@"备注", nil];
    _arrUser = [[NSMutableArray alloc] initWithObjects:@"呵呵哒",@"鬼知道",@"山大",@"1号楼",@"木有",nil];
    
    _strAddress = [NSString stringWithFormat:@"%@",[_arrUser objectAtIndex:2]];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    ChangeFahuoCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[ChangeFahuoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.labName.text = [NSString stringWithFormat:@"%@",[_arrLei objectAtIndex:indexPath.row]];
    if (indexPath.row==2) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.labAddress.text = _strAddress;
    }else{
        cell.textField.placeholder = [NSString stringWithFormat:@"%@",[_arrUser objectAtIndex:indexPath.row]];
        cell.textField.delegate = self;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==2) {
            //*************************************城市选择
            TWSelectCityView *city = [[TWSelectCityView alloc] initWithTWFrame:self.view.bounds TWselectCityTitle:@"选择地区"];
            //        __weak typeof(self)blockself = self;
            [city showCityView:^(NSString *proviceStr, NSString *cityStr, NSString *distr) {
                _strAddress = [NSString stringWithFormat:@" %@%@%@",proviceStr,cityStr,distr];
                [_tableView reloadData];
            }];
        
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
-(void)btnXiugai{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
