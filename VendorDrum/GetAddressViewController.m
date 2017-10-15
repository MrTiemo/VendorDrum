//
//  GetAddressViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/29.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "GetAddressViewController.h"
#import "PayViewController.h"
@interface GetAddressViewController ()<UITableViewDelegate,UITableViewDataSource,addressDele>
@property (strong ,nonatomic )UITableView *tableView;
@property (strong ,nonatomic )NSMutableArray *array;
@end
@implementation GetAddressViewController
@synthesize deleGate =_deleGate;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"地址列表";
    self.view.backgroundColor = [UIColor whiteColor];
    //设置按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"xinzeng"] style:UIBarButtonItemStyleDone target:self action:@selector(addressAdd)];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,DEVICEWIDTH , DEVICEHIGHT) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _array = [[NSMutableArray alloc] init];
    [self.view addSubview:_tableView];
}
//新建地址
-(void)addressAdd{
    NewAddressViewController *newa = [[NewAddressViewController alloc] init];
    newa.dele = self;
    [self.navigationController pushViewController:newa  animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.font = normalFontStyle;
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.numberOfLines = 0;        //不要忘记设置这个
    [cell.textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    cell.textLabel.text = [NSString stringWithFormat:@"联系人:%@  电话:%@ \n地址:%@%@",_array[indexPath.row][@"Person"],_array[indexPath.row][@"Phone"],_array[indexPath.row][@"Address"],_array[indexPath.row][@"address"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.deleGate Getbackadd:[_array objectAtIndex:indexPath.row]];
    [self.navigationController popViewControllerAnimated:YES];
}
//设置编辑状态
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    editingStyle = UITableViewCellEditingStyleDelete;
    //此处的EditingStyle可等于任意UITableViewCellEditingStyle，该行代码只在iOS8.0以前版本有作用，也可以不实现。
}
-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {//title可自已定义
        NSLog(@"%ld",(long)indexPath.row);
        [_array removeObjectAtIndex:indexPath.row];
        [_tableView reloadData];
    }];
    return @[deleteRoWAction];//最后返回这俩个RowAction 的数组
}

//下个界面返回的输入的信息
-(void)AddressBack:(NSMutableDictionary *)sender{
    
    NSLog(@"%@",sender);
    [_array addObject:sender];
    [_tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
