//
//  SpecificViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "SpecificViewController.h"
#import "SpecificCell.h"


@interface SpecificViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation SpecificViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"余额明细";
    self.view.backgroundColor = [UIColor whiteColor];
    //初始化tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    SpecificCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[SpecificCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.labWhy.text = @"购物";
    cell.labDing.text = @"(订单3425637897支付)";
    cell.labTime.text = @"2016-12-3    16:23:32";
    
    if (indexPath.row % 2 == 0) {
        cell.labPrice.text = @"- 56.00";
        cell.labPrice.textColor = NavaCOLOR;
    }else{
        cell.labPrice.text = @"+ 5.60";
        cell.labPrice.textColor = [UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
