//
//  NewsCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/6.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell
-(UIView *)viewB{
    if (_viewB==nil) {
        _viewB = [[UIView alloc] initWithFrame:CGRectMake(12, 7, 6, 6)];
        _viewB.layer.cornerRadius = 3;
        [self addSubview:_viewB];
    }
    return _viewB;
}
-(UILabel *)titleLab{
    if (_titleLab==nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 20)];
        _titleLab.textColor = BlackColor;
        _titleLab.font = normalFontStyle;
        [self addSubview:_titleLab];
    }
    return _titleLab;
}
//
-(UILabel *)neiLab{
    if (_neiLab==nil) {
        _neiLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, DEVICEWIDTH-40, 40)];
        _neiLab.textColor = [UIColor grayColor];
        _neiLab.numberOfLines = 0;
        _neiLab.font = labelFontStyle;
        [self addSubview:_neiLab];
    }
    return _neiLab;
}
//
-(UILabel *)timeLab{
    if (_timeLab==nil) {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 60, DEVICEWIDTH-40, 20)];
        _timeLab.textColor = [UIColor grayColor];
        _timeLab.font = labelFontStyle;
        _timeLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:_timeLab];
    }
    return _timeLab;
}

@end
