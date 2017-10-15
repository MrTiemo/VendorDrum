//
//  ChangeFahuoCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/12.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ChangeFahuoCell.h"

@implementation ChangeFahuoCell

-(UILabel *)labName{
    if (_labName==nil) {
        
        _labName = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH/4, 50)];
        _labName.textAlignment = NSTextAlignmentCenter;
        _labName.font = labelFontStyle;
        [self addSubview:_labName];
    }
    return _labName;
}

-(UITextField *)textField{
    if (_textField==nil) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 10,DEVICEWIDTH- DEVICEWIDTH/4-10, 30)];
        _textField.font = labelFontStyle;
        _textField.layer.cornerRadius = 2;
        _textField.layer.borderColor= [UIColor grayColor].CGColor;
        _textField.layer.borderWidth= 0.5f;
        _textField.returnKeyType =UIReturnKeyDone;
        [self addSubview:_textField];
    }
    return _textField;
}

-(UILabel *)labAddress{
    if (_labAddress==nil) {
        _labAddress = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 10,DEVICEWIDTH- DEVICEWIDTH/4-10, 30)];
        _labAddress.font = labelFontStyle;
        _labAddress.numberOfLines = 0;
        [self addSubview:_labAddress];
    }
    return _labAddress;
}


@end
