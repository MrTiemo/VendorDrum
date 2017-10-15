//
//  DetailViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/16.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImage+ZLPhotoLib.h"
#import "ZLPhoto.h"
#import "UIButton+WebCache.h"
#import "detailCell.h"
#import "ShoppingCartViewController.h"
#import "PayViewController.h"
#import "MerchantViewController.h"

@interface DetailViewController () <ZLPhotoPickerBrowserViewControllerDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,StarRatingViewDelegate>
{
    UILabel         *_shopNumber;
    BOOL            change;
    ChoseView       *choseView;//弹出的视图View
    UIView *bgview;   //背景view
    CGPoint center;  //view的中心
}
@property (nonatomic , strong) NSMutableArray *assets;
@property (nonatomic , strong) NSMutableArray *photos;
@property (strong,  nonatomic) UIScrollView *scrollView;
@property (strong,  nonatomic) UIPageControl *pageControl;
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSMutableDictionary *dataDic;
@property (nonatomic , strong) UILabel  *allPrice;
@property (nonatomic , strong) NSString  *priceStr;

//@property (nonatomic, strong) TQStarRatingView *starRatingView;

@property (nonatomic, strong) UIButton *dianhuaBtn;//联系店家
@property (nonatomic, strong) UIButton *shoucangBtn;/// 收藏按钮
@property (nonatomic, strong) UIButton *addShopBtn;//  添加购物车
@property (nonatomic, strong) UIButton *lijiBtn;//  立即购买


@end
@implementation DetailViewController
- (NSMutableArray *)photos{
    if (!_photos) {
        NSArray *urls = @[
                          @"http://imgsrc.baidu.com/forum/w%3D580/sign=515dae6de7dde711e7d243fe97eecef4/6c236b600c3387446fc73114530fd9f9d72aa05b.jpg",
                          @"http://imgsrc.baidu.com/forum/w%3D580/sign=1875d6474334970a47731027a5cbd1c0/51e876094b36acaf9e7b88947ed98d1000e99cc2.jpg",
                          @"http://imgsrc.baidu.com/forum/w%3D580/sign=67ef9ea341166d223877159c76230945/e2f7f736afc3793138419f41e9c4b74543a911b7.jpg",
                          @"http://imgsrc.baidu.com/forum/w%3D580/sign=a18485594e086e066aa83f4332087b5a/4a110924ab18972bcd1a19a2e4cd7b899e510ab8.jpg",
                          @"http://imgsrc.baidu.com/forum/w%3D580/sign=42d17a169058d109c4e3a9bae159ccd0/61f5b2119313b07e550549600ed7912397dd8c21.jpg",
                          ];
        _photos = [NSMutableArray arrayWithCapacity:urls.count];
        for (NSString *url in urls) {
            ZLPhotoPickerBrowserPhoto *photo = [[ZLPhotoPickerBrowserPhoto alloc] init];
            photo.photoURL = [NSURL URLWithString:url];
            [_photos addObject:photo];
        }
        _assets = _photos.mutableCopy;
    }
    return _photos;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    bgview = [[UIView alloc] initWithFrame:self.view.bounds];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgview];

    change = YES;
    self.title = @"产品详情";
    // 初始化数据
    [self photos];
    //tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH, DEVICEHIGHT-120) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [bgview addSubview:_tableView];
    UIView *HeadView = [[UIView alloc] initWithFrame:CGRectMake(0,0, DEVICEWIDTH, 200)];
    HeadView.backgroundColor = [UIColor redColor];
    _tableView.tableHeaderView = HeadView;
    // 这个属性不能少
    self.automaticallyAdjustsScrollViewInsets = NO;
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.frame = CGRectMake(0, 0, DEVICEWIDTH, 200);
    //    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.scrollView.delegate = self;
    //设置取消触摸
    self.scrollView.canCancelContentTouches = NO;
    //设置滚动条类型
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    //是否自动裁切超出部分
    self.scrollView.clipsToBounds = YES;
    //设置是否可以缩放
    self.scrollView.scrollEnabled = YES;
    //设置是否可以进行画面切换
    self.scrollView.pagingEnabled = YES;
    //设置在拖拽的时候是否锁定其在水平或者垂直的方向
    self.scrollView.directionalLockEnabled = NO;
    //隐藏滚动条设置（水平、跟垂直方向）
    self.scrollView.alwaysBounceHorizontal = NO;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    [HeadView addSubview:_scrollView];
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0,180, DEVICEWIDTH, 10)];
    [HeadView addSubview:self.pageControl];
    //设置总页数
    self.pageControl.numberOfPages = _photos.count;
    //默认当前页为第一页
    self.pageControl.currentPage = 0;
    //为页码控制器设置标签
    self.pageControl.tag = 110;
    // 属性scrollView
    [self reloadScrollView];

    //底部购物车view
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, DEVICEHIGHT-44, DEVICEWIDTH, 44)];
    bottomView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    bottomView.userInteractionEnabled = YES;
    bottomView.clipsToBounds = NO;
    [bgview addSubview:bottomView];
    [bgview bringSubviewToFront:bottomView];
    
    UIView *shopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH/6, 44)];
    shopView.layer.borderWidth = 0.5;
    shopView.layer.borderColor=[UIColor grayColor].CGColor;
    [bottomView addSubview:shopView];
    
    UIImageView *shopCar = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, DEVICEWIDTH/6-20, 34)];
    shopCar.image = [UIImage imageNamed:@"s7"];
    shopCar.userInteractionEnabled = YES;
    //    shopCar.layer.borderWidth = 0.5;
    //    shopCar.layer.borderColor=[UIColor grayColor].CGColor;
    [shopView addSubview:shopCar];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(orderShop:)];
    [shopCar addGestureRecognizer:tap];
    
    //    _allPrice = [[UILabel alloc]initWithFrame:CGRectMake(70, 0,DEVICEWIDTH-180, 44)];
    //    _allPrice.text = @"¥ 0.0";
    //    _allPrice.font = normalFontStyle;
    //    _allPrice.textColor = [UIColor redColor];
    //    [bottomView addSubview:_allPrice];
    
    //购物车图标上边的数量红点
    _shopNumber = [[UILabel alloc]initWithFrame:CGRectMake(shopCar.bounds.size.width-10, -3, 14, 14)];
    _shopNumber.layer.cornerRadius = 7;
    _shopNumber.layer.masksToBounds = YES;
    _shopNumber.backgroundColor = [UIColor redColor];
    _shopNumber.textColor = [UIColor whiteColor];
    _shopNumber.text = @"0";
    _shopNumber.textAlignment = NSTextAlignmentCenter;
    _shopNumber.font = labelFontStyle;
    [shopCar addSubview:_shopNumber];
    
    //收藏按钮
    _shoucangBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/6,0, DEVICEWIDTH/6, 44)];
    _shoucangBtn.titleLabel.font = labelFontStyle;
    [_shoucangBtn setImage:[UIImage imageNamed:@"s1"] forState:UIControlStateNormal];
    _shoucangBtn.imageEdgeInsets = UIEdgeInsetsMake(0,10,10,-10);
    [_shoucangBtn setTitle:@"收藏"forState:UIControlStateNormal];//设置button的title
    _shoucangBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _shoucangBtn.titleEdgeInsets = UIEdgeInsetsMake(34,-_shoucangBtn.imageView.bounds.size.width,0,0);
    [_shoucangBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _shoucangBtn.layer.borderWidth = 0.5;
    _shoucangBtn.layer.borderColor=[UIColor grayColor].CGColor;
    [bottomView addSubview:_shoucangBtn];
    
    
    //加入购物车
    _addShopBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3,0, DEVICEWIDTH/6, 44)];
    _addShopBtn.titleLabel.font = labelFontStyle;
    _addShopBtn.titleLabel.numberOfLines = 0;
    [_addShopBtn setTitle:@"加入购物车"forState:UIControlStateNormal];//设置button的title
    _addShopBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_addShopBtn setTitleColor:[UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00] forState:UIControlStateNormal];
    _addShopBtn.layer.borderWidth = 0.5;
    [_addShopBtn addTarget:self action:@selector(dingShop:) forControlEvents:UIControlEventTouchUpInside];
    _addShopBtn.layer.borderColor=[UIColor grayColor].CGColor;
    [bottomView addSubview:_addShopBtn];
    //立即购买
    _lijiBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2,0, DEVICEWIDTH/6, 44)];
    _lijiBtn.titleLabel.font = labelFontStyle;
    [_lijiBtn setTitle:@"立即购买"forState:UIControlStateNormal];//设置button的title
    _lijiBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_lijiBtn setTitleColor:[UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00] forState:UIControlStateNormal];
    _lijiBtn.layer.borderWidth = 0.5;
    _lijiBtn.layer.borderColor=[UIColor grayColor].CGColor;
    [_lijiBtn addTarget:self action:@selector(dingShop:) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:_lijiBtn];
    //联系店家
    _dianhuaBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3*2,0, DEVICEWIDTH/3, 44)];
    _dianhuaBtn.titleLabel.font = labelFontStyle;
    _dianhuaBtn.backgroundColor = [UIColor colorWithRed:0.98 green:0.47 blue:0.13 alpha:1.00];
    [_dianhuaBtn setImage:[UIImage imageNamed:@"LianXi"] forState:UIControlStateNormal];
    _dianhuaBtn.imageEdgeInsets = UIEdgeInsetsMake(10,10,10,DEVICEWIDTH/3-34);
    [_dianhuaBtn setTitle:@"协商运费"forState:UIControlStateNormal];//设置button的title
    _dianhuaBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    _dianhuaBtn.titleEdgeInsets = UIEdgeInsetsMake(0,-10,0,0);
    [_dianhuaBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _dianhuaBtn.layer.borderWidth = 0.5;
    _dianhuaBtn.layer.borderColor=[UIColor grayColor].CGColor;
    [_dianhuaBtn addTarget:self action:@selector(dianhua) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:_dianhuaBtn];
    
    [self initChoseView];
}
/**
 *  初始化弹出视图
 */
-(void)initChoseView
{
    //选择数量和规格的视图
    choseView = [[ChoseView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:choseView];
    [choseView.bt_cancle addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [choseView.bt_sure addTarget:self action:@selector(dianhua) forControlEvents:UIControlEventTouchUpInside];
    [choseView.btShop addTarget:self action:@selector(goshop:) forControlEvents:UIControlEventTouchUpInside];
    //点击黑色透明视图choseView会消失
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [choseView.alphaiView addGestureRecognizer:tap];
    //点击图片放大图片
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showBigImage:)];
    choseView.img.userInteractionEnabled = YES;
    choseView.img.image = [UIImage imageNamed:@"sg"];
    [choseView.img addGestureRecognizer:tap1];
}
/**
 *  此处嵌入浏览图片代码
 */
-(void)showBigImage:(UITapGestureRecognizer *)tap
{
    NSLog(@"放大图片");
}
#pragma mark-----UIScrollViewDelegate---------
//实现协议UIScrollViewDelegate的方法，必须实现的
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //获取当前视图的宽度
    CGFloat pageWith = _scrollView.frame.size.width;
    //根据scrolView的左右滑动,对pageCotrol的当前指示器进行切换(设置currentPage)
    int page = floor((scrollView.contentOffset.x - pageWith/2)/pageWith)+1;
    //切换改变页码，小圆点
    self.pageControl.currentPage = page;
}
- (void)reloadScrollView{
    // 先移除，后添加
    [[self.scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSUInteger column = 1;
    NSUInteger assetCount = self.assets.count;
    CGFloat width = self.view.frame.size.width / column;
    for (NSInteger i = 0; i < assetCount; i++) {
        NSInteger row = i % column;
        NSInteger col = i / column;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        btn.frame = CGRectMake(width * col, row * width, width, 200);
        // UIButton
        if (i == self.assets.count){
        }else{
            // 如果是本地ZLPhotoAssets就从本地取，否则从网络取
            ZLPhotoPickerBrowserPhoto *photo = [self.assets objectAtIndex:i];
            if (photo != nil && [photo.asset isKindOfClass:[ZLPhotoAssets class]]) {
                [btn setImage:[photo.asset thumbImage] forState:UIControlStateNormal];
            }else{
                ZLPhotoPickerBrowserPhoto *photo = self.assets[i];
                [btn sd_setImageWithURL:photo.photoURL forState:UIControlStateNormal];
            }
            photo.toView = btn.imageView;
            btn.tag = i;
            btn.adjustsImageWhenHighlighted = NO;
            [btn addTarget:self action:@selector(tapBrowser:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self.scrollView addSubview:btn];
    }
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*5, CGRectGetMaxY([[self.scrollView.subviews lastObject] frame]));
}
- (void)tapBrowser:(UIButton *)btn{
    //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:btn.tag inSection:0];
    // 图片游览器
    ZLPhotoPickerBrowserViewController *pickerBrowser = [[ZLPhotoPickerBrowserViewController alloc] init];
    // 淡入淡出效果（根据实际情况来判断适不适用这种方式）
    pickerBrowser.status = UIViewAnimationAnimationStatusFade;
    // 数据源/delegate
    pickerBrowser.photos = _assets;
    // 当前选中的值
    pickerBrowser.currentIndex = btn.tag;
    // 展示控制器
    
    [pickerBrowser showPickerVc:self];
}
#pragma mark --- tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }else if (section==2){
        return 3;
    }
    else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2) {
        return 250;
    }else if(indexPath.section==0){
        if (indexPath.row==0) {
            return 80;
        }else {
            return 60;
        }
    }
    else{
        
        return 90;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.01;
    }else{
        return 30;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==1) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 30)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, DEVICEWIDTH, 20)];
        label.text = @"商品规格";
        label.textAlignment = NSTextAlignmentLeft;  //文本对齐方式
        [headerView setBackgroundColor:[UIColor clearColor]];
        [headerView addSubview:label];
        return  headerView;
    }else if (section==2){
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 30)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, DEVICEWIDTH, 20)];
        label.text = @"商品详情";
        label.textAlignment = NSTextAlignmentLeft;  //文本对齐方式
        [headerView setBackgroundColor:[UIColor clearColor]];
        [headerView addSubview:label];
        return  headerView;
    }else{
        return nil;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cell";
    detailCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[detailCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.nameLab.text = @"早天下西红柿";
            cell.priceLab.text = @"¥70.00";
            cell.kuLab.text = @"剩余库存:123";
            cell.oldPriceLab.text = @"预售";
            cell.yunLab.text = @"运费:电话协商";
        }else if (indexPath.row==1){
            cell.BiaoQianBtn.tag = 1001;
            
        }else{
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //右边的箭头
            //店铺图标
            UIImageView *imaV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
            imaV.image = [UIImage imageNamed:@"sg"];
            imaV.layer.cornerRadius = 20;
            imaV.layer.masksToBounds = YES;
            [cell addSubview:imaV];
            //店铺名字
            UILabel *labV = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 20)];
            //    labV.backgroundColor = [UIColor greenColor];
            labV.text = @"店铺一号";
            labV.font= labelFontStyle;
            [cell addSubview:labV];
            //星星
//            _starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(60, 30, 60, 20) numberOfStar:kNUMBER_OF_STAR];
//            _starRatingView.delegate = self;
            //    _starRatingView.tag = 1001;
//            [_starRatingView setScore:4.0/5 withAnimation:YES];
//            [cell addSubview:_starRatingView];
            //店铺星星评分
//            UILabel *labSTAR = [[UILabel alloc] initWithFrame:CGRectMake(130, 30, 20, 20)];
//            labSTAR.textColor = [UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00];
//            labSTAR.font = labelFontStyle;
//            labSTAR.text = @"4.0";
//            [cell addSubview:labSTAR];
            //评价条数
//            UILabel *labPing = [[UILabel alloc] initWithFrame:CGRectMake(150, 30, 80, 20)];
//            labPing.font = labelFontStyle;
//            labPing.text = @"(23条评价)";
//            labPing.textColor = [UIColor grayColor];
//            [cell addSubview:labPing];
            
        }
    }else if (indexPath.section==1){
        cell.MingLab.text = @"商品名称:";
        cell.mingLab.text = @"早天下西红柿1份 约2斤重";
        cell.PaiLab.text =  @"品   牌:";
        cell.paiLab.text = @"早天下";
        cell.ZhongLab.text = @"包装种类:";
        cell.zhongLab.text = @"盒";
        cell.NumLab.text = @"商品编号:";
        cell.numLab.text = @"34245367";
        cell.FanweiLab.text = @"配送范围:";
        cell.fanweiLab.text = @"宁阳县";
    }else{
        [cell.ImageBtn addTarget:self action:@selector(imgeBt:) forControlEvents:UIControlEventTouchUpInside];
        cell.ImageBtn.tag = indexPath.row+1;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==2) {
            MerchantViewController *mech = [[MerchantViewController alloc] init];
            [self.navigationController pushViewController:mech animated:YES];
        }
    }
}
//购物车角标动画
- (void)animationToShopNumber{
    CAKeyframeAnimation *key = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    key.values =  @[@(0.1),@(1.0),@(1.5)];
    key.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
    key.calculationMode = kCAAnimationLinear;
    [_shopNumber.layer addAnimation:key forKey:@"scale"];
}
//立即下单和加入购物车按钮
-(void)dingShop:(UIButton*)button{
    
    [UIView animateWithDuration: 0.35 animations: ^{
        bgview.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
        bgview.center = CGPointMake(self.view.center.x, self.view.center.y-50);
        choseView.center = self.view.center;
        choseView.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        choseView.stock = 20;
        choseView.nameLab.text = @"商品名称";
        choseView.jieshaoLab.text = @"商品介绍，商品介绍，商品介绍，商品介绍，商品介绍，";
        choseView.zuishaoLab.text = @"不支持低于100斤的订单";
        choseView.numLab.text = @"购买数量:";
        choseView.kuLab.text = @"库存:10000";
        choseView.allPriceLab.text = @"商品总价:";
        choseView.SurePriceLab.text = @"1234";
        choseView.shuomingLab.text = @"以上价格不包含运费，购买前请与供应商电话沟通具体运费详情";
        choseView.fahuoLab.text = @"发货方式:";
        [choseView.btShop setTitle:[NSString stringWithFormat:@"%@",button.titleLabel.text] forState:UIControlStateNormal];
    } completion: nil];
}
/**
 *  点击半透明部分或者取消按钮，弹出视图消失
 */
-(void)dismiss
{
    [choseView.numText resignFirstResponder];
    center.y = center.y+self.view.frame.size.height;
    [UIView animateWithDuration: 0.35 animations: ^{
        choseView.frame =CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
        bgview.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        bgview.center = self.view.center;
    } completion: nil];
}
//点击购物车图标去购物车
- (void)orderShop:(UITapGestureRecognizer *)tap{
    ShoppingCartViewController *shop = [[ShoppingCartViewController alloc] init];
    shop.Tstr = @"1";
    [self.navigationController pushViewController:shop animated:YES];
}
-(void)imgeBt:(UIButton *)button{
    NSLog(@"%ld",(long)button.tag);
    [imageShow showImage:button.imageView];
}

//点击联系商家按钮
-(void)dianhua{
    NSLog(@"拨打电话");
    //拨打电话
    UIWebView *callWebView = [[UIWebView alloc] init];
    NSURL *telURL = [NSURL URLWithString:@"tel:13671032152"];
    [callWebView loadRequest:[NSURLRequest requestWithURL:telURL]];
    [self.view addSubview:callWebView];
}
//加入购物车和立即购买
-(void)goshop:(UIButton *)button{
    if ([button.titleLabel.text  isEqual: @"加入购物车"]) {
        [choseView.numText resignFirstResponder];
        center.y = center.y+self.view.frame.size.height;
        [UIView animateWithDuration: 0.35 animations: ^{
            choseView.frame =CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
            bgview.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
            bgview.center = self.view.center;
        } completion: nil];
        _shopNumber.text = [NSString stringWithFormat:@"%d",_shopNumber.text.intValue+1];
        [self animationToShopNumber];
        
    }else{
        [choseView.numText resignFirstResponder];
        center.y = center.y+self.view.frame.size.height;
        [UIView animateWithDuration: 0.35 animations: ^{
            choseView.frame =CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
            bgview.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
            bgview.center = self.view.center;
        } completion: nil];
        PayViewController*pay = [[PayViewController alloc] init];
        [self.navigationController pushViewController:pay animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
