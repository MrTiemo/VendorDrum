//
//  BuyViewController.m
//  VendorDrum_IOS
//
//  Created by 爱尚家 on 16/7/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "MainViewController.h"
#import "BuyTwoViewController.h"

@interface MainViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,SDCycleScrollViewDelegate>
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property (nonatomic,strong)UISearchBar *searchBar; ///<搜索框
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *sview; ///<头视图
@property(nonatomic,strong)NSMutableArray *arrType;
@property(nonatomic,strong)UIView *fview; ///<尾视图

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeView];
}
-(void)makeView{
    //    _arrType = [[NSMutableArray alloc] initWithObjects:@"供应商",@"新品上架",@"优惠券",@"拍立送", nil];
    //头视图
    _sview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 170)];
    _sview.backgroundColor = [UIColor whiteColor];
    //尾视图
    _fview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 30)];
    _fview.backgroundColor = [UIColor whiteColor];
    //滚动视图
    NSArray *imagesURLStrings = @[
                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                  ];
    // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
    _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 50, DEVICEWIDTH, 120) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    _cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    _cycleScrollView.imageURLStringsGroup = imagesURLStrings;
    //    _cycleScrollView.autoScroll = NO;//控制是否自动滚动，默认为YES
    [_sview addSubview:_cycleScrollView];
    [self search];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = _sview;
    _tableView.tableFooterView = _fview;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,DEVICEWIDTH, 30)];
    [btn setTitle:@"更多商品>>" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn addTarget:self action:@selector(allPro:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = normalFontStyle;
    [_fview addSubview:btn];
}
#pragma mark -- 搜索框
-(void)search{
    //搜索框初始化
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(20, 10, DEVICEWIDTH-40, 30)];
    _searchBar.delegate = self;
    _searchBar.layer.masksToBounds = YES;
    _searchBar.barTintColor = [UIColor whiteColor];
    _searchBar.placeholder = @"搜索门店和商品";
    _searchBar.keyboardType =  UIKeyboardTypeDefault;
    _searchBar.layer.cornerRadius = 15;
    [_searchBar.layer setBorderWidth:1];
    [_searchBar.layer setBorderColor:[UIColor grayColor].CGColor];  //设置边框为白色
    [_sview addSubview:_searchBar];
}
//搜索框被编辑时
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    SearchViewController *searchview=[[SearchViewController alloc]init];
    [searchview setHidesBottomBarWhenPushed:YES];//加上这句就可以把推出的ViewController隐藏Tabbar
    [self.navigationController pushViewController:searchview animated:YES];
    return NO;
}
#pragma mark -- Tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==3) {
        return 20;
    }else{
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return 150;
    }else if (indexPath.section==1){
        return 100;
    }else{
        return 100;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section>2) {
        //显示商品类别的label
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 30)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 190, 30)];
        label.font = normalFontStyle;  //UILabel的字体大小
        label.textAlignment = NSTextAlignmentLeft;  //文本对齐方式
        [label setBackgroundColor:[UIColor clearColor]];
        label.text = @"热销商品";
        [headerView setBackgroundColor:[UIColor whiteColor]];
        [headerView addSubview:label];
        return  headerView;
    }else{
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section>2) {
        return 30.0;
    }else{
        return 0.1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    MainTableCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[MainTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font =  normalFontStyle;
    cell.detailTextLabel.font = labelFontStyle;
    if (indexPath.section==0) {
        [cell.BuyBtn addTarget:self action:@selector(buy) forControlEvents:UIControlEventTouchUpInside];
        [cell.SellBtn addTarget:self action:@selector(sell) forControlEvents:UIControlEventTouchUpInside];
    }else if (indexPath.section==1){
        //        [cell backStr:_arrType ];
        NSLog(@"%ld",(long)cell.TypeBtn.tag);
    }else if (indexPath.section==2){
        cell.PosterIma.image = [UIImage imageNamed:@"guang"];
    }else{
        cell.PriceLab.text = @"¥ 100.00";
        cell.NameLab.text = @"产品名称";
        cell.Proimage.image = [UIImage imageNamed:@"ms"];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section>2) {
        DetailViewController *detal = [[DetailViewController alloc] init];
        detal.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detal animated:YES];
    }else if (indexPath.section==2){
        AdvertViewController *adver = [[AdvertViewController alloc] init];
        adver.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:adver animated:YES];
        //        [self.navigationController pushViewController:[NSClassFromString(@"AdvertViewController")new] animated:YES];
    }
}
#pragma mark --按钮点击事件
////点击选择位置的按钮
//-(void)Goaddress{
//    NSLog(@"点击了定位");
//}
-(void)buy{
    NSLog(@"买");
    BuyViewController *buyview = [[BuyViewController alloc] init];
    buyview.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:buyview animated:YES];
}
-(void)sell{
    NSLog(@"卖");
    SellViewController *sellview = [[SellViewController alloc] init];
    sellview.hidesBottomBarWhenPushed = YES;
    sellview.str = @"1";
    [self.navigationController pushViewController:sellview animated:YES];
    
}
-(void)allPro:(UIButton *)button{
    
    NSLog(@"%ld",(long)button.tag);
    BuyTwoViewController *buytwo = [[BuyTwoViewController alloc] init];
    buytwo.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:buytwo animated:YES];
    
}
#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    GunViewController *gun = [[GunViewController alloc] init];
    gun.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:gun animated:YES];
    
    //    [self.navigationController pushViewController:[NSClassFromString(@"GunViewController") new] animated:YES];
}
//#pragma mark - tableviewcell的动画加载效果
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CATransform3D rotation;
//    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.5, 0.7, 0.4);
//    rotation.m34 = 1.0/ -600;
//    
//    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
//    cell.layer.shadowOffset = CGSizeMake(10, 10);
//    cell.alpha = 0;
//    cell.layer.transform = rotation;
////    cell.layer.anchorPoint = CGPointMake(0, 0.5);不注释掉界面会出现偏差
//    
//    
//    [UIView beginAnimations:@"rotation" context:NULL];
//    [UIView setAnimationDuration:0.8];
//    cell.layer.transform = CATransform3DIdentity;
//    cell.alpha = 1;
//    cell.layer.shadowOffset = CGSizeMake(0, 0);
//    [UIView commitAnimations];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
