//
//  ChangeTuiCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/12.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ChangeTuiCell.h"

@implementation ChangeTuiCell

-(UIView*)viewBack{
    if (_viewBack==nil) {
        _viewBack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH/3, 60)];
        _viewBack.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
        [self addSubview:_viewBack];
    }
    return _viewBack;
}

-(UILabel*)starLab{
    if (_starLab==nil) {
        _starLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH/12, 60)];
        _starLab.textAlignment = NSTextAlignmentRight;
        _starLab.textColor = [UIColor redColor];
        _starLab.font = normalFontStyle;
        [_viewBack addSubview:_starLab];
    }
    return _starLab;
}
-(UILabel*)fuwuLab{
    if (_fuwuLab==nil) {
        _fuwuLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/12,0, DEVICEWIDTH/12*3, 60)];
        _fuwuLab.textAlignment = NSTextAlignmentLeft;
        _fuwuLab.font = normalFontStyle;
        [_viewBack addSubview:_fuwuLab];
    }
    return _fuwuLab;
}

-(UIView*)viewLine{
    if (_viewLine==nil) {
        _viewLine = [[UIView alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 0, 0.5, 60)];
        _viewLine.backgroundColor = [UIColor grayColor];
        [self addSubview:_viewLine];
    }
    return _viewLine;
}
@end
