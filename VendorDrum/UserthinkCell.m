//
//  UserthinkCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/15.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "UserthinkCell.h"

@implementation UserthinkCell

-(TQStarRatingView*)starRatingView{
    if (_starRatingView == nil) {
        _starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(10,10,60,20)];
        _starRatingView.userInteractionEnabled = NO;
        [self addSubview:_starRatingView];
    }
    return _starRatingView;
}
-(UILabel *)pingLab{
    if (_pingLab ==nil) {
        _pingLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, DEVICEWIDTH-20, 20)];
        _pingLab.font = labelFontStyle;
        [self addSubview:_pingLab];
    }
    return _pingLab;
}
-(UILabel *)timeLab{
    if (_timeLab ==nil) {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 200, 20)];
        _timeLab.font = labelFontStyle;
        _timeLab.textColor = [UIColor grayColor];
        [self addSubview:_timeLab];
    }
    return _timeLab;
}
-(UILabel *)nameLab{
    if (_nameLab ==nil) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-100, 10, 90, 20)];
        _nameLab.font = labelFontStyle;
        _nameLab.textColor = [UIColor grayColor];
        _nameLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}





@end
