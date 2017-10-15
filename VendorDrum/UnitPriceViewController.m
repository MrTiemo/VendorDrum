//
//  UnitPriceViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/16.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "UnitPriceViewController.h"
#import "ZJAlertListView.h"

@interface UnitPriceViewController ()<ZJAlertListViewDatasource,ZJAlertListViewDelegate>

@property (nonatomic,strong)UIButton    *btnSure;
@property (nonatomic,strong)UITextField *PriceText;
@property (nonatomic,strong)UITextField *NumText;
@property (nonatomic,strong)UIButton    *btnDan;
@property (nonatomic,strong)NSMutableArray *arrTui;//单位假数据
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;
@property (nonatomic,retain)ZJAlertListView *alertList;
@property (nonatomic)NSInteger TuiNum; //当前选择的数目

@end

@implementation UnitPriceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"货品单价";
    self.view.backgroundColor = [UIColor whiteColor];
    _arrTui = [[NSMutableArray alloc] initWithObjects:@"元/斤",@"元/千克",@"元/筐",@"元/个",@"元/条",@"元/袋",@"元/包", nil];
    _PriceText  = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, DEVICEWIDTH-120, 40)];
    _PriceText.font = normalFontStyle;
    _PriceText.placeholder = @"点这里填写价格";
    [self.view addSubview:_PriceText];
    //切换单位的按钮
    _btnDan = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-100, 100, 80, 40)];
    [_btnDan setTitleColor:[UIColor colorWithRed:0.99 green:0.57 blue:0.20 alpha:1.00] forState:UIControlStateNormal];
    [_btnDan setTitle:@"元/公斤▼" forState:UIControlStateNormal];
    _btnDan.titleLabel.font = normalFontStyle;
    [_btnDan addTarget:self action:@selector(xuanzhe) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnDan];
    
    UIView *viewY = [[UIView alloc] initWithFrame:CGRectMake(20, 140, DEVICEWIDTH-40, 1)];
    viewY.backgroundColor = [UIColor colorWithRed:0.81 green:0.81 blue:0.82 alpha:1.00];
    [self.view addSubview:viewY];
    
    _NumText = [[UITextField alloc] initWithFrame:CGRectMake(20, 150, DEVICEWIDTH-120, 40)];
    _NumText.placeholder = @"点这里写起批量";
    _NumText.font = normalFontStyle;
    [self.view addSubview:_NumText];
    
    UILabel *numlab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-100, 150, 80, 40)];
    numlab.text = @"公斤起批";
    numlab.textColor = [UIColor colorWithRed:0.99 green:0.57 blue:0.20 alpha:1.00];
    numlab.font = normalFontStyle;
    [self.view addSubview:numlab];
    
    
    UIView *viewX = [[UIView alloc] initWithFrame:CGRectMake(20, 190, DEVICEWIDTH-40, 1)];
    viewX.backgroundColor = [UIColor colorWithRed:0.81 green:0.81 blue:0.82 alpha:1.00];
    [self.view addSubview:viewX];
    
    //
    _btnSure = [[UIButton alloc] initWithFrame:CGRectMake(30, 220, DEVICEWIDTH-60, 40)];
    [_btnSure setTitle:@"确   定" forState:UIControlStateNormal];
    _btnSure.backgroundColor = [UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00];
    _btnSure.layer.cornerRadius = 20;
    _btnSure.titleLabel.font = titleFontStyle;
    [_btnSure addTarget:self action:@selector(backSure) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnSure];
}

#pragma mark -设置行数
- (NSInteger)alertListTableView:(ZJAlertListView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrTui.count;
}
- (UITableViewCell *)alertListTableView:(ZJAlertListView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableAlertListCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if ( self.selectedIndexPath && NSOrderedSame == [self.selectedIndexPath compare:indexPath])
    {
        cell.imageView.image = [UIImage imageNamed:@"checked"];
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"unchecked"];
    }
    cell.textLabel.font = labelFontStyle;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_arrTui[indexPath.row]];
    return cell;
}
- (void)alertListTableView:(ZJAlertListView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
- (void)alertListTableView:(ZJAlertListView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    UITableViewCell *cell = [tableView alertListCellForRowAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"checked"];
    NSLog(@"didSelectRowAtIndexPath:%ld", (long)indexPath.row);
}


//选择单位
-(void)xuanzhe{
    _alertList = [[ZJAlertListView alloc] initWithFrame:CGRectMake(0, 0, 250, 300)];
    _alertList.titleLabel.text = @"原因";
    _alertList.datasource = self;
    _alertList.delegate = self;
    __block UnitPriceViewController* bObject = self;
    //点击确定的时候，调用它去做点事情
    [_alertList setDoneButtonWithBlock:^{
        NSIndexPath *selectedIndexPath = bObject.selectedIndexPath;
        NSLog(@"%ld",(long)selectedIndexPath.row);
        _TuiNum = selectedIndexPath.row;
        [bObject quxiaoD];
        [bObject.alertList dismiss];
    }];
    [_alertList show];

}
-(void)quxiaoD{
    
    NSLog(@"%@",_arrTui[_TuiNum]);
    _btnDan.titleLabel.text = [NSString stringWithFormat:@"%@▼",_arrTui[_TuiNum]];
}
//点击确定
-(void)backSure{
    if (self.returnUuitPriceText!=nil) {
        self.returnUuitPriceText([NSString stringWithFormat:@"%@%@,起批量为%@",_PriceText.text,_arrTui[_TuiNum], _NumText.text]);
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)returnUnitPrice:(UnitPriceText)block{

    self.returnUuitPriceText = block;
}


@end
