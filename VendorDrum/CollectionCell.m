//
//  CollectionCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/9.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell


//图片
-(UIImageView *)imagePro{

    if (_imagePro==nil) {
        _imagePro = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        [self addSubview:_imagePro];
    }

    return _imagePro;
}

//名字
-(UILabel *)nameLab{
    
    if (_nameLab==nil) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 100, 40)];
        _nameLab.font = normalFontStyle;
        _nameLab.numberOfLines = 0;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
//销量
-(UILabel *)numLab{
    
    if (_numLab==nil) {
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(200, 10, 80, 20)];
        _numLab.font = labelFontStyle;
        _numLab.textColor = [UIColor grayColor];
        [self addSubview:_numLab];
    }
    return _numLab;
}
//价格
-(UILabel *)priceLab{
    
    if (_priceLab ==nil) {
        _priceLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 80, 30)];
        _priceLab.font = labelFontStyle;
        _priceLab.textColor = NavaCOLOR;
        [self addSubview:_priceLab];
    }
    return _priceLab;
}


//收藏按钮
-(UIButton *)ShouBtn{
    
    if (_ShouBtn ==nil) {
        _ShouBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-50, 30, 30, 30)];
        [_ShouBtn setBackgroundImage:[UIImage imageNamed:@"sta"] forState:UIControlStateNormal];
        _ShouBtn.layer.borderWidth = 0.5;
        _ShouBtn.layer.borderColor=[UIColor grayColor].CGColor;
        [self addSubview:_ShouBtn];
    }
    return _ShouBtn;
}


@end
