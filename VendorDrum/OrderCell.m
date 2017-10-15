//
//  OrderCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/1.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "OrderCell.h"


@interface OrderCell ()
@property (nonatomic)int str;
@end


@implementation OrderCell

//商品图片
-(UIImageView *)imagePro{
    if (_imagePro ==nil) {
        _imagePro = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 80, 80)];
        [self addSubview:_imagePro];
    }
    return _imagePro;
}
//商品名字
-(UILabel *)nameLab{
    if (_nameLab == nil) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, DEVICEWIDTH-110, 30)];
        _nameLab.font = normalFontStyle;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
//商品价格
-(UILabel *)priceLab{
    if (_priceLab == nil) {
        _priceLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, 100, 30)];
        _priceLab.font = labelFontStyle;
        _priceLab.textColor = [UIColor redColor];
        [self addSubview:_priceLab];
    }
    return _priceLab;
}
//单品总数
-(UILabel *)shuLab{
    
    if (_shuLab == nil) {
        _shuLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-50, 40, 30, 30)];
        _shuLab.font = labelFontStyle;
        _shuLab.textColor = [UIColor grayColor];
        [self addSubview:_shuLab];
    }
    return _shuLab;
}
//商品件数
-(UILabel *)numLab{
    
    if (_numLab == nil) {
        _numLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 80, 30)];
        _numLab.font = labelFontStyle;
        [self addSubview:_numLab];
    }
    return _numLab;
}
//订单价格以及运费
-(UILabel *)jiaLab{
    
    if (_jiaLab == nil) {
        _jiaLab = [[UILabel alloc] initWithFrame:CGRectMake(180, 70, DEVICEWIDTH-180, 30)];
        _jiaLab.font = labelFontStyle;
        _jiaLab.textColor = [UIColor grayColor];
        _jiaLab.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_jiaLab];
    }
    return _jiaLab;
}
//显示订单状态的按钮和标签
-(UIButton *)BtnOne{
    if (_BtnOne==nil) {
        _BtnOne = [[UIButton alloc] initWithFrame:CGRectMake(20,5,(DEVICEWIDTH-80)/3, 40)];
        _BtnOne.titleLabel.font=normalFontStyle;
        switch (_str) {
            case 4:
//                [_BtnOne setTitle:@"查看物流" forState:UIControlStateNormal];
//                _BtnOne.layer.cornerRadius = 20;
//                _BtnOne.layer.borderWidth = 0.5;
//                _BtnOne.layer.borderColor=[UIColor grayColor].CGColor;
//                [_BtnOne setTitleColor:[UIColor colorWithRed:0.08 green:0.59 blue:0.09 alpha:1.00] forState:UIControlStateNormal];
//                [self addSubview:_BtnOne];
                break;
            case 5:
                [_BtnOne setTitle:@"再次购买" forState:UIControlStateNormal];
                _BtnOne.layer.cornerRadius = 20;
                _BtnOne.layer.borderWidth = 0.5;
                _BtnOne.layer.borderColor=[UIColor grayColor].CGColor;
                [_BtnOne setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [self addSubview:_BtnOne];
                break;
            case 6:
//                [_BtnOne setTitle:@"已评价" forState:UIControlStateNormal];
//                [_BtnOne setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//                [self addSubview:_BtnOne];
                break;
            default:
                
                break;
        }
        
    }
    return _BtnOne;
}
-(UIButton *)BtnTwo{
    if (_BtnTwo==nil) {
        _BtnTwo = [[UIButton alloc] initWithFrame:CGRectMake(40+(DEVICEWIDTH-80)/3,5,(DEVICEWIDTH-80)/3, 40)];
        _BtnTwo.titleLabel.font=normalFontStyle;

//        _BtnTwo.layer.cornerRadius = 20;
//        _BtnTwo.layer.borderWidth = 0.5;
//        _BtnTwo.layer.borderColor=[UIColor grayColor].CGColor;
//        _BtnTwo.backgroundColor = [UIColor colorWithRed:0.08 green:0.59 blue:0.09 alpha:1.00];
        
        switch (_str) {
            case 1:
                [_BtnTwo setTitle:@"已支付" forState:UIControlStateNormal];
                [self addSubview:_BtnTwo];
                break;
            case 2:
                [_BtnTwo setTitle:@"货到付款" forState:UIControlStateNormal];
                [self addSubview:_BtnTwo];
                break;
            case 3:
                [_BtnTwo setTitle:@"去支付" forState:UIControlStateNormal];
                _BtnTwo.layer.cornerRadius = 20;
                _BtnTwo.layer.borderWidth = 0.5;
                _BtnTwo.layer.borderColor=[UIColor grayColor].CGColor;
                _BtnTwo.backgroundColor = NavaCOLOR;
                [self addSubview:_BtnTwo];

                break;
            case 4:
                [_BtnTwo setTitle:@"确认收货" forState:UIControlStateNormal];
                _BtnTwo.layer.cornerRadius = 20;
                _BtnTwo.layer.borderWidth = 0.5;
                _BtnTwo.layer.borderColor=[UIColor grayColor].CGColor;
                _BtnTwo.backgroundColor = [UIColor colorWithRed:0.08 green:0.59 blue:0.09 alpha:1.00];
                [self addSubview:_BtnTwo];

                break;
            case 5:
                [_BtnTwo setTitle:@"再次购买" forState:UIControlStateNormal];
                _BtnTwo.layer.cornerRadius = 20;
                _BtnTwo.layer.borderWidth = 0.5;
                _BtnTwo.layer.borderColor=[UIColor grayColor].CGColor;
//                _BtnTwo.backgroundColor =  [UIColor colorWithRed:0.98 green:0.63 blue:0.08 alpha:1.00];
                [_BtnTwo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [self addSubview:_BtnTwo];
                break;
            case 6:
//                [_BtnTwo setTitle:@"再次购买" forState:UIControlStateNormal];
//                _BtnTwo.layer.cornerRadius = 20;
//                _BtnTwo.layer.borderWidth = 0.5;
//                _BtnTwo.layer.borderColor=[UIColor grayColor].CGColor;
//                [_BtnTwo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//                [self addSubview:_BtnTwo];
                break;
            case 7:
                [_BtnTwo setTitle:@"再次购买" forState:UIControlStateNormal];
                _BtnTwo.layer.cornerRadius = 20;
                _BtnTwo.layer.borderWidth = 0.5;
                _BtnTwo.layer.borderColor=[UIColor grayColor].CGColor;
                [_BtnTwo setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [self addSubview:_BtnTwo];

                break;
                
            default:
                break;
        }
    }
    return _BtnTwo;
}
-(UIButton *)BtnThree{
    if (_BtnThree==nil) {
        _BtnThree = [[UIButton alloc] initWithFrame:CGRectMake(60+(DEVICEWIDTH-80)/3*2,5,(DEVICEWIDTH-80)/3, 40)];
        _BtnThree.titleLabel.font=normalFontStyle;

        
        switch (_str) {
            case 5:
                [_BtnThree setTitle:@"申请售后" forState:UIControlStateNormal];
                _BtnThree.layer.cornerRadius = 20;
                _BtnThree.layer.borderWidth = 0.5;
                _BtnThree.layer.borderColor=[UIColor grayColor].CGColor;
                [_BtnThree setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [self addSubview:_BtnThree];
               break;
            case 6:
                [_BtnThree setTitle:@"再次购买" forState:UIControlStateNormal];
                _BtnThree.layer.cornerRadius = 20;
                _BtnThree.layer.borderWidth = 0.5;
                _BtnThree.layer.borderColor=[UIColor grayColor].CGColor;
                [_BtnThree setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [self addSubview:_BtnThree];
                break;
            case 7:
                [_BtnThree setTitle:@"已取消" forState:UIControlStateNormal];
                [_BtnThree setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [self addSubview:_BtnThree];
                break;
            case 8:
                [_BtnThree setTitle:@"售后审核中" forState:UIControlStateNormal];
                [_BtnThree setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [self addSubview:_BtnThree];
                break;
            case 9:
                [_BtnThree setTitle:@"退款已转入我的余额" forState:UIControlStateNormal];
                [_BtnThree setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
                [self addSubview:_BtnThree];
                break;
            default:
                [_BtnThree setTitle:@"取消订单" forState:UIControlStateNormal];
                _BtnThree.layer.cornerRadius = 20;
                _BtnThree.layer.borderWidth = 0.5;
                 _BtnThree.layer.borderColor=[UIColor grayColor].CGColor;
                [_BtnThree setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [self addSubview:_BtnThree];
                break;
        }
    }
    return _BtnThree;
}
//返回订单的状态码
-(instancetype)backZhuangT:(NSString *)str{

    _str = [str intValue];
    NSLog(@"%d",_str);
    return self;
}







@end
