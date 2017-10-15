//
//  detailCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/26.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "detailCell.h"


@implementation detailCell
#pragma mark ================ //section 1

//商品名字
-(UILabel *)nameLab{
    if (_nameLab==nil) {
        _nameLab  = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, DEVICEWIDTH, 30)];
        _nameLab.font = normalFontStyle;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
//价格
-(UILabel *)priceLab{
    if (_priceLab==nil) {
        _priceLab  = [[UILabel alloc] initWithFrame:CGRectMake(10, 30,DEVICEWIDTH/4, 20)];
        _priceLab.font = normalFontStyle;
        _priceLab.textColor = [UIColor redColor];
        [self addSubview:_priceLab];
    }
    return _priceLab;
}
//库存
-(UILabel *)kuLab{
    if (_kuLab==nil) {
        _kuLab  = [[UILabel alloc] initWithFrame:CGRectMake((DEVICEWIDTH)/3*2, 30,(DEVICEWIDTH)/3, 20)];
        _kuLab.font = normalFontStyle;
        _kuLab.textColor = [UIColor grayColor];
        [self addSubview:_kuLab];
    }
    return _kuLab;
}
//销售状态
-(UILabel *)oldPriceLab{
    if (_oldPriceLab==nil) {
        _oldPriceLab  = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 30,60, 20)];
        _oldPriceLab.font = normalFontStyle;
        _oldPriceLab.textAlignment = NSTextAlignmentCenter;
        _oldPriceLab.layer.cornerRadius = 5;
        _oldPriceLab.backgroundColor = [UIColor colorWithRed:0.98 green:0.47 blue:0.13 alpha:1.00];
        
//        NSString *oldStr = [NSString stringWithFormat:@"¥ 100.00"];
        //中划线
//        NSDictionary *attribtDic =@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
//        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:oldStr attributes:attribtDic];
//        _oldPriceLab.attributedText = attribtStr;
        _oldPriceLab.textColor = [UIColor whiteColor];
        [self addSubview:_oldPriceLab];
    }
    return _oldPriceLab;
}
//运费
-(UILabel *)yunLab{
    if (_yunLab==nil) {
        _yunLab  = [[UILabel alloc] initWithFrame:CGRectMake(10, 50,(DEVICEWIDTH)/3, 20)];
        _yunLab.font = normalFontStyle;
        _yunLab.textColor = [UIColor grayColor];
        [self addSubview:_yunLab];
    }
    return _yunLab;
}







-(UIButton *)BiaoQianBtn{

    if (_BiaoQianBtn==nil) {
        
        
        //第一个 label的起点
        CGSize size = CGSizeMake(5, 10);
        //间距
        CGFloat padding = 5.0;
        NSArray *titleArr = @[@"支持走快递",@"不支持港澳台",@"不支持西藏，云南，新疆等偏远地区",];
        for (int i = 0; i < titleArr.count; i ++) {
            
            CGFloat keyWorldWidth = [self getSizeByString:titleArr[i] AndFontSize:15].width;
            if (keyWorldWidth > DEVICEWIDTH) {
                keyWorldWidth = DEVICEWIDTH;
            }
            if (DEVICEWIDTH - size.width < keyWorldWidth) {
                size.height += 15.0;
                size.width = 5.0;
            }
            _BiaoQianBtn = [[UIButton alloc] initWithFrame:CGRectMake(size.width, size.height-10, keyWorldWidth, 20)];
            _BiaoQianBtn.titleLabel.font = labelFontStyle;
            [_BiaoQianBtn setTitle:[NSString stringWithFormat:@"%@",[titleArr objectAtIndex:i]]forState:UIControlStateNormal];//设置button的title
            _BiaoQianBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
            _BiaoQianBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -40, 0,0);
            [_BiaoQianBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [_BiaoQianBtn setImage:[UIImage imageNamed:@"biao"] forState:UIControlStateNormal];
            _BiaoQianBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0,0,keyWorldWidth-20);
            [self addSubview:_BiaoQianBtn];
            //起点 增加
            size.width += keyWorldWidth+padding;
        }
    }
    return _BiaoQianBtn;
}




//计算文字所占大小
- (CGSize)getSizeByString:(NSString*)string AndFontSize:(CGFloat)font
{
    CGSize size = [string boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    size.width += 5;
    return size;
}





#pragma mark ================ //section 2
//商品名称
-(UILabel *)MingLab{
    if (_MingLab==nil) {
        _MingLab  = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH/4, 30)];
        _MingLab.font = labelFontStyle;
        _MingLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_MingLab];
    }
    return _MingLab;
}
-(UILabel *)mingLab{
    if (_mingLab==nil) {
        _mingLab  = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH-DEVICEWIDTH/4, 30)];
        _mingLab.font = labelFontStyle;
        _mingLab.textAlignment = NSTextAlignmentLeft;
        _mingLab.textColor = [UIColor grayColor];
        [self addSubview:_mingLab];
    }
    return _mingLab;
}
//品牌
-(UILabel *)PaiLab{
    if (_PaiLab==nil) {
        _PaiLab  = [[UILabel alloc] initWithFrame:CGRectMake(0,30, (DEVICEWIDTH)/4, 30)];
        _PaiLab.font = labelFontStyle;
        _PaiLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_PaiLab];
    }
    return _PaiLab;
}
-(UILabel *)paiLab{
    if (_paiLab==nil) {
        _paiLab  = [[UILabel alloc] initWithFrame:CGRectMake((DEVICEWIDTH)/4, 30, (DEVICEWIDTH)/4, 30)];
        _paiLab.font = labelFontStyle;
        _paiLab.textAlignment = NSTextAlignmentLeft;
        _paiLab.textColor = [UIColor grayColor];
        [self addSubview:_paiLab];
    }
    return _paiLab;
}
//商品编号
-(UILabel *)NumLab{
    if (_NumLab==nil) {
        _NumLab  = [[UILabel alloc] initWithFrame:CGRectMake((DEVICEWIDTH)/2, 30,(DEVICEWIDTH)/4, 30)];
        _NumLab.font = labelFontStyle;
        _NumLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_NumLab];
    }
    return _NumLab;
}
-(UILabel *)numLab{
    if (_numLab==nil) {
        _numLab  = [[UILabel alloc] initWithFrame:CGRectMake((DEVICEWIDTH)/4*3, 30, (DEVICEWIDTH)/4, 30)];
        _numLab.font = labelFontStyle;
        _numLab.textAlignment = NSTextAlignmentLeft;
        _numLab.textColor = [UIColor grayColor];
        [self addSubview:_numLab];
    }
    return _numLab;
}
//包装种类
-(UILabel *)ZhongLab{
    if (_ZhongLab==nil) {
        _ZhongLab  = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, DEVICEWIDTH/4, 30)];
        _ZhongLab.font = labelFontStyle;
        _ZhongLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_ZhongLab];
    }
    return _ZhongLab;
}
-(UILabel *)zhongLab{
    if (_zhongLab==nil) {
        _zhongLab  = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 60, DEVICEWIDTH/4, 30)];
        _zhongLab.font = labelFontStyle;
        _zhongLab.textAlignment = NSTextAlignmentLeft;
        _zhongLab.textColor = [UIColor grayColor];
        [self addSubview:_zhongLab];
    }
    return _zhongLab;
}
//配送范围
-(UILabel *)FanweiLab{
    if (_FanweiLab==nil) {
        _FanweiLab  = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/2, 60, DEVICEWIDTH/4, 30)];
        _FanweiLab.font = labelFontStyle;
        _FanweiLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_FanweiLab];
    }
    return _FanweiLab;
}
-(UILabel *)fanweiLab{
    if (_fanweiLab==nil) {
        _fanweiLab  = [[UILabel alloc] initWithFrame:CGRectMake((DEVICEWIDTH)/4*3, 60, DEVICEWIDTH/4, 30)];
        _fanweiLab.font = labelFontStyle;
        _fanweiLab.textAlignment = NSTextAlignmentLeft;
        _fanweiLab.textColor = [UIColor grayColor];
        [self addSubview:_fanweiLab];
    }
    return _fanweiLab;
}
#pragma mark ================ //section 3
-(UIButton *)ImageBtn{
    if (_ImageBtn==nil) {
        _ImageBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 250)];
//        _ImageBtn.showsTouchWhenHighlighted = NO;
        _ImageBtn.adjustsImageWhenHighlighted = NO;
        [_ImageBtn setImage:[UIImage imageNamed:@"bacc"] forState:UIControlStateNormal];
        [self addSubview:_ImageBtn];
    }
    return _ImageBtn;
}


@end
