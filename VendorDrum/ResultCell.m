//
//  ResultCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/21.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ResultCell.h"

@implementation ResultCell
#pragma mark  ----  显示店铺列表
-(UIImageView *)ShopIma{

    if (_ShopIma==nil) {
        _ShopIma = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
//        _ShopIma.backgroundColor = [UIColor grayColor];
        [self addSubview:_ShopIma];
    }
    return _ShopIma;
}
-(UILabel *)ShopName{

    if (_ShopName==nil) {
        _ShopName = [[UILabel alloc] initWithFrame:CGRectMake(70, 10, DEVICEWIDTH-80, 24)];
        _ShopName.font = titleFontStyle;
        [self addSubview:_ShopName];
    }
    return _ShopName;
}
-(UILabel *)ShopAddress{
    
    if (_ShopAddress==nil) {
        _ShopAddress = [[UILabel alloc] initWithFrame:CGRectMake(70, 35, DEVICEWIDTH-80, 25)];
        _ShopAddress.font = normalFontStyle;
        [self addSubview:_ShopAddress];
    }
    return _ShopAddress;
}
-(UIImageView *)ImaProOne{
    
    if (_ImaProOne==nil) {
        _ImaProOne = [[UIImageView alloc] initWithFrame:CGRectMake(10, 70, (DEVICEWIDTH-20)/3*2-1, 160)];
        [self addSubview:_ImaProOne];
    }
    return _ImaProOne;
}
-(UIImageView *)ImaProTwo{
    
    if (_ImaProTwo==nil) {
        _ImaProTwo = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICEWIDTH-20)/3*2+10, 70, (DEVICEWIDTH-20)/3, 79)];
        [self addSubview:_ImaProTwo];
    }
    return _ImaProTwo;
}
-(UIImageView *)ImaProThree{
    
    if (_ImaProThree==nil) {
        _ImaProThree = [[UIImageView alloc] initWithFrame:CGRectMake((DEVICEWIDTH-20)/3*2+10, 150, (DEVICEWIDTH-20)/3, 80)];
        [self addSubview:_ImaProThree];
    }
    return _ImaProThree;
}
-(UILabel *)ShopPro{
    if (_ShopPro==nil) {
        _ShopPro = [[UILabel alloc] initWithFrame:CGRectMake(10, 240, DEVICEWIDTH-20, 24)];
        _ShopPro.font = normalFontStyle;
        [self addSubview:_ShopPro];
    }
    return _ShopPro;
}
-(UILabel *)ShopNum{
    if (_ShopNum==nil) {
        _ShopNum = [[UILabel alloc] initWithFrame:CGRectMake(10, 265, DEVICEWIDTH-20, 25)];
        _ShopNum.font = labelFontStyle;
        [self addSubview:_ShopNum];
    }
    return _ShopNum;
}
#pragma mark  ----  显示商品列表
-(UIImageView *)ProImage{
    if (_ProImage==nil) {
        _ProImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        [self addSubview:_ProImage];
    }
    return _ProImage;
}
-(UILabel *)ProLabel{
    if (_ProLabel==nil) {
        _ProLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, DEVICEWIDTH/3, 39)];
        _ProLabel.font = normalFontStyle;
        [self addSubview:_ProLabel];
    }
    return _ProLabel;

}
-(UILabel *)priLabel{

    if (_priLabel==nil) {
        _priLabel = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3+110, 10, DEVICEWIDTH-(DEVICEWIDTH/3+110), 39)];
        _priLabel.font = labelFontStyle;
        _priLabel.textColor = [UIColor redColor];
        _priLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_priLabel];
    }
    return _priLabel;
}


@end
