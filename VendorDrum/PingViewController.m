//
//  PingViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/3.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "PingViewController.h"

@interface PingViewController () <StarRatingViewDelegate,UITextViewDelegate>
{
    BOOL check;
}
@property (nonatomic, strong) TQStarRatingView *starRatingView;
@property (nonatomic, strong) TQStarRatingView *starRatingView1;
@property (nonatomic, strong) TQStarRatingView *starRatingView2;
@property (nonatomic, strong)  UITextView *textView;;

@property (nonatomic, strong)  UILabel *numOne;
@property (nonatomic, strong)  UILabel *numTwo;
@property (nonatomic, strong)  UILabel *numThree;

@end

@implementation PingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    check = YES;
    self.title = @"评价";
    self.view.backgroundColor = [UIColor whiteColor];
    //图片
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 80, 70, 70)];
    image.image = [UIImage imageNamed:@"smile"];
    [self.view addSubview:image];
    //题目
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    titleLab.text = @"您的建议就是我们的动力!";
    titleLab.font = normalFontStyle;
    [self.view addSubview:titleLab];
    //态度
    UILabel *taidu = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, 80, 30)];
    taidu.text = @"服务态度";
    taidu.font = labelFontStyle;
    taidu.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:taidu];
    //质量
    UILabel *zhiL = [[UILabel alloc] initWithFrame:CGRectMake(0, 210, 80, 30)];
    zhiL.text = @"商品质量";
    zhiL.font = labelFontStyle;
    zhiL.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:zhiL];
    //速度
    UILabel *sudu = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, 80, 30)];
    sudu.text = @"配送速度";
    sudu.font = labelFontStyle;
    sudu.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:sudu];
    //第一行星星
    _starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(80, 170, DEVICEWIDTH-140, 30) numberOfStar:kNUMBER_OF_STAR];
    _starRatingView.delegate = self;
    _starRatingView.tag = 1001;
//    [_starRatingView setScore:3.3/5 withAnimation:YES];
    [self.view addSubview:_starRatingView];
    //第二个星星
    _starRatingView1 = [[TQStarRatingView alloc] initWithFrame:CGRectMake(80, 210, DEVICEWIDTH-140, 30) numberOfStar:kNUMBER_OF_STAR];
    _starRatingView1.delegate = self;
    _starRatingView1.tag = 1002;
    [self.view addSubview:_starRatingView1];
    //第三个星星
    _starRatingView2 = [[TQStarRatingView alloc] initWithFrame:CGRectMake(80, 250, DEVICEWIDTH-140, 30) numberOfStar:kNUMBER_OF_STAR];
    _starRatingView2.delegate = self;
    _starRatingView2.tag = 1003;
    [self.view addSubview:_starRatingView2];
    //显示评分的label
    _numOne = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-60, 170, 30, 30)];
    _numOne.text = @"  5.00";
    _numOne.font = labelFontStyle;
    _numOne.textColor = [UIColor redColor];
    [self.view addSubview:_numOne];
    
    _numTwo = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-60, 210, 30, 30)];
    _numTwo.text = @"  5.00";
    _numTwo.font = labelFontStyle;
    _numTwo.textColor = [UIColor redColor];
    [self.view addSubview:_numTwo];
    
    _numThree = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-60, 250, 30, 30)];
    _numThree.text = @"  5.00";
    _numThree.font = labelFontStyle;
    _numThree.textColor = [UIColor redColor];
    [self.view addSubview:_numThree];
    //评价框
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(30, 300, DEVICEWIDTH-60, 80)];
    _textView.delegate = self;
    _textView.layer.cornerRadius = 5;
    _textView.layer.borderWidth = 0.5;
    _textView.layer.borderColor=[UIColor grayColor].CGColor;
//    self.textView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
    [self.view addSubview:_textView];
    //匿名按钮和label
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-100, 390, 15, 15)];
    button.layer.borderWidth = 0.5;
    button.layer.borderColor=[UIColor grayColor].CGColor;
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    //
    UILabel *niming = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-75, 390, 50, 15)];
    niming.text = @"匿名评价";
    niming.font = labelFontStyle;
    [self.view addSubview:niming];
     //评价按钮
    UIButton *endBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3,430,DEVICEWIDTH/3, 40)];
    endBtn.layer.cornerRadius = 20;
    endBtn.titleLabel.font=normalFontStyle;
    [endBtn setTitle:@"评  价" forState:UIControlStateNormal];
    endBtn.backgroundColor = NavaCOLOR;
    [self.view addSubview:endBtn];
    //给界面添加一个手势  点击空白区域 移除pickview
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped1:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    
}
//匿名按钮监听事件
-(void)click:(UIButton*)button{
    if (check==YES) {
        [button setBackgroundImage:[UIImage imageNamed:@"yes"] forState:UIControlStateNormal];
        check = NO;
    }else{
        [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        check = YES;
    }
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    self.view.transform = CGAffineTransformMakeTranslation(0, -100);
    return YES;
}
//点击空白区域，隐藏键盘
-(void)viewTapped1:(UITapGestureRecognizer*)tap1
{
    [_textView resignFirstResponder];
    self.view.transform = CGAffineTransformMakeTranslation(0, 0);
}
#pragma mark -----StarRatingViewDelegate
- (void)starRatingView:(TQStarRatingView *)view score:(float)score
{
    if (view.tag==1001) {
        self.numOne.text = [NSString stringWithFormat:@"  %0.2f",score * 5 ];
    }else if (view.tag==1002){
        self.numTwo.text = [NSString stringWithFormat:@"  %0.2f",score * 5 ];
    }else{
        self.numThree.text = [NSString stringWithFormat:@"  %0.2f",score * 5 ];
    }
}



@end
