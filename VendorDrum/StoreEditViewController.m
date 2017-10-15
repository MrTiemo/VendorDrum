//
//  StoreEditViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/7.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "StoreEditViewController.h"
#import "StoreEditCell.h"
#import "ZJAlertListView.h"
#import "TWSelectCityView.h"
#import "UIImage+ZLPhotoLib.h"
#import "ZLPhoto.h"


@interface StoreEditViewController ()<UITableViewDelegate,UITableViewDataSource,ZJAlertListViewDelegate,ZJAlertListViewDatasource,ZLPhotoPickerBrowserViewControllerDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,retain)ZJAlertListView *alertList;
@property (nonatomic,strong) NSMutableArray *arrLei;      ///<分类数组
@property (nonatomic,strong) NSIndexPath *selectedIndexPath;  ///<
@property (nonatomic,strong)NSString *strLX; ///<类型的名称
@property (nonatomic,strong)NSString *strDZ; ///<商家地址

@property (nonatomic, strong) UIScrollView   *scrollView;

@property (nonatomic, strong)NSMutableArray *arrImage; ///<图片数组

@property (nonatomic, strong)NSMutableArray *arrName; ///<需要填写的类型的名字


@end

@implementation StoreEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"店铺信息";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //新增右按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(endBJ)];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH, DEVICEHIGHT-64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _arrLei = [[NSMutableArray alloc] initWithObjects:@"类型1",@"类型2",@"类型3",@"类型4",@"类型5",@"类型6",nil];
    _arrName = [[NSMutableArray alloc] initWithObjects:@"店铺名",@"店主姓名",@"联系电话",@"地址",@"店铺分类",@"经营类目",@"公告",@"简介", nil];
    //footerview
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 200)];
    footView.backgroundColor = [UIColor whiteColor];
    _tableView.tableFooterView = footView;
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.frame = CGRectMake(10, 40,DEVICEWIDTH-20, 160);
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [footView addSubview:_scrollView];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 5,100, 30)];
    lab.text = @"门店详细:";
    lab.font = normalFontStyle;
    [footView addSubview:lab];
    UILabel *labe = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, DEVICEWIDTH-110, 30)];
    labe.text = @"上传5张图片，通过审核认证，会吸引更多顾客";
    labe.font = labelFontStyle;
    labe.textColor = [UIColor grayColor];
    labe.numberOfLines = 0;
    [footView addSubview:labe];
    
    _arrImage = [[NSMutableArray alloc] init];
    // 这个属性不能少
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 九宫格创建ScrollView
    [self reloadScrollView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 8;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row>5) {
        return 80;
    }
    return 40;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cell";
    StoreEditCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[StoreEditCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row<6) {
        if (indexPath.row==3) {
            cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
            cell.LabelA.text = [NSString stringWithFormat:@"%@",[_arrName objectAtIndex:indexPath.row]];
            cell.labDZ.text = _strDZ;
            
        }else if (indexPath.row==4){
            cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
            cell.LabelA.text = [NSString stringWithFormat:@"%@",[_arrName objectAtIndex:indexPath.row]];
            cell.labLX.text = _strLX;
            
        }else{
            cell.LabelA.text = [NSString stringWithFormat:@"%@",[_arrName objectAtIndex:indexPath.row]];
            cell.textA.placeholder = @"测试名称";
        }
    }else{
        cell.LabelB.text = [NSString stringWithFormat:@"%@",[_arrName objectAtIndex:indexPath.row]];
        cell.textB.placeholder = @"测试名称";
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row==4) {
        _alertList = [[ZJAlertListView alloc] initWithFrame:CGRectMake(0, 0, 250, 300)];
        _alertList.titleLabel.text = @"原因";
        _alertList.datasource = self;
        _alertList.delegate = self;
        __block StoreEditViewController* bObject = self;
        //点击确定的时候，调用它去做点事情
        [_alertList setDoneButtonWithBlock:^{
            NSIndexPath *selectedIndexPath = bObject.selectedIndexPath;
            NSLog(@"%ld",(long)selectedIndexPath.row);
            _strLX = [NSString stringWithFormat:@"%@",[_arrLei objectAtIndex:(long)selectedIndexPath.row]];
            [bObject.alertList dismiss];
            [bObject.tableView reloadData];
        }];
        [_alertList show];
    }else if (indexPath.row==3){
        //*************************************城市选择
        TWSelectCityView *city = [[TWSelectCityView alloc] initWithTWFrame:self.view.bounds TWselectCityTitle:@"选择地区"];
        //        __weak typeof(self)blockself = self;
        [city showCityView:^(NSString *proviceStr, NSString *cityStr, NSString *distr) {
            _strDZ = [NSString stringWithFormat:@" %@%@%@",proviceStr,cityStr,distr];
            [_tableView reloadData];
        }];
    }
}
#pragma mark ---＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊ scrollview设置和添加照片＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

- (void)reloadScrollView{
    // 先移除，后添加
    [[self.scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSUInteger column = 5;
    // 加一是为了有个添加button
    NSUInteger assetCount = self.arrImage.count + 1;
    CGFloat width = self.view.frame.size.width / column;
    
    for (NSInteger i = 0; i < assetCount; i++) {
        
        NSInteger row = i / column;
        NSInteger col = i % column;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor=[UIColor grayColor].CGColor;
        btn.frame = CGRectMake(width * col, row * width, width, width);
        // UIButton
        if (i == self.arrImage.count){
            // 最后一个Button
            [btn setImage:[UIImage ml_imageFromBundleNamed:@"threeIma"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(photoSelectet) forControlEvents:UIControlEventTouchUpInside];
        }else{
            // 如果是本地ZLPhotoAssets就从本地取，否则从网络取
            if ([[self.arrImage objectAtIndex:i] isKindOfClass:[ZLPhotoAssets class]]) {
                NSMutableArray *arr = [[NSMutableArray alloc] init];
                arr = self.arrImage;
                [btn setImage:[self.arrImage[i] thumbImage] forState:UIControlStateNormal];
                //                [btn addTarget:self action:@selector(shouimage:) forControlEvents:UIControlEventTouchUpInside];
            }else if ([[self.arrImage objectAtIndex:i] isKindOfClass:[UIImage class]]){
                [btn setImage:self.arrImage[i] forState:UIControlStateNormal];
                //                [btn addTarget:self action:@selector(shouimage:) forControlEvents:UIControlEventTouchUpInside];
                
            }
            btn.tag = i;
        }
        
        [self.scrollView addSubview:btn];
    }
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY([[self.scrollView.subviews lastObject] frame]));
}

#pragma mark - 选择图片
- (void)photoSelectet{
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    // MaxCount, Default = 9
    pickerVc.maxCount = 3;
    // Jump AssetsVc
    pickerVc.status = PickerViewShowStatusCameraRoll;
    // Filter: PickerPhotoStatusAllVideoAndPhotos, PickerPhotoStatusVideos, PickerPhotoStatusPhotos.
    pickerVc.photoStatus = PickerPhotoStatusPhotos;
    // Recoder Select Assets
    pickerVc.selectPickers = self.arrImage;
    // Desc Show Photos, And Suppor Camera
    pickerVc.topShowPhotoPicker = YES;
    pickerVc.isShowCamera = YES;
    // CallBack
    pickerVc.callBack = ^(NSArray<ZLPhotoAssets *> *status){
        self.arrImage = status.mutableCopy;
        NSLog(@"%@",_arrImage);
        [self reloadScrollView];
    };
    [pickerVc showPickerVc:self];
}


#pragma mark ＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊弹出框的数据设置和处理＊＊＊＊＊＊＊＊＊＊＊
- (NSInteger)alertListTableView:(ZJAlertListView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrLei.count;
}
- (UITableViewCell *)alertListTableView:(ZJAlertListView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableAlertListCellWithIdentifier:identifier];
    if (nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if ( self.selectedIndexPath && NSOrderedSame == [self.selectedIndexPath compare:indexPath])
    {
        cell.imageView.image = [UIImage imageNamed:@"checked"];
    }else
    {
        cell.imageView.image = [UIImage imageNamed:@"unchecked"];
    }
    cell.textLabel.font = labelFontStyle;
    cell.textLabel.text = [NSString stringWithFormat:@"%@",_arrLei[indexPath.row]];
    return cell;
}
- (void)alertListTableView:(ZJAlertListView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

    
}
- (void)alertListTableView:(ZJAlertListView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    UITableViewCell *cell = [tableView alertListCellForRowAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"checked"];
    NSLog(@"didSelectRowAtIndexPath:%ld", (long)indexPath.row);
}

//完成
-(void)endBJ{

    NSLog(@"完成编辑");
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
