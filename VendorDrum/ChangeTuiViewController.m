//
//  ChangeTuiViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/12.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ChangeTuiViewController.h"
#import "ZJAlertListView.h"
#import "ChangeTuiCell.h"

@interface ChangeTuiViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,ZJAlertListViewDelegate,ZJAlertListViewDatasource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UILabel *reasonLab;    ///<退款原因
@property (nonatomic,strong)UILabel *leiLab; ///<服务类型
@property (nonatomic,strong)UITextField *priceLab;     ///<退款金额
@property (nonatomic, strong)UIButton *btnT; ///<提交申请按钮
@property (nonatomic,retain)ZJAlertListView *alertList;///<弹框选择
@property (nonatomic,strong)NSMutableArray *leiArr; ///<服务类型数组
@property (nonatomic,strong)NSMutableArray *arrPrice; ///<退款原因数组
@property (nonatomic,strong)NSMutableArray *arrTuiHuo; ///<换货原因数组
@property (nonatomic)NSInteger TuiNum;
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;
@property (nonatomic)NSInteger num;

@end

@implementation ChangeTuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"售后申请";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _leiArr    = [[NSMutableArray alloc] initWithObjects:@"退货退款",@"换货", nil];
    _arrPrice  = [[NSMutableArray alloc] initWithObjects:@"我不想买了",@"信息填写错误,重新下单",@"商家缺货",@"其他", nil];
    _arrTuiHuo = [[NSMutableArray alloc] initWithObjects:@"卖家发错货",@"包装/商品破损",@"质量问题",@"其他", nil];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    
    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 200)];
    foot.backgroundColor = [UIColor whiteColor];
    //
    _btnT = [[UIButton alloc] initWithFrame:CGRectMake(40, 60, DEVICEWIDTH-80, 40)];
    [_btnT setTitle:@"确认修改" forState:UIControlStateNormal];
    [_btnT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnT.backgroundColor = [UIColor colorWithRed:0.17 green:0.67 blue:0.25 alpha:1.00];
    [_btnT addTarget:self action:@selector(btnttt) forControlEvents:UIControlEventTouchUpInside];
    _btnT.layer.cornerRadius = 20;
    [foot addSubview:_btnT];
    _tableView.tableFooterView = foot;
    _leiLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 0, DEVICEWIDTH/3*2-40, 60)];
    _leiLab.font = labelFontStyle;
    _leiLab.textAlignment = NSTextAlignmentCenter;
    _leiLab.text = @"退货退款";
    
    _reasonLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 0, DEVICEWIDTH/3*2-40, 60)];
    _reasonLab.font = labelFontStyle;
    _reasonLab.textAlignment = NSTextAlignmentCenter;
    _reasonLab.text = @"选择退款原因";
    
    _priceLab = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 0, DEVICEWIDTH/3*2, 60)];
    _priceLab.font = labelFontStyle;
    _priceLab.textAlignment = NSTextAlignmentCenter;
    _priceLab.textColor = [UIColor redColor];
    _priceLab.delegate = self ;
    _priceLab.returnKeyType = UIReturnKeyDone;
    _priceLab.text = @"12";
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    ChangeTuiCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[ChangeTuiCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"申请服务",@"申请原因",@"售后金额", @"售后说明",nil];
    if (indexPath.row==0) {
        UILabel * xiaLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-40, 0, 30, 60)];
        xiaLab.text = @"V";
        xiaLab.font = labelFontStyle;
        [cell addSubview:xiaLab];
        [cell addSubview:_leiLab];
    }else if (indexPath.row==1){
        UILabel * xiaLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-40, 0, 30, 60)];
        xiaLab.text = @"V";
        xiaLab.font = labelFontStyle;
        [cell addSubview:xiaLab];
        [cell addSubview:_reasonLab];
    }else{
        [cell addSubview:_priceLab];
    }
    cell.viewBack.tag = 1001;
    cell.starLab.text = @"*";
    cell.fuwuLab.text = [NSString stringWithFormat:@"%@",arr[indexPath.row]];
    cell.viewLine.tag = 1001;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row<2) {
        _alertList = [[ZJAlertListView alloc] initWithFrame:CGRectMake(0, 0, 250, 300)];
        _alertList.titleLabel.text = @"原因";
        _alertList.datasource = self;
        _alertList.delegate = self;
        __block ChangeTuiViewController* bObject = self;
        //点击确定的时候，调用它去做点事情
        [_alertList setDoneButtonWithBlock:^{
            NSIndexPath *selectedIndexPath = bObject.selectedIndexPath;
            NSLog(@"%ld",(long)selectedIndexPath.row);
            _TuiNum = selectedIndexPath.row;
            if (_num==0) {
                bObject.leiLab.text = [NSString stringWithFormat:@"%@",bObject.leiArr[bObject.TuiNum]];
                if (bObject.leiLab.text.length>2) {
                    bObject.reasonLab.text = @"选择退款原因";
                    bObject.priceLab.text = @"¥12.00(不包含邮费)";
                }else{
                    bObject.reasonLab.text = @"选择换货原因";
                    bObject.priceLab.text = nil;
                }
            }else{
                if (bObject.leiLab.text.length>2) {
                    bObject.reasonLab.text = [NSString stringWithFormat:@"%@",bObject.arrPrice[bObject.TuiNum]];
                }else{
                    bObject.reasonLab.text = [NSString stringWithFormat:@"%@",bObject.arrTuiHuo[bObject.TuiNum]];
                }
            }
            [bObject.alertList dismiss];
        }];
        _num = indexPath.row;
        [_alertList show];
    }
}
#pragma mark -设置行数
- (NSInteger)alertListTableView:(ZJAlertListView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_num==0) {
        return 2;
    }else{
        return 4;
    }
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
    if (_num==0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",_leiArr[indexPath.row]];
        
    }else{
        
        if (_leiLab.text.length>2) {
            cell.textLabel.text = [NSString stringWithFormat:@"%@",_arrPrice[indexPath.row]];
        }else{
            cell.textLabel.text = [NSString stringWithFormat:@"%@",_arrTuiHuo[indexPath.row]];
        }
        
        
    }
    return cell;
}
- (void)alertListTableView:(ZJAlertListView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPat{
    
    
}
- (void)alertListTableView:(ZJAlertListView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    UITableViewCell *cell = [tableView alertListCellForRowAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"checked"];
    NSLog(@"didSelectRowAtIndexPath:%ld", (long)indexPath.row);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
    
}
-(void)btnttt{
    
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}
@end
