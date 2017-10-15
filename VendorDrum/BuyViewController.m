//
//  BuyViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/16.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "BuyViewController.h"
#import "BuyTwoViewController.h"
#import "BuyNextViewController.h"


@interface BuyViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *fl;

@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我要买";
    self.view.backgroundColor = [UIColor whiteColor];
    //
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH, 40)];
    label.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    label.text = @"   选择品类:";
    label.font = normalFontStyle;
    [self.view addSubview:label];
    //初始化布局类
    _fl = [[UICollectionViewFlowLayout alloc] init];
    //初始化collectionView
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 110, DEVICEWIDTH-20, DEVICEHIGHT) collectionViewLayout:_fl];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
#pragma mark -- 注册单元格
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    [self.view addSubview:_collectionView];
    
}
#pragma mark --UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 12;
}
//定义每个UICollectionView 的大小
- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath
{
    return CGSizeMake((DEVICEWIDTH-20)/4,(DEVICEWIDTH-20)/4);
}
//cell上下之间可以允许的最小间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10.0f;
}
//cell左右之间可以允许的最小间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0f;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //初始化每个单元格
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    //    cell.backgroundColor = [UIColor colorWithRed:0.96 green:0.38 blue:0.42 alpha:1.00];
    NSString *str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    UIImageView *imaview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height)];
    imaview.image = [UIImage imageNamed:str];
    [cell addSubview:imaview];
    //    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:str]];
    return cell;
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    if (indexPath.row==0) {
        //跳往下一级
        BuyNextViewController*buy = [[BuyNextViewController alloc] init];
        [self.navigationController pushViewController:buy animated:YES];
    }else{
        
        BuyTwoViewController*buy = [[BuyTwoViewController alloc] init];
        [self.navigationController pushViewController:buy animated:YES];
    }
}
//返回这个UICollectionViewCell是否可以被选择
-( BOOL )collectionView:( UICollectionView *)collectionView shouldSelectItemAtIndexPath:( NSIndexPath *)indexPath
{
    return YES ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
