//
//  SellAfterViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/28.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "SellAfterViewController.h"
#import "SellAfterCell.h"
#import "UIImage+ZLPhotoLib.h"
#import "ZLPhoto.h"
#import "ZJAlertListView.h"

@interface SellAfterViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,ZLPhotoPickerBrowserViewControllerDelegate,ZJAlertListViewDelegate,ZJAlertListViewDatasource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UILabel *reasonLab;    ///<退款原因
@property (nonatomic,strong)UILabel *leiLab; ///<服务类型
@property (nonatomic,strong)UILabel *priceLab;     ///<退款金额
@property (nonatomic,strong)UITextView *shuomingText;  ///<售后说明

@property (nonatomic, strong) UIScrollView   *scrollView;

@property (nonatomic, strong)NSMutableArray *arrImage; ///<图片数组

@property (nonatomic, strong)UIButton *btnT; ///<提交申请按钮

@property (nonatomic,retain)ZJAlertListView *alertList;///<弹框选择

@property (nonatomic,strong)NSMutableArray *leiArr; ///<服务类型数组

@property (nonatomic,strong)NSMutableArray *arrPrice; ///<退款原因数组

@property (nonatomic,strong)NSMutableArray *arrTuiHuo; ///<换货原因数组


@property (nonatomic)NSInteger TuiNum;

@property (nonatomic,strong) NSIndexPath *selectedIndexPath;

@property (nonatomic)NSInteger num;

@end

@implementation SellAfterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"售后申请";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _leiArr    = [[NSMutableArray alloc] initWithObjects:@"退货退款",@"换货", nil];
    _arrPrice  = [[NSMutableArray alloc] initWithObjects:@"我不想买了",@"信息填写错误,重新下单",@"商家缺货",@"其他", nil];
    _arrTuiHuo = [[NSMutableArray alloc] initWithObjects:@"卖家发错货",@"包装/商品破损",@"质量问题",@"其他", nil];
    
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tableView];
    
    UIView *viewFoot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 220)];
    _tableView.tableFooterView = viewFoot;
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.frame = CGRectMake(0, 20,DEVICEWIDTH, 120);
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [viewFoot addSubview:_scrollView];
    
    _arrImage = [[NSMutableArray alloc] init];
    // 这个属性不能少
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 九宫格创建ScrollView
    [self reloadScrollView];
    
    
    //
    _btnT = [[UIButton alloc] initWithFrame:CGRectMake(30, 150, DEVICEWIDTH-60, 45)];
    [_btnT setTitle:@"提 交 申 请" forState:UIControlStateNormal];
    [_btnT setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnT.backgroundColor = NavaCOLOR;
    _btnT.layer.cornerRadius = 15;
    [viewFoot addSubview:_btnT];
    
    
    _leiLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 0, DEVICEWIDTH/3*2-40, 60)];
    _leiLab.font = labelFontStyle;
    _leiLab.textAlignment = NSTextAlignmentCenter;
    _leiLab.text = @"退货退款";
    
    _reasonLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 0, DEVICEWIDTH/3*2-40, 60)];
    _reasonLab.font = labelFontStyle;
    _reasonLab.textAlignment = NSTextAlignmentCenter;
    _reasonLab.text = @"选择退款原因";
    
    _priceLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 0, DEVICEWIDTH/3*2, 60)];
    _priceLab.font = labelFontStyle;
    _priceLab.textAlignment = NSTextAlignmentCenter;
    _priceLab.textColor = [UIColor redColor];
    _priceLab.text = @"¥12.00(不包含邮费)";
    
    _shuomingText = [[UITextView alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 0, DEVICEWIDTH/3*2, 60)];
    _shuomingText.font = labelFontStyle;
    _shuomingText.textAlignment = NSTextAlignmentLeft;
    _shuomingText.returnKeyType = UIReturnKeyDone;
    _shuomingText.delegate = self;
    
}
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    SellAfterCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[SellAfterCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"申请服务",@"申请原因",@"售后金额", @"售后说明",nil];
    if (indexPath.row==0) {
        UILabel * xiaLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-40, 0, 30, 60)];
        xiaLab.text = @"V";
        xiaLab.font = labelFontStyle;
        [cell addSubview:xiaLab];
        [cell addSubview:_leiLab];
    }else if (indexPath.row==1){
        UILabel * xiaLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-40, 0, 30, 60)];
        xiaLab.text = @"V";
        xiaLab.font = labelFontStyle;
        [cell addSubview:xiaLab];
        [cell addSubview:_reasonLab];
    }else if (indexPath.row==2){
        [cell addSubview:_priceLab];
    }else{
        [cell addSubview:_shuomingText];
    }
    cell.viewBack.tag = 1001;
    cell.starLab.text = @"*";
    cell.fuwuLab.text = [NSString stringWithFormat:@"%@",arr[indexPath.row]];
    cell.viewLine.tag = 1001;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row<2) {
        _alertList = [[ZJAlertListView alloc] initWithFrame:CGRectMake(0, 0, 250, 300)];
        _alertList.titleLabel.text = @"原因";
        _alertList.datasource = self;
        _alertList.delegate = self;
        __block SellAfterViewController* bObject = self;
        //点击确定的时候，调用它去做点事情
        [_alertList setDoneButtonWithBlock:^{
            NSIndexPath *selectedIndexPath = bObject.selectedIndexPath;
            NSLog(@"%ld",(long)selectedIndexPath.row);
            _TuiNum = selectedIndexPath.row;
            if (_num==0) {
                bObject.leiLab.text = [NSString stringWithFormat:@"%@",bObject.leiArr[bObject.TuiNum]];
                if (bObject.leiLab.text.length>2) {
                    bObject.reasonLab.text = @"选择退款原因";
                    bObject.priceLab.text = @"¥12.00(不包含邮费)";
                }else{
                    bObject.reasonLab.text = @"选择换货原因";
                    bObject.priceLab.text = nil;
                }
            }else{
                if (bObject.leiLab.text.length>2) {
                    bObject.reasonLab.text = [NSString stringWithFormat:@"%@",bObject.arrPrice[bObject.TuiNum]];
                }else{
                    bObject.reasonLab.text = [NSString stringWithFormat:@"%@",bObject.arrTuiHuo[bObject.TuiNum]];
                }
            }
            [bObject.alertList dismiss];
        }];
        _num = indexPath.row;
        [_alertList show];
    }
}
#pragma mark -设置行数
- (NSInteger)alertListTableView:(ZJAlertListView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_num==0) {
        return 2;
    }else{
        return 4;
    }
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
    }
    else
    {
        cell.imageView.image = [UIImage imageNamed:@"unchecked"];
    }
    cell.textLabel.font = labelFontStyle;
    if (_num==0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",_leiArr[indexPath.row]];
        
    }else{
        
        if (_leiLab.text.length>2) {
            cell.textLabel.text = [NSString stringWithFormat:@"%@",_arrPrice[indexPath.row]];
        }else{
            cell.textLabel.text = [NSString stringWithFormat:@"%@",_arrTuiHuo[indexPath.row]];
        }
        
        
    }
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
//点击返回按钮的时候，收起键盘
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}
@end
