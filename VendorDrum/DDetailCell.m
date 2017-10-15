//
//  DDetailTableViewCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/2.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "DDetailCell.h"

@implementation DDetailCell

//商品图片
-(UIImageView*)proImage{
    if (_proImage ==nil) {
        _proImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        [self addSubview:_proImage];
    }
    return _proImage;
}
//商品名字
-(UILabel *)nameLab{
    if (_nameLab == nil) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, DEVICEWIDTH-110, 30)];
        _nameLab.font = normalFontStyle;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
//商品价格
-(UILabel *)priceLab{
    if (_priceLab == nil) {
        _priceLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 100, 30)];
        _priceLab.font = labelFontStyle;
        _priceLab.textColor = [UIColor redColor];
        [self addSubview:_priceLab];
    }
    return _priceLab;
}
//单品总数
-(UILabel *)numLab{
    
    if (_numLab == nil) {
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-50, 40, 30, 30)];
        _numLab.font = labelFontStyle;
        _numLab.textColor = [UIColor grayColor];
        [self addSubview:_numLab];
    }
    return _numLab;
}
//商品件数
-(UILabel *)jianLab{
    if (_jianLab == nil) {
        _jianLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, DEVICEWIDTH-40, 30)];
        _jianLab.font = labelFontStyle;
        _jianLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:_jianLab];
    }
    return _jianLab;
}

//优惠和实付金额
-(UILabel *)YouHLab{
    if (_YouHLab == nil) {
        _YouHLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, DEVICEWIDTH-40, 30)];
        _YouHLab.font = labelFontStyle;
        _YouHLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:_YouHLab];
    }
    return _YouHLab;
}
//联系店家
-(UIButton *)kfBtn{
    if (_kfBtn==nil) {
        _kfBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-130,10,100, 35)];
        _kfBtn.layer.cornerRadius = 17.5;
        _kfBtn.titleLabel.font=normalFontStyle;
        [_kfBtn setTitle:@"联系店家" forState:UIControlStateNormal];
        [_kfBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _kfBtn.backgroundColor = [UIColor colorWithRed:0.11 green:0.59 blue:0.10 alpha:1.00];
        [self addSubview:_kfBtn];
    }
    return _kfBtn;
}
@end
