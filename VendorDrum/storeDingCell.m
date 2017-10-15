//
//  storeDingCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/10.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "storeDingCell.h"

@implementation storeDingCell

-(UILabel *)labUsername{
    if (_labUsername==nil) {
        _labUsername = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 80, 30)];
        _labUsername.font = labelFontStyle;
        [self addSubview:_labUsername];
    }
    return _labUsername;
}
-(UILabel *)labBian{
    if (_labBian==nil) {
        _labBian = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, DEVICEWIDTH-180, 30)];
        _labBian.font = labelFontStyle;
        _labBian.textAlignment = NSTextAlignmentRight;
        [self addSubview:_labBian];
    }
    return _labBian;
}
-(UILabel *)labBackground{
    if (_labBackground==nil) {
        _labBackground = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-70, 5, 0.5, 20)];
        _labBackground.font = labelFontStyle;
        [self addSubview:_labBackground];
    }
    return _labBackground;
}
-(UILabel *)labZhuang{
    if (_labZhuang==nil) {
        _labZhuang = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-60, 0, 50, 30)];
        _labZhuang.font = labelFontStyle;
        _labZhuang.textColor = [UIColor redColor];
        [self addSubview:_labZhuang];
    }
    return _labZhuang;
}
-(UIImageView *)imaV{
    if (_imaV==nil) {
        _imaV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
        [self addSubview:_imaV];
    }
    return _imaV;
}
-(UILabel *)labProName{
    if (_labProName==nil) {
        _labProName = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, 150, 30)];
        _labProName.font = normalFontStyle;
        [self addSubview:_labProName];
    }
    return _labProName;
}
-(UILabel *)labPrice{
    if (_labPrice==nil) {
        _labPrice = [[UILabel alloc] initWithFrame:CGRectMake(90, 40, 100, 30)];
        _labPrice.font = labelFontStyle;
        _labPrice.textColor = [UIColor redColor];
        [self addSubview:_labPrice];
    }
    return _labPrice;
}
-(UILabel *)labNum{
    if (_labNum==nil) {
        _labNum = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-40, 10, 20, 40)];
        _labNum.font = labelFontStyle;
        [self addSubview:_labNum];
    }
    return _labNum;
}
-(UILabel *)labGongji{
    if (_labGongji==nil) {
        _labGongji = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3-80, 0, DEVICEWIDTH/3, 30)];
        _labGongji.font = labelFontStyle;
        _labGongji.textAlignment = NSTextAlignmentRight;
        [self addSubview:_labGongji];
    }
    return _labGongji;
}
-(UILabel *)labAllprice{
    if (_labAllprice==nil) {
        _labAllprice = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3*2-70, 0,DEVICEWIDTH-(DEVICEWIDTH/3*2-60), 30)];
        _labAllprice.font = labelFontStyle;
        [self addSubview:_labAllprice];
    }
    return _labAllprice;
}
//＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊


-(UIButton *)buttonLeft{
    if (_buttonLeft==nil) {
        _buttonLeft = [[UIButton alloc] initWithFrame:CGRectMake(10, 5, DEVICEWIDTH/2-20, 30)];
        _buttonLeft.backgroundColor = NavaCOLOR;
        _buttonLeft.titleLabel.font = normalFontStyle;
        _buttonLeft.titleLabel.textAlignment = NSTextAlignmentCenter;
        _buttonLeft.layer.cornerRadius = 2;
        [self addSubview:_buttonLeft];
    }
    return _buttonLeft;
}
-(UIButton *)buttonRight{
    if (_buttonRight==nil) {
        _buttonRight = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2+10, 5, DEVICEWIDTH/2-20, 30)];
        _buttonRight.backgroundColor = [UIColor colorWithRed:0.22 green:0.68 blue:1.00 alpha:1.00];
        _buttonRight.titleLabel.font = normalFontStyle;
        _buttonRight.titleLabel.textAlignment = NSTextAlignmentCenter;
        _buttonRight.layer.cornerRadius = 2;
        [self addSubview:_buttonRight];
    }
    return _buttonRight;
}


//＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

-(UILabel *)labTui{
    if (_labTui==nil) {
        _labTui = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, 40)];
        _labTui.font = labelFontStyle;
        _labTui.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_labTui];
    }
    return _labTui;
}
-(UILabel *)labBackTui{
    if (_labBackTui==nil) {
        _labBackTui = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 0.5, 20)];
        _labBackTui.backgroundColor = [UIColor grayColor];
        [self addSubview:_labBackTui];
    }
    return _labBackTui;
}
-(UILabel *)labReason{
    if (_labReason==nil) {
        _labReason = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, DEVICEWIDTH-100, 40)];
        _labReason.font = labelFontStyle;
        _labReason.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_labReason];
    }
    return _labReason;
}



@end
