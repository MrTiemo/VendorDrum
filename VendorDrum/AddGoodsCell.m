//
//  AddGoodsCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "AddGoodsCell.h"

@implementation AddGoodsCell


-(UIImageView *)imageBtn{
    if (_imageBtn==nil) {
        
        _imageBtn = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 20, 20)];
        [self addSubview:_imageBtn];
        
    }
    return _imageBtn;
}
-(UIImageView *)imageV{
    
    if (_imageV==nil) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(40, 5, 45, 45)];
        [self addSubview:_imageV];
    }
    return _imageV;
}
-(UILabel *)labName{

    if (_labName==nil) {
        _labName = [[UILabel alloc] initWithFrame:CGRectMake(90, 5, 100, 15)];
        _labName.font = labelFontStyle;
        [self addSubview:_labName];
    }
    return _labName;

}
-(UILabel *)labPrice{
    
    if (_labPrice==nil) {
        _labPrice = [[UILabel alloc] initWithFrame:CGRectMake(90, 20, 100, 15)];
        _labPrice.font = labelFontStyle;
        _labPrice.textColor = [UIColor redColor];
        [self addSubview:_labPrice];
    }
    return _labPrice;
    
}
-(UILabel *)labYun{
    
    if (_labYun==nil) {
        _labYun = [[UILabel alloc] initWithFrame:CGRectMake(90, 35, 100, 15)];
        _labYun.font = labelFontStyle;
        _labYun.textColor = [UIColor grayColor];
        [self addSubview:_labYun];
    }
    return _labYun;
    
}
-(UILabel *)labTime{
    
    if (_labTime==nil) {
        _labTime = [[UILabel alloc] initWithFrame:CGRectMake(40, 55, 100, 20)];
        _labTime.font = labelFontStyle;
        _labTime.textColor = [UIColor grayColor];
        [self addSubview:_labTime];
    }
    return _labTime;
    
}

-(UILabel *)labYushou{
    
    if (_labYushou==nil) {
        _labYushou = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-100, 5, 90, 20)];
        _labYushou.textColor = [UIColor colorWithRed:0.17 green:0.67 blue:0.25 alpha:1.00];
        _labYushou.textAlignment = NSTextAlignmentRight;
        _labYushou.font = labelFontStyle;
        [self addSubview:_labYushou];
    }
    return _labYushou;
    
}

-(UILabel *)labKu{
    
    if (_labKu==nil) {
        _labKu = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-100, 5, 90, 20)];
        _labKu.textColor = [UIColor grayColor];
        _labKu.textAlignment = NSTextAlignmentRight;
        [self addSubview:_labKu];
    }
    return _labKu;
    
}



@end
