//
//  PayCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/29.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "PayCell.h"

@implementation PayCell

//
-(UIImageView *)imagePro{
    if (_imagePro ==nil) {
        _imagePro = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        [self addSubview:_imagePro];
    }
    return _imagePro;
}
-(UILabel *)nameLab{
    if (_nameLab ==nil) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 100, 30)];
        _nameLab.font = normalFontStyle;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
-(UILabel *)priceLab{
    if (_priceLab ==nil) {
        _priceLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 40, 100, 30)];
        _priceLab.textColor = [UIColor redColor];
        _priceLab.font = normalFontStyle;
        [self addSubview:_priceLab];
    }
    return _priceLab;
}
-(UILabel *)numLab{
    if (_numLab ==nil) {
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(200, 20, 100, 30)];
        _numLab.font = normalFontStyle;
        _numLab.textColor = [UIColor grayColor];
        [self addSubview:_numLab];
    }
    return _numLab;
}
//
-(UILabel *)listLab{
    if (_listLab ==nil) {
        _listLab = [[UILabel alloc] initWithFrame:CGRectMake(0,5,DEVICEWIDTH/3, 30)];
        _listLab.font = normalFontStyle;
        _listLab.textAlignment = NSTextAlignmentCenter;
        _listLab.textColor = [UIColor grayColor];
        [self addSubview:_listLab];
    }
    return _listLab;
}
-(UILabel *)dataLab{
    if (_dataLab ==nil) {
        _dataLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 5, DEVICEWIDTH/3, 30)];
        _dataLab.font = normalFontStyle;
//        _dataLab.textColor = [UIColor grayColor];
        _dataLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_dataLab];
    }
    return _dataLab;
}
-(UIButton *)sureBtn{
    if (_sureBtn==nil) {
        _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-50, 5, 30, 30)];
        [_sureBtn setImage:[UIImage imageNamed:@"checked"] forState:UIControlStateNormal];   
        [self addSubview:_sureBtn];
    }
    return _sureBtn;
}
-(UITextField *)textV{

    if (_textV ==nil) {
        _textV = [[UITextField alloc] initWithFrame:CGRectMake(20, 5, DEVICEWIDTH-40, 30)];
        _textV.font = normalFontStyle;
        _textV.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
        _textV.layer.cornerRadius = 5;
        _textV.placeholder = @"备注：";
        //返回键的类型
        _textV.returnKeyType = UIReturnKeyDone;
        [self addSubview:_textV];
    }
    return _textV;
}
@end
