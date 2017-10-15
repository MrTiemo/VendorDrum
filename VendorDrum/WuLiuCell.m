//
//  WuLiuCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/2.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "WuLiuCell.h"

@implementation WuLiuCell
//商品信息等

-(UIImageView*)proImage{
    if (_proImage==nil) {
        _proImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        [self addSubview:_proImage];
    }
    return _proImage;
}

-(UILabel *)wuliu{
    if (_wuliu == nil) {
        _wuliu = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, DEVICEWIDTH-100, 20)];
        _wuliu.font = labelFontStyle;
        [self addSubview:_wuliu];
    }
    return _wuliu;
}
-(UILabel *)gongshi{
    if (_gongshi == nil) {
        _gongshi = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, DEVICEWIDTH-100, 20)];
        _gongshi.font = labelFontStyle;
        [self addSubview:_gongshi];
    }
    return _gongshi;
}
-(UILabel *)bianhao{
    if (_bianhao == nil) {
        _bianhao = [[UILabel alloc] initWithFrame:CGRectMake(80, 40, DEVICEWIDTH-100, 20)];
        _bianhao.font = labelFontStyle;
        [self addSubview:_bianhao];
    }
    return _bianhao;
}
-(UILabel *)dianhua{
    if (_dianhua == nil) {
        _dianhua = [[UILabel alloc] initWithFrame:CGRectMake(80, 60, DEVICEWIDTH-100, 20)];
        _dianhua.font = labelFontStyle;
        [self addSubview:_dianhua];
    }
    return _dianhua;
}
//物流跟踪信息
-(UIView *)ViewXian{
    if (_ViewXian==nil) {
        _ViewXian = [[UIView alloc] initWithFrame:CGRectMake(30, 0, 2, 80)];
        [self addSubview:_ViewXian];
    }
    return _ViewXian;
}
-(UIView *)ViewXia{
    if (_ViewXia==nil) {
        _ViewXia = [[UIView alloc] initWithFrame:CGRectMake(30, 40, 2, 40)];
        [self addSubview:_ViewXia];
    }
    return _ViewXia;
}
-(UIView *)ViewShang{
    if (_ViewShang==nil) {
        _ViewShang = [[UIView alloc] initWithFrame:CGRectMake(30, 0, 2, 40)];
        [self addSubview:_ViewShang];
    }
    return _ViewShang;
}
-(UIView *)lineCell{
    if (_lineCell==nil) {
        _lineCell = [[UIView alloc] initWithFrame:CGRectMake(50, 79.5, DEVICEWIDTH-60, 0.5)];
        [self addSubview:_lineCell];
    }
    return _lineCell;
}
-(UIImageView *)imageWu{
    if (_imageWu==nil) {
        _imageWu = [[UIImageView alloc] initWithFrame:CGRectMake(26, 35, 10, 10)];
        _imageWu.backgroundColor = [UIColor whiteColor];
        [self addSubview:_imageWu];
    }
    return _imageWu;
}
-(UILabel *)xinxiLab{
    if (_xinxiLab == nil) {
        _xinxiLab = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, DEVICEWIDTH-100, 30)];
        _xinxiLab.font = normalFontStyle;
        [self addSubview:_xinxiLab];
    }
    return _xinxiLab;
}
-(UILabel *)timeLab{
    if (_timeLab == nil) {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(60, 40, DEVICEWIDTH-100, 30)];
        _timeLab.font = labelFontStyle;
        _timeLab.textColor = [UIColor grayColor];
        [self addSubview:_timeLab];
    }
    return _timeLab;
}
//确认收货按钮
-(UIButton *)sureBtn{
    if (_sureBtn==nil) {
        _sureBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-150,10,120, 40)];
        _sureBtn.layer.cornerRadius = 20;
        _sureBtn.titleLabel.font=normalFontStyle;
        [_sureBtn setTitle:@"确认收货" forState:UIControlStateNormal];
        _sureBtn.backgroundColor = [UIColor colorWithRed:0.08 green:0.59 blue:0.09 alpha:1.00];
        [self addSubview:_sureBtn];
    }
    return _sureBtn;

}








@end
