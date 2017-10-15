//
//  SearchCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/20.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "SearchCell.h"

@interface SearchCell ()

@property(nonatomic,strong)NSMutableArray *arrHot;

@end

@implementation SearchCell


-(UIButton *)hotBtn{

    if (_hotBtn==nil) {
        for (int i=0; i<5; i++) {
            CGFloat widths = (DEVICEWIDTH-100)/4;//按钮宽度
            CGFloat heights = 30;//按钮高度
            CGFloat margin = 10;
            CGFloat startX = 15;
            CGFloat startY = 10;
            for (int i = 0; i < 10; i++) {
                _hotBtn = [[UIButton alloc]init];
                _hotBtn.tag = i;
                NSString *str = [NSString stringWithFormat:@"%@",[_arrHot objectAtIndex:i]];
                [_hotBtn setTitle:str forState:UIControlStateNormal];
                _hotBtn.titleLabel.font = labelFontStyle;
                _hotBtn.backgroundColor = [UIColor colorWithRed:0.10*i green:0.79 blue:0.68*i alpha:1.00];
                _hotBtn.layer.cornerRadius = 10;
                _hotBtn.showsTouchWhenHighlighted = YES;
                // 计算位置
                int row = i/4;
                int column = i%4;
                CGFloat x = startX + column * (widths + margin);
                CGFloat y = startY + row * (heights + margin);
                _hotBtn.frame = CGRectMake(x, y, widths, heights);
                [_hotBtn addTarget:self action:@selector(gosearch:) forControlEvents:UIControlEventTouchUpInside];
                [self addSubview:_hotBtn];
        }
        }
    }
    return _hotBtn;
}

-(UIImageView *)hisImage{
    if (_hisImage == nil) {
        _hisImage = [[UIImageView alloc] initWithFrame:CGRectMake(40, 5, 20, 20)];
        [self addSubview:_hisImage];
    }
    return _hisImage;
}
-(UILabel *)hisLab{

    if (_hisLab == nil) {
        _hisLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, DEVICEWIDTH-100, 20)];
        _hisLab.font = normalFontStyle;
        _hisLab.textColor = BlackColor;
        [self addSubview:_hisLab];
    }
    return _hisLab;
}
-(void)gosearch:(UIButton *)button{
    
    NSLog(@"%@",button.titleLabel.text);

}
-(instancetype)backHotArr:(NSMutableArray *)arr{
    _arrHot = [[NSMutableArray alloc] init];
    _arrHot = arr;
    return self;
}
@end
