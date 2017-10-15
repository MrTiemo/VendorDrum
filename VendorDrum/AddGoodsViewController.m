//
//  AddGoodsViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/7.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "AddGoodsViewController.h"
#import "AddGoodsCell.h"

@interface AddGoodsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *arrNum;

@end

@implementation AddGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新增商品";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //自定义导航右按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(EndSure)];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _arrNum = [[NSMutableArray alloc] init];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 80;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    AddGoodsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[AddGoodsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (_arrNum.count==0) {
        cell.imageBtn.image = [UIImage imageNamed:@"unchecked"];
    }else{
        NSString *num = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        if ([_arrNum containsObject:num]) {
            cell.imageBtn.image = [UIImage imageNamed:@"checked"];
        }else{
            cell.imageBtn.image = [UIImage imageNamed:@"unchecked"];
        }
    }
    cell.imageV.image = [UIImage imageNamed:@"sg"];
    cell.labName.text = @"商品名称";
    cell.labPrice.text = @"22/斤";
    cell.labYun.text = @"运费：电话协商";
    cell.labTime.text = @"2016-2-12";
    cell.labYushou.text = @"8月中旬";
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_arrNum.count==0) {
        
        NSString *str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        [_arrNum addObject:str];
        [_tableView reloadData];
    }else{
        
        NSString *str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        if ([_arrNum containsObject:str]) {
            [_arrNum removeObject:str];
        }else{
            [_arrNum addObject:str];
        }
        [_tableView reloadData];
        
    }
}
-(void)EndSure{
    
    NSLog(@"%@",_arrNum);
    [_dele addProductArr:_arrNum];
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
