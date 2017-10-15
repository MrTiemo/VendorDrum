//
//  NewProCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/11.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "NewProCell.h"

@implementation NewProCell



-(UIImageView *)imageV{
    if (_imageV==nil) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 60, 60)];
        [self addSubview:_imageV];
    }
    return _imageV;
}

-(UILabel *)labName{
    if (_labName==nil) {
        _labName = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 100, 20)];
        _labName.font = normalFontStyle;
        [self addSubview:_labName];
    }
    return _labName;
}
-(UILabel *)labPrice{
    if (_labPrice==nil) {
        _labPrice = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-80, 10, 60, 20)];
        _labPrice.textColor = [UIColor redColor];
        _labPrice.font = labelFontStyle;
        [self addSubview:_labPrice];
    }
    return _labPrice;
}
@end
