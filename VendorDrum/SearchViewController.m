//
//  SearchViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/15.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchCell.h"
#import "ResultViewController.h"
@interface SearchViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UISearchBar *searchBar;
@property (nonatomic,strong)UIButton *searchButton;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *hotStr;
@property (nonatomic,strong)NSMutableArray *history;

@end

@implementation SearchViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    self.view.backgroundColor = [UIColor whiteColor];
    _hotStr = [[NSMutableArray alloc] initWithObjects:@"海飞丝",@"蒙牛", @"苏宁",@"爱尚家",@"你妹",@"好吃点",@"洗衣液",@"水果",@"早天下",@"老磨坊",@"煎饼",nil];
    _history = [[NSMutableArray alloc] initWithObjects:@"方便面",@"鲜花",@"牛肉烩面",@"沐浴乳", nil];
    //搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20,0, DEVICEWIDTH-40, 40)];
    _searchBar.delegate = self;
    _searchBar.searchBarStyle = UISearchBarStyleDefault;
    _searchBar.layer.masksToBounds = YES;
    _searchBar.layer.cornerRadius = 20;
    _searchBar.barTintColor = [UIColor whiteColor];
    _searchBar.placeholder = @"搜索门店和商品";
    _searchBar.keyboardType =  UIKeyboardTypeDefault;
    [_searchBar becomeFirstResponder];//成为第一响应者
    [_searchBar.layer setBorderWidth:1];
    [_searchBar.layer setBorderColor:[UIColor grayColor].CGColor];  //设置边框为白色
    //搜索按钮
    _searchButton = [[UIButton alloc] initWithFrame:CGRectMake(20+(DEVICEWIDTH-40)-(DEVICEWIDTH-40)/4,0, (DEVICEWIDTH-40)/4, 40)];
    [_searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    _searchButton.titleLabel.font = normalFontStyle;
    _searchButton.layer.cornerRadius = 20;
    _searchButton.backgroundColor = NavaCOLOR;
//    [_searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [_searchButton addTarget:self action:@selector(searchResult:) forControlEvents:UIControlEventTouchUpInside];
    //用来盛放按钮和搜索框的view
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0,80, DEVICEWIDTH, 40)];
    [searchView addSubview:_searchBar];
    [searchView addSubview:_searchButton];
//    _searchButton.hidden = YES;//隐藏button
    [self.view addSubview:searchView];
    //热门搜索和搜索历史
    _tableView= [[UITableView alloc] initWithFrame:CGRectMake(20, 125, DEVICEWIDTH-40, DEVICEHIGHT-125) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    //给界面添加一个手势  点击空白区域 移除键盘
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
}
//搜索框被编辑时
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    NSLog(@"1");
    return YES;
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"2");
}
//搜索框中的内容发生改变时 回调（即要搜索的内容改变）
- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
//    if (searchText.length == 0) {
//        _searchBar.frame = CGRectMake(40,0, DEVICEWIDTH-80, 40);
//        _searchButton.hidden = YES;
//    }
//    else{
//        _searchBar.frame = CGRectMake(40,0, DEVICEWIDTH-130, 40);
//        _searchButton.hidden = NO;
//    }
}
//拉取网络数据，刷新界面
-(void)getSearchData{

    [_searchBar resignFirstResponder];
   
}
//搜索按钮引发的搜索   需要当前经纬度作为参数
-(void)searchResult:(UIButton*)sender{
//    [self getSearchData];
    ResultViewController *result = [[ResultViewController alloc] init];
    [self.navigationController pushViewController:result animated:YES];
}
//点击键盘上的search按钮时调用
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
//    [self  getSearchData ];
    ResultViewController *result = [[ResultViewController alloc] init];
    [self.navigationController pushViewController:result animated:YES];

}
// 视图将要消失的时候，执行这个方法
-(void)viewWillDisappear:(BOOL)animated{
    [_searchBar resignFirstResponder];
}

#pragma mark -----tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    if (_history.count>0) {
        return 2;
    }else{
        return 1;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return _history.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 150;
    }else{
        return 30;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
        return 20.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        //显示商品类别的label
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 20)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 190, 20)];
        label.font = normalFontStyle;  //UILabel的字体大小
        label.textAlignment = NSTextAlignmentLeft;  //文本对齐方式
        [label setBackgroundColor:[UIColor clearColor]];
        label.text = @"热门商品";
        label.textColor = [UIColor colorWithRed:0.96 green:0.38 blue:0.42 alpha:1.00];
        [headerView setBackgroundColor:[UIColor whiteColor]];
        [headerView addSubview:label];
        return  headerView;
    }else{
        //显示商品类别的label
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 20)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 190, 20)];
        label.font = normalFontStyle;  //UILabel的字体大小
        label.textAlignment = NSTextAlignmentLeft;  //文本对齐方式
        [label setBackgroundColor:[UIColor clearColor]];
        label.text = @"搜索历史";
        [headerView setBackgroundColor:[UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.00]];
        [headerView addSubview:label];
        //删除按钮
        UIButton *btn  = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-70, 0, 20, 20)];
        btn.showsTouchWhenHighlighted = YES;
        [btn setBackgroundImage:[UIImage imageNamed:@"de"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(deleteHis) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:btn];
        return  headerView;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

static NSString *cellId = @"cell";
    SearchCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[SearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell backHotArr:_hotStr];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section==0) {
        NSLog(@"%@",cell.hotBtn.titleLabel.text);
    }else{
        cell.hisImage.image = [UIImage imageNamed:@"his"];
        cell.hisLab.text = [NSString stringWithFormat:@"%@",[_history objectAtIndex:indexPath.row]];
    }
    return cell;
}
//设置编辑状态
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    editingStyle = UITableViewCellEditingStyleDelete;//此处的EditingStyle可等于任意UITableViewCellEditingStyle，该行代码只在iOS8.0以前版本有作用，也可以不实现。
}
-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {//title可自已定义
        NSLog(@"%ld",(long)indexPath.row);
        [_history removeObjectAtIndex:indexPath.row];
        [_tableView reloadData];
    }];
    return @[deleteRoWAction];//最后返回这俩个RowAction 的数组
}
//手势隐藏键盘
-(void)viewTap:(UITapGestureRecognizer*)tap1
{
    [_searchBar resignFirstResponder];
 
}
-(void)deleteHis{

    _history = [[NSMutableArray alloc] init];
    [_tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
