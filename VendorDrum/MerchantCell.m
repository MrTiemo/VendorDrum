//
//  MerchantCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/15.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "MerchantCell.h"
//#import "UIImage+ZLPhotoLib.h"
#import "ZLPhoto.h"
#import "MarketDetailsViewController.h"


@interface MerchantCell ()<StarRatingViewDelegate,ZLPhotoPickerBrowserViewControllerDelegate>
@property (nonatomic , strong) NSMutableArray *photos;
@end

@implementation MerchantCell
#pragma mark ----------- 商铺信息


-(UIImageView *)HeadImageView{
    if (_HeadImageView == nil) {
        _HeadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2-35, 20, 70, 70)];
        _HeadImageView.layer.cornerRadius = 35;
        _HeadImageView.layer.masksToBounds = YES;
        [self addSubview:_HeadImageView];
    }
    return _HeadImageView;
}
-(UIButton *)scBtn{
    if (_scBtn == nil) {
        _scBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-30, 20, 20,20)];
        [_scBtn setBackgroundImage:[UIImage imageNamed:@"s1"] forState:UIControlStateNormal];
        _scBtn.layer.cornerRadius = 10;
        _scBtn.backgroundColor = [UIColor colorWithRed:0.29 green:0.13 blue:0.13 alpha:1.00];
        [self addSubview:_scBtn];
    }
    return _scBtn;
}
-(UILabel *)AddressLab{
    if (_AddressLab == nil) {
        _AddressLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, DEVICEWIDTH, 20)];
        _AddressLab.font = labelFontStyle;
        _AddressLab.textColor = [UIColor whiteColor];
        _AddressLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_AddressLab];
    }
    return _AddressLab;
}

-(UILabel *)ZhuYingLab{
    if (_ZhuYingLab == nil) {
        _ZhuYingLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, DEVICEWIDTH, 20)];
        _ZhuYingLab.font = labelFontStyle;
        _ZhuYingLab.textColor = [UIColor whiteColor];
        _ZhuYingLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_ZhuYingLab];
    }
    return _ZhuYingLab;
}

-(UILabel *)TimeLab{
    if (_TimeLab == nil) {
        _TimeLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, DEVICEWIDTH/3, 20)];
        _TimeLab.font = normalFontStyle;
        _TimeLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_TimeLab];
    }
    return _TimeLab;
}
-(UILabel *)DanLab{
    if (_DanLab == nil) {
        _DanLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 5, DEVICEWIDTH/3, 20)];
        _DanLab.font = normalFontStyle;
        _DanLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_DanLab];
    }
    return _DanLab;
}
-(UILabel *)ShouLab{
    if (_ShouLab == nil) {
        _ShouLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3*2, 5, DEVICEWIDTH/3, 20)];
        _ShouLab.font = normalFontStyle;
        _ShouLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_ShouLab];
    }
    return _ShouLab;
}
-(UILabel *)timeLab{
    if (_timeLab == nil) {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, DEVICEWIDTH/3, 20)];
        _timeLab.font = labelFontStyle;
        _timeLab.textColor = [UIColor grayColor];
        _timeLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_timeLab];
    }
    return _timeLab;
}
-(UILabel *)danLab{
    if (_danLab == nil) {
        _danLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 25, DEVICEWIDTH/3, 20)];
        _danLab.font = labelFontStyle;
        _danLab.textColor = [UIColor grayColor];
        _danLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_danLab];
    }
    return _danLab;
}
-(UILabel *)shouLab{
    if (_shouLab == nil) {
        _shouLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3*2, 25, DEVICEWIDTH/3, 20)];
        _shouLab.font = labelFontStyle;
        _shouLab.textColor = [UIColor grayColor];
        _shouLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_shouLab];
    }
    return _shouLab;
}

#pragma mark ----------- 信誉评价

-(UILabel *)XinYuLab{
    if (_XinYuLab == nil) {
        _XinYuLab = [[UILabel alloc] initWithFrame:CGRectMake(10,0,60,60)];
        _XinYuLab.font = normalFontStyle;
        _XinYuLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_XinYuLab];
    }
    return _XinYuLab;
}
//-(TQStarRatingView*)starRatingView{
//    
//    if (_starRatingView == nil) {
//        _starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(80,20,60,20)];
//        _starRatingView.delegate = self;
//        _starRatingView.userInteractionEnabled = NO;
//        [self addSubview:_starRatingView];
//    }
//    return _starRatingView;
//}
-(UILabel *)numXinLab{
    if (_numXinLab == nil) {
        _numXinLab = [[UILabel alloc] initWithFrame:CGRectMake(150,0,20,60)];
        _numXinLab.font = labelFontStyle;
        _numXinLab.textColor = [UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00];
        [self addSubview:_numXinLab];
    }
    return _numXinLab;
}
-(UILabel *)PingLab{
    if (_PingLab == nil) {
        _PingLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-100,0,60,60)];
        _PingLab.font = labelFontStyle;
        _PingLab.textColor = [UIColor grayColor];
        _PingLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:_PingLab];
    }
    return _PingLab;
}
#pragma mark ----------- 店铺展示

-(UILabel *)ZhanLab{
    if (_ZhanLab == nil) {
        _ZhanLab = [[UILabel alloc] initWithFrame:CGRectMake(10,10,200,30)];
        _ZhanLab.font = normalFontStyle;
        _ZhanLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_ZhanLab];
    }
    return _ZhanLab;
}
-(UILabel *)JieShaoLab{
    if (_JieShaoLab == nil) {
        _JieShaoLab = [[UILabel alloc] initWithFrame:CGRectMake(30,50,DEVICEWIDTH-60,50)];
        _JieShaoLab.font = labelFontStyle;
        _JieShaoLab.textColor = [UIColor grayColor];
        _JieShaoLab.numberOfLines = 0;
        [self addSubview:_JieShaoLab];
    }
    return _JieShaoLab;
}


-(UIButton *)zhanBtn{
    if (_zhanBtn == nil) {
        
        for (int i=0; i<4; i++) {
            _zhanBtn = [[UIButton alloc] initWithFrame:CGRectMake(10*i+(_zhanBtn.bounds.size.width)*i+30, 110, (DEVICEWIDTH-90)/4,(DEVICEWIDTH-90)/4)];
            _zhanBtn.tag = i;
            [_zhanBtn setBackgroundImage:[UIImage imageNamed:@"sg"] forState:UIControlStateNormal];
            _zhanBtn.adjustsImageWhenHighlighted = NO;
            [_zhanBtn addTarget:self action:@selector(zhanshi:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_zhanBtn];
        }
    }
    return _zhanBtn;
}
#pragma mark ----------- 商品信息
-(UILabel *)ShangPinLab{
    if (_ShangPinLab == nil) {
        _ShangPinLab = [[UILabel alloc] initWithFrame:CGRectMake(10,10,100,30)];
        _ShangPinLab.font = normalFontStyle;
        _ShangPinLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_ShangPinLab];
    }
    return _ShangPinLab;
}
-(UILabel *)GoBtn{
    if (_GoBtn == nil) {
        _GoBtn = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-80,10,60,30)];
        _GoBtn.font = labelFontStyle;
        _GoBtn.textColor = [UIColor grayColor];
        [self addSubview:_GoBtn];
    }
    return _GoBtn;
}

-(UIButton *)Product{
    if (_Product == nil) {
        for (int i=0; i<4; i++) {
            _Product = [[UIButton alloc] initWithFrame:CGRectMake(10*i+(_Product.bounds.size.width)*i+30, 50, (DEVICEWIDTH-90)/4,(DEVICEWIDTH-90)/4)];
            _Product.tag = i+1;
            [_Product setBackgroundImage:[UIImage imageNamed:@"sg"] forState:UIControlStateNormal];
            _Product.adjustsImageWhenHighlighted = NO;
            [_Product addTarget:self action:@selector(GoBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_Product];
        }
    }
    return _Product;
}

-(void)zhanshi:(UIButton *)btn{
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
    //    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:btn.tag inSection:0];
    // 图片游览器
    ZLPhotoPickerBrowserViewController *pickerBrowser = [[ZLPhotoPickerBrowserViewController alloc] init];
    // 淡入淡出效果
    // pickerBrowser.status = UIViewAnimationAnimationStatusFade;
    // 数据源/delegate
    pickerBrowser.photos = _photos;
    // 当前选中的值
    pickerBrowser.currentIndex = btn.tag;
    // 展示控制器
    [pickerBrowser showPickerVc:[self viewController]];
}
-(void)GoBtn:(UIButton *)button{
    
    NSLog(@"去店铺");
    MarketDetailsViewController *mark = [[MarketDetailsViewController alloc] init];
    [[self viewController].navigationController pushViewController:mark animated:YES];
    
}
//定义当前视图
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
