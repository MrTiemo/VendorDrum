//
//  MainTableCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/15.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "MainTableCell.h"
#import "SupplierViewController.h"
#import "NewProViewController.h"
#import "CouponViewController.h"

@interface MainTableCell ()
@property(nonatomic,strong)NSMutableArray *arr;
@end

@implementation MainTableCell


-(UIButton *)BuyBtn{

    if (_BuyBtn==nil) {
        _BuyBtn = [[UIButton alloc] initWithFrame:CGRectMake(20,20, (DEVICEWIDTH-60)/2, 110)];
        [_BuyBtn setTitle:@"我要买" forState:UIControlStateNormal];
        [_BuyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _BuyBtn.layer.cornerRadius = 10;
        _BuyBtn.showsTouchWhenHighlighted = YES;
        _BuyBtn.backgroundColor = [UIColor colorWithRed:0.10 green:0.77 blue:0.64 alpha:1.00];
        _BuyBtn.layer.shadowOffset =  CGSizeMake(2, 2);
        _BuyBtn.layer.shadowOpacity = 1.0;
        _BuyBtn.layer.shadowColor =  [UIColor blackColor].CGColor;

        [self addSubview:_BuyBtn];
    }
    return _BuyBtn;
}
-(UIButton *)SellBtn{
    if (_SellBtn==nil) {
        _SellBtn = [[UIButton alloc] initWithFrame:CGRectMake(40+(DEVICEWIDTH-60)/2, 20, (DEVICEWIDTH-60)/2, 110)];
        [_SellBtn setTitle:@"我要卖" forState:UIControlStateNormal];
        [_SellBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _SellBtn.layer.cornerRadius = 10;
        _SellBtn.showsTouchWhenHighlighted = YES;
        _SellBtn.backgroundColor = [UIColor colorWithRed:0.96 green:0.38 blue:0.42 alpha:1.00];
        _SellBtn.layer.shadowOffset =  CGSizeMake(2, 2);
        _SellBtn.layer.shadowOpacity = 1.0;
        _SellBtn.layer.shadowColor =  [UIColor blackColor].CGColor;
        [self addSubview:_SellBtn];
    }
    return _SellBtn;
}
-(UIButton *)TypeBtn{
    if (_TypeBtn==nil) {
        for (int i =0; i<4; i++) {
            _TypeBtn = [[UIButton alloc] initWithFrame:CGRectMake(25*(i+1)+(_TypeBtn.bounds.size.width)*i, 20, (DEVICEWIDTH-125)/4,(DEVICEWIDTH-125)/4)];
            [_TypeBtn addTarget:self action:@selector(typeGo:) forControlEvents:UIControlEventTouchUpInside];
            _TypeBtn.tag = i+1;
            [_TypeBtn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"0%d",i+1]] forState:UIControlStateNormal];
            _TypeBtn.showsTouchWhenHighlighted = YES;
            _TypeBtn.layer.masksToBounds= YES;
            _TypeBtn.layer.cornerRadius = 10;
            _TypeBtn.layer.shadowOffset =  CGSizeMake(2, 2);
            _TypeBtn.layer.shadowOpacity = 1.0;
            _TypeBtn.layer.shadowColor =  [UIColor blackColor].CGColor;
            [self addSubview:_TypeBtn];
        }
    }
    return _SellBtn;
}
//-(UILabel *)TypeLab{
//    
//    if (_TypeLab==nil) {
//        for (int i =0; i<4; i++) {
//            _TypeLab = [[UILabel alloc] initWithFrame:CGRectMake(25*(i+1)+(_TypeBtn.bounds.size.width)*i, 70, (DEVICEWIDTH-125)/4, 30)];
//            _TypeLab.textAlignment = NSTextAlignmentCenter;
//            _TypeLab.text = [NSString stringWithFormat:@"%@",[_arr objectAtIndex:i]];
//            _TypeLab.font = labelFontStyle;
//            _TypeLab.textColor = BlackColor;
//            [self addSubview:_TypeLab];
//        }
//    }
//    return _TypeLab;
//}


-(UIImageView *)PosterIma{
    if (_PosterIma==nil) {
        _PosterIma = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, DEVICEWIDTH-20, 90)];
        [self addSubview:_PosterIma];
    }
    return _PosterIma;
}
-(UIImageView *)Proimage{
    if (_Proimage==nil) {
        _Proimage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 90, 90)];
        [self addSubview:_Proimage];
    }
    return _Proimage;
}
-(UILabel *)NameLab{
    if (_NameLab==nil) {
        _NameLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 5, 100, 40)];
        _NameLab.font = normalFontStyle;
        _NameLab.textColor = BlackColor;
        [self addSubview:_NameLab];
    }
    return _NameLab;
}
-(UILabel *)PriceLab{
    if (_PriceLab==nil) {
        _PriceLab = [[UILabel alloc] initWithFrame:CGRectMake(200, 5, 100, 40)];
        _PriceLab.font = normalFontStyle;
        _PriceLab.textColor = [UIColor redColor];
        [self addSubview:_PriceLab];
    }
    return _PriceLab;
}
//点击类型的button
-(void)typeGo:(UIButton*)button{
    NSLog(@"%ld",(long)button.tag);
    if (button.tag==1) {
        
        SupplierViewController *supp = [[SupplierViewController alloc] init];
        supp.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:supp animated:YES];
        
    }else if (button.tag==2){
        
        NewProViewController *newp = [[NewProViewController alloc] init];
        newp.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:newp animated:YES];
    }else if (button.tag==3){
        CouponViewController *newp = [[CouponViewController alloc] init];
        newp.hidesBottomBarWhenPushed = YES;
        [[self viewController].navigationController pushViewController:newp animated:YES];
    }else{
        NSLog(@"我是拍立送");
        
    }
}
////返回的数据
//-(instancetype)backStr:(NSMutableArray *)array{
//    _arr = [[NSMutableArray alloc] init];
//    _arr = array;
//    return self;
//}
//定义当前视图
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
