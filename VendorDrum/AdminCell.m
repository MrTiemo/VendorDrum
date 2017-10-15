//
//  AdminCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/7.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "AdminCell.h"

@implementation AdminCell
//----------------------------------------------------------------------------------
-(UIImageView *)goodsImg{
    if (_goodsImg==nil) {
        _goodsImg = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 70, 70)];
        _goodsImg.backgroundColor = [UIColor grayColor];
        [self addSubview:_goodsImg];
    }
    return _goodsImg;
}
-(UILabel *)titleLab{
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(80, 0, 100, 20)];
        _titleLab.font = labelFontStyle;
        [self addSubview:_titleLab];
    }
    return _titleLab;
}
-(UILabel *)priceLab{
    if (_priceLab==nil) {
        
        _priceLab = [[UILabel alloc]initWithFrame:CGRectMake(80, 50, 60, 20)];
        _priceLab.font = labelFontStyle;
        _priceLab.textColor = [UIColor redColor];
        [self addSubview:_priceLab];
    }
    return _priceLab;
}
-(UILabel *)yuShouLab{
    if (_yuShouLab==nil) {
        _yuShouLab = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, 60, 20)];
        _yuShouLab.font = labelFontStyle;
        _yuShouLab.textColor = [UIColor colorWithRed:0.17 green:0.67 blue:0.25 alpha:1.00];
        [self addSubview:_yuShouLab];
    }
    return _yuShouLab;
}
-(UIButton *)EditBtn{
    if (_EditBtn==nil) {
        _EditBtn = [[UIButton alloc]initWithFrame:CGRectMake(DEVICEWIDTH/3*2-80, 50, 40, 20)];
        _EditBtn.titleLabel.font = labelFontStyle;
        _EditBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [_EditBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_EditBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [self addSubview:_EditBtn];
    }
    return _EditBtn;
}
-(UIButton *)upBtn{
    if (_upBtn==nil) {
        _upBtn = [[UIButton alloc]initWithFrame:CGRectMake(DEVICEWIDTH/3*2-40, 50, 40, 20)];
        _upBtn.titleLabel.font = labelFontStyle;
        [_upBtn setTitleColor:[UIColor colorWithRed:0.17 green:0.67 blue:0.25 alpha:1.00] forState:UIControlStateNormal];
        [_upBtn setTitle:@"上架" forState:UIControlStateNormal];
        [self addSubview:_upBtn];
    }
    return _upBtn;
}
-(UIButton *)downBtn{
    if (_downBtn==nil) {
        _downBtn = [[UIButton alloc]initWithFrame:CGRectMake(DEVICEWIDTH/3*2-40, 50, 40, 20)];
        _downBtn.titleLabel.font = labelFontStyle;
        [_downBtn setTitle:@"下架" forState:UIControlStateNormal];
        [_downBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self addSubview:_downBtn];
    }
    return _downBtn;
}



@end
