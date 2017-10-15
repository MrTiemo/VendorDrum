//
//  ResultViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/21.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ResultViewController.h"
#import "ResultCell.h"
@interface ResultViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,DOPDropDownMenuDataSource,DOPDropDownMenuDelegate>
@property (nonatomic,strong)UISearchBar *searchBar;
@property (nonatomic,strong)UIButton *searchButton;
@property (nonatomic,strong)UITableView *tableview;
@property (nonatomic,strong) DOPDropDownMenu *menu;
@property (nonatomic,strong) UILabel *resultLab;
@property (nonatomic,strong) UIButton *resultBtn;
@property (nonatomic)BOOL judge;

@property (nonatomic,strong) NSMutableArray *shopArr;
@property (nonatomic,strong) NSMutableArray *ProArr;


@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索结果";
    self.view.backgroundColor = [UIColor whiteColor];
    _judge = YES;
    _shopArr = [[NSMutableArray alloc] initWithObjects:@"默认(销量)",@"距离",@"访问量",@"运费",@"评价", nil];
    _ProArr = [[NSMutableArray alloc] initWithObjects:@"默认(销量)",@"价格升序啊",@"价格降序",@"距离", nil];
    //搜索框
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20,0, DEVICEWIDTH-40, 40)];
    _searchBar.delegate = self;
    _searchBar.searchBarStyle = UISearchBarStyleDefault;
    _searchBar.layer.masksToBounds = YES;
    _searchBar.layer.cornerRadius = 20;
    _searchBar.barTintColor = [UIColor whiteColor];
    _searchBar.placeholder = @"搜索门店和商品";
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
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 160, DEVICEWIDTH, DEVICEHIGHT-160) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    //上方的查看按钮和结果数量
    _resultBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3*2,130,DEVICEWIDTH/3, 30)];
    [_resultBtn setTitle:@"查看商品>>" forState:UIControlStateNormal];
    [_resultBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _resultBtn.titleLabel.font = labelFontStyle;
    _resultBtn.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    [_resultBtn addTarget:self action:@selector(changePro) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_resultBtn];
    
    _resultLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 130, DEVICEWIDTH/3, 30)];
    _resultLab.font = labelFontStyle;
    _resultLab.text = @"共3个门店，17个商品";
    _resultLab.textColor = [UIColor grayColor];
    _resultLab.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    _resultLab.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:_resultLab];
    
   
}
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu {
    return 1;
}
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    if (_judge) {
        return _shopArr.count;
        
    }else{
        return _ProArr.count;
    }
}
- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath {
    
    if (_judge) {
        return _shopArr[indexPath.row];
        
    }else{
        return _ProArr[indexPath.row];
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

    if (_judge) {
        return 300;

    }else{
        return 100;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.01f;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID = @"cell";
    ResultCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[ResultCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //店铺页面
    if (_judge) {
        //imageview
        cell.ShopIma.image = [UIImage imageNamed:@"qidong.jpg"];
        cell.ImaProThree.image = [UIImage imageNamed:@"sg"];
        cell.ImaProTwo.image = [UIImage imageNamed:@"sg"];
        cell.ImaProOne.image = [UIImage imageNamed:@"sg"];
        //label
        cell.ShopNum.text = @"访问量:1千    成交量:134单";
        cell.ShopPro.text = @"主营：白菜，茄子，土豆";
        cell.ShopAddress.text = @"宁阳县迪联物流3楼";
        cell.ShopName.text = @"杂货专卖店";
        
    }else{
        cell.priLabel.text = @"¥ 100.2";
        cell.ProLabel.text = @"这是一个商品的名字";
        cell.ProImage.image = [UIImage imageNamed:@"sg"];
    }
    return cell;
}
-(void)seaResult{
    NSLog(@"点击了搜索按钮");
   [_searchBar resignFirstResponder];//放弃第一响应者

}
-(void)changePro{
    if (_judge) {
        [_resultBtn setTitle:@"查看门店>>" forState:UIControlStateNormal];
        _resultLab.text = @"共17个商品,3个门店";
        _judge=NO;
        [_tableview reloadData];
        
    }else{
        [_resultBtn setTitle:@"查看商品>>" forState:UIControlStateNormal];
        _resultLab.text = @"共3个门店,17个商品";
        _judge=YES;
        [_tableview reloadData];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
