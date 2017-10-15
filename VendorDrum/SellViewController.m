//
//  SellViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/16.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "SellViewController.h"
#import "InputViewController.h"

@interface SellViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UICollectionViewFlowLayout *fl;
@end

@implementation SellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我要卖";
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@",_str);
    //
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH, 40)];
    label.backgroundColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1.00];
    label.text = @"   按照品类选择:";
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
    NSString *str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    UIImageView *imaview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, cell.bounds.size.height)];
    imaview.image = [UIImage imageNamed:str];
    [cell addSubview:imaview];
    return cell;
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-( void )collectionView:( UICollectionView *)collectionView didSelectItemAtIndexPath:( NSIndexPath *)indexPath
{
    if ([_str isEqual:@"1"]) {
        InputViewController *input =  [[InputViewController alloc] init];
        input.leixingStr = [NSString stringWithFormat:@"这是第%ld个类型",(long)indexPath.row];
        [self.navigationController pushViewController:input animated:YES];
    }else{
    
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"%ld",(long)indexPath.row);
    //block回调
    if (self.returnTextBlock != nil) {
        self.returnTextBlock([NSString stringWithFormat:@"这是第%ld个类型",(long)indexPath.row]);
    }
    }
}
- (void)returnText:(ReturnTextBlock)block {
    self.returnTextBlock = block;
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
