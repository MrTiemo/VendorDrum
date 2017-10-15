//
//  MarketCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/26.
//  Copyright © 2016年 爱尚家. All rights reserved.
//
#import "MarketCell.h"

@implementation MarketCell
//评价
-(UILabel *)pingLab{
    if (_pingLab==nil) {
        _pingLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 0,DEVICEWIDTH/3*2-20, 40)];
        _pingLab.font = labelFontStyle;
        _pingLab.textAlignment = NSTextAlignmentLeft;
//        _pingLab.lineBreakMode = UILineBreakModeWordWrap;
        [_pingLab setLineBreakMode:NSLineBreakByWordWrapping];
        _pingLab.numberOfLines = 0;
        [self addSubview:_pingLab];
    }
    return _pingLab;
}
//头像
-(UIImageView*)headImaV{
    if (_headImaV==nil) {
        _headImaV = [[UIImageView alloc] initWithFrame:CGRectMake(10,45,30,30)];
        _headImaV.layer.cornerRadius = 15;
        [self addSubview:_headImaV];
    }
    return _headImaV;
}
//用户名
-(UILabel *)nameLab{
    if (_nameLab==nil) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(45, 45,100, 30)];
        _nameLab.font = labelFontStyle;
        _nameLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
//日期
-(UILabel *)timeLab{
    if (_timeLab==nil) {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(150, 45,100, 30)];
        _timeLab.font = labelFontStyle;
        _timeLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_timeLab];
    }
    return _timeLab;
}
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
-(UILabel *)shouLab{
 
    if (_shouLab==nil) {
        _shouLab = [[UILabel alloc]initWithFrame:CGRectMake(180, 0, 100, 20)];
        _shouLab.font = labelFontStyle;
        _shouLab.textColor = [UIColor grayColor];
        _shouLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_shouLab];
    }
    return _shouLab;
}
-(UILabel *)priceLab{
    if (_priceLab==nil) {
    
        _priceLab = [[UILabel alloc]initWithFrame:CGRectMake(80, 20, 60, 20)];
        _priceLab.font = labelFontStyle;
        _priceLab.textColor = [UIColor redColor];
        [self addSubview:_priceLab];
    }
    return _priceLab;
}
-(UILabel *)oldPriceLab{
    if (_oldPriceLab==nil) {
        _oldPriceLab = [[UILabel alloc] initWithFrame:CGRectMake(140, 20, 100, 20)];
        _oldPriceLab.textColor = [UIColor grayColor];
        _oldPriceLab.font = labelFontStyle;
        _oldPriceLab.textAlignment = NSTextAlignmentLeft;
        NSString *oldStr = [NSString stringWithFormat:@"¥100.00"];
        //中划线
        NSDictionary *attribtDic =@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:oldStr attributes:attribtDic];
        _oldPriceLab.attributedText = attribtStr;
        [self addSubview:_oldPriceLab];
    }
    return _oldPriceLab;
}
@end
