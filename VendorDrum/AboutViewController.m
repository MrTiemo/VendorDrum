//
//  AboutViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/5.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *Arr;


@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于货郎鼓";
    self.view.backgroundColor = [UIColor whiteColor];
    //初始化数组
    _Arr = [[NSMutableArray alloc] initWithObjects:@"软件介绍",@"版权声明",@"许可协议",nil];
    
    UIView *viewH = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 150)];
    UIImageView *ima = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICEWIDTH-100)/2, 0, 100, 100)];
    ima.layer.cornerRadius = 10;
    ima.layer.masksToBounds = YES;
    ima.image = [UIImage imageNamed:@"HHH"];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, DEVICEWIDTH, 30)];
    lab.text = @"Version 1.0.0";
    lab.font=normalFontStyle;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor grayColor];
    [viewH addSubview:ima];
    [viewH addSubview:lab];
    //初始化tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = viewH;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _Arr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = normalFontStyle;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[_Arr objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
