//
//  MarketDetailsViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/26.
//  Copyright © 2016年 爱尚家. All rights reserved.
//
#import "MarketDetailsViewController.h"
#import "LeftSelectScroll.h"
#import "MarketCell.h"
#import "ShoppingCartViewController.h"
#import "MerchantViewController.h"

@interface MarketDetailsViewController ()<LeftSelectScrollDelegate,UITableViewDataSource,UITableViewDelegate,StarRatingViewDelegate>
{
    LeftSelectScroll *leftScrollView; //左边的tableview
    UITableView *tableViewList;
    NSMutableArray *tableViewDataSource;
    BOOL isScrollSetSelect;     //当点击的时候 不去调用滑动调节
    UILabel         *_shopNumber;
}
@property (nonatomic,strong)UIButton *adverBtn;
@property (nonatomic,strong)UILabel  *gonggaoLab;
@property (nonatomic,strong)NSMutableArray  *leftArr;
@property (nonatomic,strong)UILabel  *allPrice;

//@property (nonatomic, strong) TQStarRatingView *starRatingView;

@end
@implementation MarketDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"店铺名称";
    //店铺公告
    _gonggaoLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH*3, 30)];
    _gonggaoLab.text = @"玛德智障： 这特么到底是一个什么东西，真服了，不行了，我死了快";
    _gonggaoLab.textAlignment = NSTextAlignmentCenter;
    _gonggaoLab.textColor = [UIColor whiteColor];
    _gonggaoLab.backgroundColor = [UIColor colorWithRed:0.99 green:0.57 blue:0.20 alpha:1.00];
    _gonggaoLab.font = normalFontStyle;
    [self.view addSubview:_gonggaoLab];
    //滚动动画
    [UIView beginAnimations:@"testAnimation" context:NULL];
    [UIView setAnimationDuration:10.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:999999];
    CGRect frame = _gonggaoLab.frame;
    _gonggaoLab.frame = frame;
    frame.origin.x = -DEVICEWIDTH*2;
    _gonggaoLab.frame = frame;
    [UIView commitAnimations];
    
    //店铺信息
    UIView *viewD = [[UIView alloc] initWithFrame:CGRectMake(0, 94, DEVICEWIDTH, 60)];
    viewD.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewD];
    //店铺图标
    UIImageView *imaV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    imaV.image = [UIImage imageNamed:@"sg"];
    imaV.layer.masksToBounds = YES;
    imaV.layer.cornerRadius = 20;
    [viewD addSubview:imaV];
    //店铺名字
    UILabel *labV = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 20)];
    //    labV.backgroundColor = [UIColor greenColor];
    labV.text = @"店铺一号";
    labV.font= labelFontStyle;
    [viewD addSubview:labV];
    //星星
//    _starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(60, 30, 60, 20) numberOfStar:kNUMBER_OF_STAR];
//    _starRatingView.delegate = self;
//    [_starRatingView setScore:4.0/5 withAnimation:YES];
//    [viewD addSubview:_starRatingView];
    //店铺星星评分
//    UILabel *labSTAR = [[UILabel alloc] initWithFrame:CGRectMake(130, 30, 20, 20)];
//    labSTAR.textColor = [UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00];
//    labSTAR.font = labelFontStyle;
//    labSTAR.text = @"4.0";
//    [viewD addSubview:labSTAR];
    //评价条数
//    UILabel *labPing = [[UILabel alloc] initWithFrame:CGRectMake(150, 30, 80, 20)];
//    labPing.font = labelFontStyle;
//    labPing.text = @"(23条评价)";
//    labPing.textColor = [UIColor grayColor];
//    [viewD addSubview:labPing];
    
    //右箭头
    UILabel *labJ = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-20, 20, 20, 20)];
    labJ.font = normalFontStyle;
    labJ.text = @">";
    labJ.textColor = [UIColor grayColor];
    [viewD addSubview:labJ];
    
    
    //给viewD添加一个透明button
    UIButton *btnD = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 60)];
    btnD.backgroundColor = [UIColor clearColor];
    [btnD addTarget:self action:@selector(gouXiang) forControlEvents:UIControlEventTouchUpInside];//跳往商户详细信息
    [viewD addSubview:btnD];
    [self initObjects];
    /////////////////
    _leftArr = [[NSMutableArray alloc] initWithObjects:@"蔬菜",@"海鲜",@"套餐",@"包子",nil];
    leftScrollView = [[LeftSelectScroll alloc]initWithFrame:CGRectMake(0, 154, DEVICEWIDTH/4, DEVICEHIGHT)];
    [leftScrollView setLeftSelectArray:nil];
    leftScrollView.leftSelectDelegate = self;
    [leftScrollView backarr:_leftArr];
    [self.view addSubview:leftScrollView];
    [self createTableView];
}
-(void)initObjects{
    
    isScrollSetSelect = NO;
}

-(void)createTableView{
    tableViewList = [[UITableView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(leftScrollView.frame), 154 , DEVICEWIDTH*0.75, DEVICEHIGHT - (154))];
    tableViewList.delegate = self;
    tableViewList.dataSource = self;
    [self.view addSubview:tableViewList];
    tableViewList.scrollEnabled = YES;
}
#pragma mark UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _leftArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 32;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (isScrollSetSelect == YES) {
        [leftScrollView setSelectButtonWithIndexPathSection:section];
    }
    return [self viewForHeaderView:section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    isScrollSetSelect = YES ;
}
//实际需要会修改
-(UIView*)viewForHeaderView:(NSInteger)parama{
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 32)];
    label.text = [NSString stringWithFormat:@"     %@",[_leftArr objectAtIndex:parama]];
    label.font = normalFontStyle;
    label.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    return label;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MarketCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"cell%zd%zd",indexPath.section,indexPath.row]];
    if (!cell) {
        
        cell = [[MarketCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"cell%zd%zd",indexPath.section,indexPath.row]];
    }
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.goodsImg.image = [UIImage imageNamed:@"sg"];
    cell.priceLab.text =[NSString stringWithFormat:@"¥%ld%ld.0",(long)indexPath.section,(long)indexPath.row];
    cell.oldPriceLab.font = labelFontStyle;
    cell.shouLab.text = @"(已售230件)";
    cell.titleLab.text = [NSString stringWithFormat:@"第%ld%ld号商品",(long)indexPath.section,(long)indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld%ld",(long)indexPath.section,(long)indexPath.row);
    
}
-(void)clickLeftSelectScrollButton:(NSInteger)indexPath{
    
    //判断数据为空 则return
    //    if (!tableViewDataSource) {
    //        return;
    //    }
    NSLog(@"%ld",(long)indexPath);
    isScrollSetSelect = NO;
    [tableViewList scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

-(void)gouXiang{

    MerchantViewController *mech = [[MerchantViewController alloc] init];
    [self.navigationController pushViewController:mech animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//视图将要消失
-(void)viewWillDisappear:(BOOL)animated{
    
    
    _gonggaoLab.frame =  CGRectMake(0, 64, DEVICEWIDTH, 30);
    
    
}

@end
