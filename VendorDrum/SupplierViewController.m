//
//  SupplierViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/17.
//  Copyright © 2016年 爱尚家. All rights reserved.
//
#import "SupplierViewController.h"
#import "SupplierCell.h"
#import "MarketDetailsViewController.h"
@interface SupplierViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>
@property (nonatomic,strong)UISearchBar *searchBar;
@property (nonatomic,strong)UIButton *searchButton;
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong) DOPDropDownMenu *menu;
@property (nonatomic,strong) DOPDropDownMenu *menuTwo;

@property (nonatomic,strong) NSMutableArray *shopArr;
@property (nonatomic,strong) NSMutableArray *aarr;


@end

@implementation SupplierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"供应商";
    self.view.backgroundColor = [UIColor whiteColor];
    _shopArr = [[NSMutableArray alloc] initWithObjects:@"默认(销量)",@"距离",@"访问量",@"运费",@"评价", nil];
    _aarr = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    //搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20,0, DEVICEWIDTH-40, 40)];
    _searchBar.delegate = self;
    _searchBar.searchBarStyle = UISearchBarStyleDefault;
    _searchBar.layer.masksToBounds = YES;
    _searchBar.layer.cornerRadius = 20;
    _searchBar.barTintColor = [UIColor whiteColor];
    _searchBar.placeholder = @"搜索门店";
    _searchBar.keyboardType =  UIKeyboardTypeDefault;
    [_searchBar.layer setBorderWidth:1];
    [_searchBar.layer setBorderColor:[UIColor grayColor].CGColor];  //设置边框为白色
    //搜索按钮
    _searchButton = [[UIButton alloc] initWithFrame:CGRectMake(20+(DEVICEWIDTH-40)-(DEVICEWIDTH-40)/4,0, (DEVICEWIDTH-40)/4, 40)];
    [_searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    _searchButton.titleLabel.font = normalFontStyle;
    _searchButton.layer.cornerRadius = 20;
    _searchButton.backgroundColor = NavaCOLOR;
    [_searchButton addTarget:self action:@selector(seaResult) forControlEvents:UIControlEventTouchUpInside];
    //用来盛放按钮和搜索框的view
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0,80, DEVICEWIDTH, 40)];
    [searchView addSubview:_searchBar];
    [searchView addSubview:_searchButton];
    //    _searchButton.hidden = YES;//隐藏button
    [self.view addSubview:searchView];
    //
    _menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 130) andHeight:30];
    _menu.dataSource = self;
    _menu.delegate = self;
    [self.view addSubview:_menu];
    
    //
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 130, DEVICEWIDTH/3, 30)];
    backView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    [self.view addSubview:backView];
    //
    _menuTwo = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(DEVICEWIDTH/3*2, 130) andHeight:30];
    _menuTwo.dataSource = self;
    _menuTwo.delegate = self;
    [self.view addSubview:_menuTwo];
    //
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 160, DEVICEWIDTH, DEVICEHIGHT-160) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
}
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu {
    return 1;
}
- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath {
    float x = menu.frame.origin.x;
    if (x>0) {
        return _aarr[indexPath.row];
    }else{
        return _shopArr[indexPath.row];
    }
}
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column {

    float x = menu.frame.origin.x;
    if (x>0) {
        return _aarr.count;
    }else{
        return _shopArr.count;
    }
}
- (void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath {
    
    NSLog(@"column:%li row:%li", (long)indexPath.column, (long)indexPath.row);
    NSLog(@"%@",[menu titleForRowAtIndexPath:indexPath]);
}
#pragma mark ----tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return 300;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01f;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    SupplierCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[SupplierCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //店铺页面
        //imageview
        cell.ShopIma.image = [UIImage imageNamed:@"ms"];
        cell.ImaProThree.image = [UIImage imageNamed:@"sg"];
        cell.ImaProTwo.image = [UIImage imageNamed:@"ms"];
        cell.ImaProOne.image = [UIImage imageNamed:@"sg"];
        //label
        cell.ShopNum.text = @"访问量:1千    成交量:134单";
        cell.ShopPro.text = @"主营：白菜，茄子，土豆";
        cell.ShopAddress.text = @"宁阳县迪联物流3楼";
        cell.ShopName.text = @"杂货专卖店";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    MarketDetailsViewController*mark = [[MarketDetailsViewController alloc] init];
    mark.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mark animated:YES];
}
-(void)seaResult{
    NSLog(@"点击了搜索按钮");
    [_searchBar resignFirstResponder];//放弃第一响应者
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

