//
//  BuyNextOneViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/24.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "BuyNextOneViewController.h"
#import "BuyTwoViewController.h"


@interface BuyNextOneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation BuyNextOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我要买";
    self.view.backgroundColor = [UIColor whiteColor];
    //
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH, 40)];
    label.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    label.text = @"    选择品类:";
    label.font = normalFontStyle;
    [self.view addSubview:label];
    //
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 104, DEVICEWIDTH, DEVICEHIGHT-104) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = NO; //隐藏tableviewcell的分割线    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, DEVICEWIDTH, 38)];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = normalFontStyle;
    lab.text = @"三级分类";
    lab.backgroundColor = [UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00];
    lab.clipsToBounds = YES;//（iOS7以后需要设置）
    lab.layer.cornerRadius = 19;
    [cell addSubview:lab];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BuyTwoViewController*buy = [[BuyTwoViewController alloc] init];
    [self.navigationController pushViewController:buy animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
