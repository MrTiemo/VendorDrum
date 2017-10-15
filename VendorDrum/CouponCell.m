//
//  CouponCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/11.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "CouponCell.h"

@implementation CouponCell


///<背景
-(UIImageView *)imageBack{
    if (_imageBack==nil) {
        _imageBack = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, DEVICEWIDTH-20, 130)];
        [self addSubview:_imageBack];
    }
    return _imageBack;
}
//状态
-(UIImageView *)imageBiao{
    if (_imageBiao==nil) {
        _imageBiao = [[UIImageView alloc] initWithFrame:CGRectMake(DEVICEWIDTH-60, 0, 60, 60)];
        [self addSubview:_imageBiao];
    }
    return _imageBiao;
}
//优惠券编号
-(UILabel *)labNum{
    if (_labNum==nil) {
        _labNum = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/17, 10, 10, 130)];
        _labNum.numberOfLines = 100;
        _labNum.font = labelFontStyle;
        [self addSubview:_labNum];
    }
    return _labNum;
}
//优惠详细信息
-(UILabel *)labTitle{
    if (_labTitle==nil) {
        _labTitle = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4.5, 20, DEVICEWIDTH/3*2, 70)];
        _labTitle.numberOfLines = 0;
        _labTitle.font = titleFontStyle;
        _labTitle.textColor = [UIColor colorWithRed:0.47 green:0.16 blue:0.04 alpha:1.00];
        [self addSubview:_labTitle];
    }
    return _labTitle;
}

//有效期
-(UILabel *)labTime{
    if (_labTime==nil) {
        _labTime = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 95, DEVICEWIDTH/2*1.3, 20)];
        _labTime.textAlignment = NSTextAlignmentCenter;
        _labTime.font = labelFontStyle;
        _labTime.textColor = [UIColor whiteColor];
        [self addSubview:_labTime];
    }
    return _labTime;
}







@end
