//
//  StoreEditCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "StoreEditCell.h"

@implementation StoreEditCell


-(UILabel *)LabelA{
    if (_LabelA==nil) {
        _LabelA = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, DEVICEWIDTH/4-10, 40)];
        _LabelA.font = normalFontStyle;
        [self addSubview:_LabelA];
    }
    return _LabelA;
}

-(UILabel *)LabelB{
    if (_LabelB==nil) {
        _LabelB = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, DEVICEWIDTH/4-10, 80)];
        _LabelB.font = normalFontStyle;
        [self addSubview:_LabelB];
    }
    return _LabelB;
}

-(UITextField *)textA{
    if (_textA==nil) {
        _textA = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4+10, 2, DEVICEWIDTH*0.75-20, 36)];
        _textA.font = labelFontStyle;
        _textA.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _textA.layer.borderWidth = 0.5;
        _textA.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textA];
    }
    return _textA;
}

-(UITextField *)textB{
    if (_textB==nil) {
        _textB = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4+10, 5,DEVICEWIDTH*0.75-20, 70)];
        _textB.font = labelFontStyle;
        _textB.layer.borderColor = [UIColor lightGrayColor].CGColor; // set color as you want.
        _textB.layer.borderWidth = 0.5; // set borderWidth as you want.
        _textB.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textB];
    }
    return _textB;
}

-(UILabel *)labDZ{
    if (_labDZ==nil) {
        _labDZ = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4+10, 2, DEVICEWIDTH*0.75-30, 36)];
        _labDZ.font = labelFontStyle;
        _labDZ.numberOfLines = 0;
        [self addSubview:_labDZ];
    }
    return _labDZ;
}

-(UILabel *)labLX{
    if (_labLX==nil) {
        _labLX = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4+10, 2, DEVICEWIDTH*0.75-30, 36)];
        _labLX.font = labelFontStyle;
        _labLX .numberOfLines = 0;
        [self addSubview:_labLX];
    }
    return _labLX;
}




@end
