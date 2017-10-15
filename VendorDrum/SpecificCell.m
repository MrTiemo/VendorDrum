//
//  SpecificCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "SpecificCell.h"

@implementation SpecificCell

//消费原因
-(UILabel *)labWhy{
    if (_labWhy==nil) {
        _labWhy = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 40, 30)];
        _labWhy.font = normalFontStyle;
        [self addSubview:_labWhy];
    }
    return _labWhy;
}
//订单号
-(UILabel *)labDing{
    if (_labDing==nil) {
        _labDing = [[UILabel alloc] initWithFrame:CGRectMake(60, 10, 150, 30)];
        _labDing.font = labelFontStyle;
        _labDing.textColor = [UIColor grayColor];
        [self addSubview:_labDing];
    }
    return _labDing;
}
//处理时间
-(UILabel *)labTime{
    if (_labTime==nil) {
        _labTime = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 200, 30)];
        _labTime.font = normalFontStyle;
        [self addSubview:_labTime];
    }
    return _labTime;
}
//金额变化
-(UILabel *)labPrice{
    if (_labPrice==nil) {
        _labPrice = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-80, 20, 60, 30)];
        _labPrice.font = normalFontStyle;
        _labPrice.textAlignment = NSTextAlignmentRight;
        [self addSubview:_labPrice];
    }
    return _labPrice;
}


@end
