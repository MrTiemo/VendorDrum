//
//  InputViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/16.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "InputViewController.h"
#import "UIImage+ZLPhotoLib.h"
#import "ZLPhoto.h"
#import "UIButton+WebCache.h"
#import "InputCell.h"
#import "SellViewController.h"
#import "AddressViewController.h"
#import "UnitPriceViewController.h"
#import "WLFSViewController.h"
#import "HistoryAddressController.h"

#import "zySheetPickerView.h"


@interface InputViewController ()<UITableViewDelegate,UITableViewDataSource,ZLPhotoPickerBrowserViewControllerDelegate,UITextFieldDelegate,UIAlertViewDelegate,UITextViewDelegate,HisAddDelegate>
@property (nonatomic, strong) UITableView    *tableView;
@property (nonatomic, strong) NSMutableArray *assets;
@property (nonatomic, strong) UIScrollView   *scrollView;
@property (nonatomic, strong) UIButton       *addBtn;
@property (nonatomic, strong) NSMutableArray *Arrone;
@property (nonatomic, strong) NSMutableArray *Arrtwo;
@property (nonatomic, strong) NSMutableArray *arrTime;
//现货
@property(nonatomic,strong)UIButton *xianhuoBtn;
//预售
@property(nonatomic,strong)UIButton *yushouBtn;
//电话协商
@property(nonatomic,strong)UIButton *Zhichi;
//不支持
@property(nonatomic,strong)UIButton *NoZhichi;

@end

@implementation InputViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品信息";
    self.view.backgroundColor = [UIColor whiteColor];
    [self getButton]; //初始化选择button
    _Arrone = [[NSMutableArray alloc] initWithObjects:@"",@"重量,大小,成熟度",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",nil];
    _Arrtwo = [[NSMutableArray alloc] initWithObjects:@"商品类别",@"商品名称",@"商品规格",@"货品单价",@"销售方式",@"供货量",@"发货信息",@"物流方式",@"货到付款",@"货品描述", nil];
    _arrTime = [[NSMutableArray alloc] initWithObjects:@"1月上旬",@"1月中旬",@"1月下旬",@"2月上旬",@"2月中旬",@"2月下旬",@"3月上旬",@"3月中旬",@"3月下旬",@"4月上旬",@"4月中旬",@"4月下旬", @"5月上旬",@"5月中旬",@"5月下旬",@"6月上旬",@"6月中旬",@"6月下旬",@"7月上旬",@"7月中旬",@"7月下旬",@"8月上旬",@"8月中旬",@"8月下旬",@"9月上旬",@"9月中旬",@"9月下旬",@"10月上旬",@"10月中旬",@"10月下旬",@"11月上旬",@"11月中旬",@"11月下旬",@"12月上旬",@"12月中旬",@"12月下旬",nil];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH, DEVICEHIGHT-64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    //尾视图
    UIView *sview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 300)];
    sview.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.frame = CGRectMake(0, 20,DEVICEWIDTH, 150);
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [sview addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor whiteColor];
    _tableView.tableFooterView = sview;
    _assets = [[NSMutableArray alloc] init];
    // 这个属性不能少
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 九宫格创建ScrollView
    [self reloadScrollView];
    //
    _addBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 200, DEVICEWIDTH-60, 45)];
    [_addBtn setTitle:@"提交" forState:UIControlStateNormal];
    [_addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_addBtn addTarget:self action:@selector(addonject) forControlEvents:UIControlEventTouchUpInside];
    _addBtn.backgroundColor = NavaCOLOR;
    _addBtn.layer.cornerRadius = 15;
    [sview addSubview:_addBtn];
    
}
-(void)getButton{
    //-------------------------------------------------------====================================
    _xianhuoBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 20, DEVICEWIDTH/4, 10)];
    _xianhuoBtn.titleLabel.font = normalFontStyle;
    [_xianhuoBtn setTitle:@"现货" forState:UIControlStateNormal];//设置button的title
    _xianhuoBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0,0);
    [_xianhuoBtn setTitleColor:[UIColor colorWithRed:0.13 green:0.67 blue:0.22 alpha:1.00] forState:UIControlStateNormal];
    [_xianhuoBtn setImage:[UIImage imageNamed:@"C1"] forState:UIControlStateNormal];
    [_xianhuoBtn addTarget:self action:@selector(BtnOne:) forControlEvents:UIControlEventTouchUpInside];
    _xianhuoBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0,DEVICEWIDTH/4-20);
    //-------------------------------------------------------====================================
    _yushouBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2, 20, DEVICEWIDTH/3, 10)];
    _yushouBtn.titleLabel.font = normalFontStyle;
    [_yushouBtn setTitle:@"预售" forState:UIControlStateNormal];//设置button的title
    _yushouBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0,0);
    [_yushouBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_yushouBtn setImage:[UIImage imageNamed:@"C2"] forState:UIControlStateNormal];
    [_yushouBtn addTarget:self action:@selector(BtnTwo:) forControlEvents:UIControlEventTouchUpInside];
    _yushouBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0,DEVICEWIDTH/3-20);
    //-------------------------------------------------------====================================
    _Zhichi = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 20, DEVICEWIDTH/4, 10)];
    _Zhichi.titleLabel.font = normalFontStyle;
    [_Zhichi setTitle:@"支持" forState:UIControlStateNormal];//设置button的title
    _Zhichi.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0,0);
    [_Zhichi setTitleColor:[UIColor colorWithRed:0.13 green:0.67 blue:0.22 alpha:1.00] forState:UIControlStateNormal];
    [_Zhichi setImage:[UIImage imageNamed:@"C1"] forState:UIControlStateNormal];
    [_Zhichi addTarget:self action:@selector(BtnThree:) forControlEvents:UIControlEventTouchUpInside];
    _Zhichi.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0,DEVICEWIDTH/4-20);
    //-------------------------------------------------------====================================
    _NoZhichi = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2, 20, DEVICEWIDTH/4, 10)];
    _NoZhichi.titleLabel.font = normalFontStyle;
    [_NoZhichi setTitle:@"不支持" forState:UIControlStateNormal];//设置button的title
    _NoZhichi.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0,0);
    [_NoZhichi setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_NoZhichi setImage:[UIImage imageNamed:@"C2"] forState:UIControlStateNormal];
    [_NoZhichi addTarget:self action:@selector(BtnFour:) forControlEvents:UIControlEventTouchUpInside];
    _NoZhichi.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0,DEVICEWIDTH/4-20);
}
- (void)reloadScrollView{
    // 先移除，后添加
    [[self.scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSUInteger column = 5;
    // 加一是为了有个添加button
    NSUInteger assetCount = self.assets.count + 1;
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
        if (i == self.assets.count){
            // 最后一个Button
            [btn setImage:[UIImage ml_imageFromBundleNamed:@"iconfont-tianjia"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(photoSelectet) forControlEvents:UIControlEventTouchUpInside];
        }else{
            // 如果是本地ZLPhotoAssets就从本地取，否则从网络取
            if ([[self.assets objectAtIndex:i] isKindOfClass:[ZLPhotoAssets class]]) {
                NSMutableArray *arr = [[NSMutableArray alloc] init];
                arr = self.assets;
                [btn setImage:[self.assets[i] thumbImage] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(shouimage:) forControlEvents:UIControlEventTouchUpInside];
            }else if ([[self.assets objectAtIndex:i] isKindOfClass:[UIImage class]]){
                [btn setImage:self.assets[i] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(shouimage:) forControlEvents:UIControlEventTouchUpInside];
                
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
    pickerVc.maxCount = 10;
    // Jump AssetsVc
    pickerVc.status = PickerViewShowStatusCameraRoll;
    // Filter: PickerPhotoStatusAllVideoAndPhotos, PickerPhotoStatusVideos, PickerPhotoStatusPhotos.
    pickerVc.photoStatus = PickerPhotoStatusPhotos;
    // Recoder Select Assets
    pickerVc.selectPickers = self.assets;
    // Desc Show Photos, And Suppor Camera
    pickerVc.topShowPhotoPicker = YES;
    pickerVc.isShowCamera = YES;
    // CallBack
    pickerVc.callBack = ^(NSArray<ZLPhotoAssets *> *status){
        self.assets = status.mutableCopy;
        NSLog(@"%@",_assets);
        [self reloadScrollView];
    };
    [pickerVc showPickerVc:self];
}
#pragma mark -- Tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _Arrtwo.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==3) {
        return 70;
    }else{
        return 50;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    InputCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[InputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.Label.text = [NSString stringWithFormat:@"%@",[_Arrtwo objectAtIndex:indexPath.row]];
    
    if (indexPath.row==0) {
        cell.OneLab.text = _leixingStr;
    }else if (indexPath.row==3){
        //
        cell.SectionV.backgroundColor = [UIColor colorWithRed:0.81 green:0.81 blue:0.82 alpha:1.00];
        cell.OneLab.text = _priceStr;
    }else if (indexPath.row==4){
        [cell addSubview:_xianhuoBtn];
        [cell addSubview:_yushouBtn];
    }else if (indexPath.row==6){
        cell.OneLab.text = _addressStr;
        cell.OneLab.font = labelFontStyle;
    }else if (indexPath.row==7){
        //点击以后选择物流方式
        cell.OneLab.text = _wuliuStr;
    }else if (indexPath.row==8){
        //是否支持货到付款的选择按钮
        [cell addSubview:_Zhichi];
        [cell addSubview:_NoZhichi];
    }else {
        if (indexPath.row==2) {
            cell.textFie.text = @"重量,大小,成熟度等";
        }
        //默认是编辑框的输入状态
        cell.textFie.tag = indexPath.row;
        cell.textFie.delegate=self;
        cell.textFie.text = [_Arrone objectAtIndex:indexPath.row-1];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    [_pickerView remove];
    if (indexPath.row==0) {
        SellViewController *sell = [[SellViewController alloc] init];
        sell.str = @"0";
        [self.navigationController pushViewController:sell animated:YES];
        //Block返回的数值，返回以后刷新tableview
        [sell returnText:^(NSString *showText) {
            _leixingStr = showText;
            [_tableView reloadData];
        }];
    }else if (indexPath.row==3){
        UnitPriceViewController *unit = [[UnitPriceViewController alloc] init];
        [self.navigationController pushViewController:unit animated:YES];
        //block   用于返回货品的单价和起批量
        [unit returnUnitPrice:^(NSString *showText) {
            _priceStr = showText;
            [_tableView reloadData];
        }];
    }else if (indexPath.row==6){
        //        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
        HistoryAddressController *add = [[HistoryAddressController alloc] init];
        add.deleHis = self;
        [self.navigationController pushViewController:add animated:YES];
    }else if (indexPath.row==7){
        
        WLFSViewController *wlfs = [[WLFSViewController alloc] init];
        [self.navigationController pushViewController:wlfs animated:YES];
        [wlfs returnWLFS:^(NSString *showText) {
            _wuliuStr = showText;
            [_tableView reloadData];
        }];
    }
}
//现货按钮
-(void)BtnOne:(UIButton *)button{
    //预售
    [_yushouBtn setTitle:@"预售" forState:UIControlStateNormal];
    [_yushouBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_yushouBtn setImage:[UIImage imageNamed:@"C2"] forState:UIControlStateNormal];
    //现货
    [_xianhuoBtn setTitleColor:[UIColor colorWithRed:0.13 green:0.67 blue:0.22 alpha:1.00] forState:UIControlStateNormal];
    [_xianhuoBtn setImage:[UIImage imageNamed:@"C1"] forState:UIControlStateNormal];
}
//预售按钮点击事件
-(void)BtnTwo:(UIButton *)button{
    
    zySheetPickerView *pickerView = [zySheetPickerView ZYSheetStringPickerWithTitle:_arrTime andHeadTitle:@"" Andcall:^(zySheetPickerView *pickerView, NSString *choiceString) {
        NSLog(@"%@",choiceString);
        //预售
        [_yushouBtn setTitle:[NSString stringWithFormat:@"%@",choiceString] forState:UIControlStateNormal];
        [_yushouBtn setTitleColor:[UIColor colorWithRed:0.13 green:0.67 blue:0.22 alpha:1.00] forState:UIControlStateNormal];
        [_yushouBtn setImage:[UIImage imageNamed:@"C1"] forState:UIControlStateNormal];
        //现货
        [_xianhuoBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_xianhuoBtn setImage:[UIImage imageNamed:@"C2"] forState:UIControlStateNormal];
        [pickerView dismissPicker];
        [_tableView reloadData];
    }];
    [pickerView show];
    
}
//是否支持货到付款
-(void)BtnThree:(UIButton *)button{
    //不支持
    [_NoZhichi setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_NoZhichi setImage:[UIImage imageNamed:@"C2"] forState:UIControlStateNormal];
    //支持
    [_Zhichi setTitleColor:[UIColor colorWithRed:0.13 green:0.67 blue:0.22 alpha:1.00] forState:UIControlStateNormal];
    [_Zhichi setImage:[UIImage imageNamed:@"C1"] forState:UIControlStateNormal];
}
//是否支持货到付款
-(void)BtnFour:(UIButton *)button{
    //支持
    [_Zhichi setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_Zhichi setImage:[UIImage imageNamed:@"C2"] forState:UIControlStateNormal];
    //不持
    [_NoZhichi setTitleColor:[UIColor colorWithRed:0.13 green:0.67 blue:0.22 alpha:1.00] forState:UIControlStateNormal];
    [_NoZhichi setImage:[UIImage imageNamed:@"C1"] forState:UIControlStateNormal];
}
#pragma mark -- UiTextFieldDelegate

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSLog(@"%ld",(long)textView.tag);
    return YES;
}
-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    [_Arrone setObject:textView.text atIndexedSubscript:textView.tag-1];
    return YES;
}
//点击返回按钮的时候，收起键盘
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        [_Arrone setObject:textView.text atIndexedSubscript:textView.tag-1];
        return NO;
    }
    return YES;
}
-(void)shouimage:(UIButton *)btn{
    
    [imageShow showImage:btn.imageView];
    
}
//提交
-(void)addonject{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//返回的发货信息
-(void)GetbackHisadd:(NSMutableDictionary *)sender{
    
    _addressStr = [NSString stringWithFormat:@" 联系人:%@  联系电话:%@\n 地址:%@%@",[sender objectForKey:@"Person"],[sender objectForKey:@"Phone"],[sender objectForKey:@"Address"],[sender objectForKey:@"address"]];
    [_tableView reloadData];
    
}
@end
