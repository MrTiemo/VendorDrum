//
//  WelcomeViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/17.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "WelcomeViewController.h"
#import "SDCycleScrollView.h"
#import "LoginViewController.h"

@interface WelcomeViewController ()<SDCycleScrollViewDelegate>
@property(nonatomic,strong)SDCycleScrollView *scrollView;
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //滚动视图
    NSArray *imagesURLStrings = @[
                                  @"100",
                                  @"200",
                                  @"300"
                                  ];
    // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
//    _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) delegate:self placeholderImage:nil];
//    _scrollView.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
//    _scrollView.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    _scrollView.localizationImageNamesGroup = imagesURLStrings;
    _scrollView.autoScroll = NO;
    _scrollView.infiniteLoop = NO;
    _scrollView.showPageControl = NO;
    [self.view addSubview:_scrollView];
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{

    NSLog(@"%ld",(long)index);
    if (index==2) {
        APP_DELEGATE.window.rootViewController = [NSClassFromString(@"MainTabbar")new];
    }
}
/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
}

@end
