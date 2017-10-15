//
//  FaHuoCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/11.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "FaHuoCell.h"

@implementation FaHuoCell


-(UILabel *)labBianHao{
    if (_labBianHao==nil) {
        _labBianHao = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
        _labBianHao.font = labelFontStyle;
        _labBianHao.textColor = [UIColor whiteColor];
        [self addSubview:_labBianHao];
    }
    return _labBianHao;
}

-(UILabel *)labZFB{
    if (_labZFB==nil) {
        _labZFB = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 200, 20)];
        _labZFB.font = labelFontStyle;
        _labZFB.textColor = [UIColor whiteColor];
        [self addSubview:_labZFB];
    }
    return _labZFB;
}
-(UILabel *)labTime{
    if (_labTime==nil) {
        _labTime = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 200, 20)];
        _labTime.font = labelFontStyle;
        _labTime.textColor = [UIColor whiteColor];
        [self addSubview:_labTime];
    }
    return _labTime;
}
-(UILabel *)labZhuang{
    if (_labZhuang==nil) {
        _labZhuang = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-80, 20, 70, 40)];
        _labZhuang.font = normalFontStyle;
        _labZhuang.textColor = [UIColor whiteColor];
        _labZhuang.textAlignment = NSTextAlignmentRight;
        [self addSubview:_labZhuang];
    }
    return _labZhuang;
}

-(UIImageView *)imageV{
    if (_imageV==nil) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 70, 70)];
        [self addSubview:_imageV];
    }
    return _imageV;
}

-(UILabel *)labTitle{
    if (_labTitle==nil) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 100, 20)];
        _labTitle.font = labelFontStyle;
        [self addSubview:_labTitle];
    }
    return _labTitle;
}

-(UILabel *)labPrice{
    if (_labPrice==nil) {
        _labPrice = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 100, 20)];
        _labPrice.font = labelFontStyle;
        _labPrice.textColor = [UIColor redColor];
        [self addSubview:_labPrice];
    }
    return _labPrice;
}

-(UILabel *)labNumber{
    if (_labNumber==nil) {
        _labNumber = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-50, 30, 30, 20)];
        _labNumber.font = labelFontStyle;
        _labNumber.textColor = [UIColor grayColor];
        [self addSubview:_labNumber];
    }
    return _labNumber;
}

-(UILabel *)labAllNum{
    if (_labAllNum==nil) {
        _labAllNum = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 0, DEVICEWIDTH/3-30, 30)];
        _labAllNum.font = labelFontStyle;
        _labAllNum.textAlignment = NSTextAlignmentRight;
        _labAllNum.textColor = [UIColor grayColor];
        [self addSubview:_labAllNum];
    }
    return _labAllNum;
}
-(UILabel *)labAllPirce{
    if (_labAllPirce==nil) {
        _labAllPirce = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3*2-20, 0, DEVICEWIDTH/3+20, 30)];
        _labAllPirce.font = labelFontStyle;
        _labAllPirce.textColor = [UIColor grayColor];
        [self addSubview:_labAllPirce];
    }
    return _labAllPirce;
}

-(UILabel *)labYouHui{
    if (_labYouHui==nil) {
        _labYouHui = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3*2-20, 5, DEVICEWIDTH/3+20, 20)];
        _labYouHui.font = labelFontStyle;
        _labYouHui.textColor = [UIColor grayColor];
        [self addSubview:_labYouHui];
    }
    return _labYouHui;
}
-(UILabel *)labShifu{
    if (_labShifu==nil) {
        _labShifu = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3*2-20, 25, DEVICEWIDTH/3+20, 20)];
        _labShifu.font = labelFontStyle;
        _labShifu.textColor = [UIColor grayColor];
        [self addSubview:_labShifu];
    }
    return _labShifu;
}

-(UILabel *)labUser{
    if (_labUser==nil) {
        _labUser = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, DEVICEWIDTH-40, 20)];
        _labUser.font = labelFontStyle;
        [self addSubview:_labUser];
    }
    return _labUser;
}
-(UILabel *)labAddress{
    if (_labAddress==nil) {
        _labAddress = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, DEVICEWIDTH-40, 20)];
        _labAddress.font = labelFontStyle;
        _labAddress.textColor = [UIColor grayColor];
        [self addSubview:_labAddress];
    }
    return _labAddress;
}
-(UILabel *)labBeiZhu{
    if (_labBeiZhu==nil) {
        _labBeiZhu = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, DEVICEWIDTH-40, 20)];
        _labBeiZhu.font = labelFontStyle;
        _labBeiZhu.textColor = [UIColor grayColor];
        [self addSubview:_labBeiZhu];
    }
    return _labBeiZhu;
}

-(UIButton *)btnXiuGai{
    if (_btnXiuGai==nil) {
        _btnXiuGai = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-100, 120, 80, 30)];
        _btnXiuGai.titleLabel.font = normalFontStyle;
        [_btnXiuGai setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btnXiuGai.backgroundColor = [UIColor colorWithRed:0.98 green:0.47 blue:0.13 alpha:1.00];
        _btnXiuGai.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_btnXiuGai setTitle:@"修改" forState:UIControlStateNormal];
        _btnXiuGai.layer.cornerRadius = 2;
        [self addSubview:_btnXiuGai];
    }
    return _btnXiuGai;
}





@end
