//
//  BuyTwoCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/26.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "BuyTwoCell.h"

@implementation BuyTwoCell
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
