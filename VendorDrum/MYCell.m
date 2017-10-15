//
//  MYCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/5.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "MYCell.h"

@implementation MYCell

//
-(UIImageView *)imageHead{
    if (_imageHead==nil) {
        _imageHead = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
        _imageHead.layer.cornerRadius = 30;
        _imageHead.layer.masksToBounds = YES;
        [self addSubview:_imageHead];
    }
    return _imageHead;
}
-(UILabel *)nameLab{
    if (_nameLab==nil) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 20, DEVICEWIDTH-100, 20)];
        _nameLab.textColor = BlackColor;
        _nameLab.font = normalFontStyle;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
-(UILabel *)numLab{
    if (_numLab==nil) {
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, DEVICEWIDTH-100, 20)];
        _numLab.textColor = NavaCOLOR;
        _numLab.font = labelFontStyle;
        [self addSubview:_numLab];
    }
    return _numLab;
}

//
-(UIImageView *)imageV{
    if (_imageV==nil) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 30, 30)];
        [self addSubview:_imageV];
    }
    return _imageV;
}
-(UILabel *)titLab{
    if (_titLab==nil) {
        _titLab = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 100, 20)];
        _titLab.textColor = BlackColor;
        _titLab.font = normalFontStyle;
        [self addSubview:_titLab];
    }
    return _titLab;
}
//电话
-(UILabel *)telephone{
    if (_telephone==nil) {
        _telephone = [[UILabel alloc] initWithFrame:CGRectMake(180, 10, 100, 20)];
        _telephone.textColor = BlackColor;
        _telephone.font = normalFontStyle;
        [self addSubview:_telephone];
    }
    return _telephone;
}
@end
