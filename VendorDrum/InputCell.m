//
//  InputCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/16.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "InputCell.h"

@implementation InputCell
-(UILabel *)Label{
    if (_Label==nil) {
        
        _Label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH/4, 50)];
        _Label.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
        _Label.font = normalFontStyle;
        _Label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_Label];
    }
    return _Label;
}
-(UIView*)SectionV{
    if (_SectionV==nil) {
        _SectionV = [[UIView alloc] initWithFrame:CGRectMake(0, 50, DEVICEWIDTH, 20)];
        [self addSubview:_SectionV];
    }
    return _SectionV;
}
-(UITextView *)textFie{
    if (_textFie==nil) {
        _textFie = [[UITextView alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH*0.75, 50)];
        _textFie.font = normalFontStyle;
        _textFie.textAlignment = NSTextAlignmentCenter;
        _textFie.returnKeyType = UIReturnKeyDone;
        _textFie.textColor = [UIColor grayColor];
//        _textFie.clearsOnInsertion = YES;
        [self addSubview:_textFie];
    }
    return _textFie;
}
-(UILabel *)OneLab{
    if (_OneLab==nil) {
        
        _OneLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH*0.75, 50)];
        _OneLab.font = normalFontStyle;
        _OneLab.textAlignment = NSTextAlignmentCenter;
        _OneLab.numberOfLines = 0;
        _OneLab.textColor = [UIColor grayColor];
        [self addSubview:_OneLab];
    }
    return _OneLab;
}
@end
