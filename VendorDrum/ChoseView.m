
//
//  ChoseView.m
//  AddShoppingCart
//
//  Created by 主用户 on 16/3/23.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "ChoseView.h"

@implementation ChoseView
@synthesize alphaiView,whiteView,img,bt_sure,bt_cancle;
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _btnArray = [[NSMutableArray alloc] init];
        
        //半透明视图
        alphaiView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT)];
        alphaiView.backgroundColor = [UIColor blackColor];
        alphaiView.alpha = 0.2;
        [self addSubview:alphaiView];
        //装载商品信息的视图
        whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.frame.size.width, self.frame.size.height-200)];
        whiteView.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [whiteView addGestureRecognizer:tap];
        
        //商品图片
        img = [[UIImageView alloc] initWithFrame:CGRectMake(10, -20, 100, 100)];
        img.image = [UIImage imageNamed:@"1.jpg"];
        img.backgroundColor = [UIColor yellowColor];
        img.layer.cornerRadius = 4;
        img.layer.borderColor = [UIColor whiteColor].CGColor;
        img.layer.borderWidth = 5;
        [img.layer setMasksToBounds:YES];
        [whiteView addSubview:img];
        
        bt_cancle= [UIButton buttonWithType:UIButtonTypeCustom];
        bt_cancle.frame = CGRectMake(whiteView.frame.size.width-40, 10,30, 30);
        [bt_cancle setBackgroundImage:[UIImage imageNamed:@"close@3x"] forState:0];
        [whiteView addSubview:bt_cancle];
        //商品名称
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, DEVICEWIDTH-140, 20)];
        _nameLab.font = normalFontStyle;
        [whiteView addSubview:_nameLab];
        //商品介绍
        _jieshaoLab = [[UILabel alloc] initWithFrame:CGRectMake(120, 40,DEVICEWIDTH-140, 40)];
        _jieshaoLab.textColor = [UIColor grayColor];
        _jieshaoLab.font = labelFontStyle;
        _jieshaoLab.numberOfLines = 0;
        [whiteView addSubview:_jieshaoLab];
        //最低批量
        _zuishaoLab = [[UILabel alloc] initWithFrame:CGRectMake(0,100,DEVICEWIDTH, 40)];
        _zuishaoLab.textColor = [UIColor colorWithRed:0.91 green:0.31 blue:0.28 alpha:1.00];
        _zuishaoLab.font = titleFontStyle;
        _zuishaoLab.textAlignment = NSTextAlignmentCenter;
        _zuishaoLab.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
        [whiteView addSubview:_zuishaoLab];
        //购买数量
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, 80, 20)];
        _numLab.textColor = [UIColor grayColor];
        _numLab.font = normalFontStyle;
        [whiteView addSubview:_numLab];
        
        //填写数量
        _numText = [[UITextField alloc] initWithFrame:CGRectMake(80, 140, 140, 20)];
        _numText.textColor = [UIColor redColor];
        _numText.delegate = self;
        _numText.returnKeyType = UIReturnKeyDone;
        [whiteView addSubview:_numText];
        
        //输入框下边的线
        _lineLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 160, 140, 1)];
        _lineLab.backgroundColor = [UIColor lightGrayColor];
        [whiteView addSubview:_lineLab];
        
        //库存
        _kuLab = [[UILabel alloc] initWithFrame:CGRectMake(220, 140, 100, 20)];
        _kuLab.font = labelFontStyle;
        [whiteView addSubview:_kuLab];
        
        //商品总价
        _allPriceLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 170, 80, 20)];
        _allPriceLab.textColor = [UIColor grayColor];
        _allPriceLab.font = normalFontStyle;
        [whiteView addSubview:_allPriceLab];
        
        //显示总价格
        _SurePriceLab= [[UILabel alloc] initWithFrame:CGRectMake(80, 170, 200, 20)];
        _SurePriceLab.font = normalFontStyle;
        _SurePriceLab.textColor = [UIColor colorWithRed:0.91 green:0.31 blue:0.28 alpha:1.00];
        [whiteView addSubview:_SurePriceLab];
        //价格说明
        _shuomingLab= [[UILabel alloc] initWithFrame:CGRectMake(80, 190, DEVICEWIDTH-90, 40)];
        _shuomingLab.font = labelFontStyle;
        _shuomingLab.textColor = [UIColor grayColor];
        _shuomingLab.numberOfLines = 0;
        [whiteView addSubview:_shuomingLab];
        //发货方式
        _fahuoLab =[[UILabel alloc] initWithFrame:CGRectMake(10, 240, 80, 20)];
        _fahuoLab.font = normalFontStyle;
        _fahuoLab.textColor = [UIColor grayColor];
        [whiteView addSubview:_fahuoLab];
        //方式选择
        //第一个 label的起点
        CGSize size = CGSizeMake(90, 240);
        //间距
        CGFloat padding = 5.0;
        NSArray *titleArr = @[@"走快递",@"快速物流",@"商家找车",];
        for (int i = 0; i < titleArr.count; i ++) {
            if (DEVICEWIDTH>320) {
                CGFloat keyWorldWidth = [self getSizeByString:titleArr[i] AndFontSize:25].width;
                if (keyWorldWidth > DEVICEWIDTH-120) {
                    keyWorldWidth = DEVICEWIDTH-120;
                }
                if (DEVICEWIDTH - size.width < keyWorldWidth) {
                    size.height += 30.0;
                    size.width = 5.0;
                }
                _changeBtn = [[UIButton alloc] initWithFrame:CGRectMake(size.width, size.height, keyWorldWidth, 30)];
                _changeBtn.titleLabel.font = normalFontStyle;
                [_changeBtn setTitle:[NSString stringWithFormat:@"%@",[titleArr objectAtIndex:i]]forState:UIControlStateNormal];//设置button的title
                _changeBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
                _changeBtn.titleEdgeInsets = UIEdgeInsetsMake(0,0, 0,0);
                [_changeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [_changeBtn setImage:[UIImage imageNamed:@"C2"] forState:UIControlStateNormal];
                _changeBtn.imageEdgeInsets = UIEdgeInsetsMake(5,5,5,keyWorldWidth-25);
                _changeBtn.tag = 1000+i;
                [_changeBtn addTarget:self action:@selector(changeFS:) forControlEvents:UIControlEventTouchUpInside];
                [whiteView addSubview:_changeBtn];
                [_btnArray addObject:_changeBtn];//添加到数组
                //起点 增加
                size.width += keyWorldWidth+padding;
            }else{
                CGFloat keyWorldWidth = [self getSizeByString:titleArr[i] AndFontSize:20].width;
                if (keyWorldWidth > DEVICEWIDTH-120) {
                    keyWorldWidth = DEVICEWIDTH-120;
                }
                if (DEVICEWIDTH - size.width < keyWorldWidth) {
                    size.height += 30.0;
                    size.width = 5.0;
                }
                _changeBtn = [[UIButton alloc] initWithFrame:CGRectMake(size.width, size.height, keyWorldWidth, 20)];
                _changeBtn.titleLabel.font = labelFontStyle;
                [_changeBtn setTitle:[NSString stringWithFormat:@"%@",[titleArr objectAtIndex:i]]forState:UIControlStateNormal];//设置button的title
                _changeBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
                _changeBtn.titleEdgeInsets = UIEdgeInsetsMake(0,0, 0,0);
                [_changeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [_changeBtn setImage:[UIImage imageNamed:@"C2"] forState:UIControlStateNormal];
                _changeBtn.imageEdgeInsets = UIEdgeInsetsMake(5,5,5,keyWorldWidth-15);
                _changeBtn.tag = 1000+i;
                [_changeBtn addTarget:self action:@selector(changeFS:) forControlEvents:UIControlEventTouchUpInside];
                [whiteView addSubview:_changeBtn];
                [_btnArray addObject:_changeBtn];//添加到数组
                //起点 增加
                size.width += keyWorldWidth+padding;
            }
        }
        //联系店家按钮
        bt_sure = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3*2,DEVICEHIGHT-240, DEVICEWIDTH/3, 40)];
        bt_sure.titleLabel.font = labelFontStyle;
        bt_sure.backgroundColor = [UIColor colorWithRed:0.98 green:0.47 blue:0.13 alpha:1.00];
        [bt_sure setImage:[UIImage imageNamed:@"LianXi"] forState:UIControlStateNormal];
        bt_sure.imageEdgeInsets = UIEdgeInsetsMake(10,10,10,DEVICEWIDTH/3-34);
        [bt_sure setTitle:@"协商运费"forState:UIControlStateNormal];//设置button的title
        bt_sure.titleLabel.textAlignment = NSTextAlignmentCenter;
        bt_sure.titleEdgeInsets = UIEdgeInsetsMake(0,-10,0,0);
        [bt_sure setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bt_sure.layer.borderWidth = 0.5;
        bt_sure.layer.borderColor=[UIColor grayColor].CGColor;
        [whiteView addSubview:bt_sure];
        //添加购物车或直接下单
        _btShop= [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3,DEVICEHIGHT-240,DEVICEWIDTH/3, 40)];
        [_btShop setBackgroundColor:[UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00]];
        [_btShop setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btShop.titleLabel.font = normalFontStyle;
        //        [_btShop setTitle:@"" forState:UIControlStateNormal];
        [whiteView addSubview:_btShop];
    }
    return self;
}

//计算文字所占大小
- (CGSize)getSizeByString:(NSString*)string AndFontSize:(CGFloat)font
{
    CGSize size = [string boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    size.width += 5;
    return size;
}
#pragma mark-tf
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.transform = CGAffineTransformMakeTranslation(0, -100);
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
//    [_numText resignFirstResponder];
    int count =[_numText.text intValue];
    if (count > self.stock) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        alert.tag = 100;
//        [alert show];
        _numText.text = [NSString stringWithFormat:@"%d",self.stock];
        _SurePriceLab.text = [NSString stringWithFormat:@"%d*单价",self.stock];//比库存多的时候
        [self tap];
    }else{
        [self tap];
        _SurePriceLab.text = [NSString stringWithFormat:@"%d*单价",count];//比库存少的时候
    }
}
//手势
-(void)tap
{
    self.transform = CGAffineTransformMakeTranslation(0, 0);
    [_numText resignFirstResponder];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [_numText resignFirstResponder];
//    int count =[_numText.text intValue];
//    if (count > self.stock) {
//        //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        //        alert.tag = 100;
//        //        [alert show];
//        _numText.text = [NSString stringWithFormat:@"%d",self.stock];
//        _SurePriceLab.text = [NSString stringWithFormat:@"%d*单价",self.stock];//比库存多的时候
//        [self tap];
//    }else{
//        _SurePriceLab.text = [NSString stringWithFormat:@"%d*单价",count];//比库存少的时候
//    }
//
//
    return YES;
}
//选择发货的方式
-(void)changeFS:(UIButton *)button{
    NSLog(@"%ld",(long)button.tag);
    for (UIButton *btn in _btnArray) {
        if (btn.tag ==button.tag) {
            [btn setTitleColor:[UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"C1"] forState:UIControlStateNormal];
        } else {
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"C2"] forState:UIControlStateNormal];
        }
    }
    
}


@end
