//
//  NewProViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/17.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "NewProViewController.h"
#import "SDCycleScrollView.h"
#import "NewProCell.h"
#import "GunViewController.h"

@interface NewProViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic,strong) UITableView       *tableView;
@property(nonatomic,strong)UIView *sview; //头视图
@end

@implementation NewProViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新品上架";
    self.view.backgroundColor = [UIColor whiteColor];
     //tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate   = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

static NSString *cellID = @"cell";
    NewProCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell==nil) {
        cell = [[NewProCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.imageV.image= [UIImage imageNamed:@"sg"];
    cell.labName.text= @"水果拼盘";
    cell.labPrice.text= @"13.00元";
    return cell;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
