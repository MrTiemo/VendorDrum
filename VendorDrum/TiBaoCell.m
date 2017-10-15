//
//  TiBaoCell.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/18.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "TiBaoCell.h"

@implementation TiBaoCell


-(UIImageView *)imaV{
    if (_imaV==nil) {
        _imaV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
        _imaV.image = [UIImage imageNamed:@"sg"];
        [self addSubview:_imaV];
    }
    return _imaV;
}
-(UILabel *)nameLab{
    if (_nameLab==nil) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 100, 20)];
        _nameLab.font = normalFontStyle;
        [self addSubview:_nameLab];
    }
    return _nameLab;
}

-(UILabel *)pirceLab{
    if (_pirceLab==nil) {
        _pirceLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 30, 100, 20)];
        _pirceLab.font = normalFontStyle;
        _pirceLab.textColor = [UIColor colorWithRed:0.91 green:0.31 blue:0.28 alpha:1.00];
        [self addSubview:_pirceLab];
    }
    return _pirceLab;
}
-(UILabel *)yunFeiLab{
    if (_yunFeiLab==nil) {
        _yunFeiLab = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 100, 20)];
        _yunFeiLab.font = labelFontStyle;
        _yunFeiLab.textColor = [UIColor grayColor];
        [self addSubview:_yunFeiLab];
    }
    return _yunFeiLab;
}
-(UILabel *)timeLab{
    if (_timeLab==nil) {
        _timeLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 100, 30)];
        _timeLab.font = labelFontStyle;
        _timeLab.textColor = [UIColor grayColor];
        [self addSubview:_timeLab];
    }
    return _timeLab;
}
-(UILabel *)KuOrTimeLab{

    if (_KuOrTimeLab==nil) {
        _KuOrTimeLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-100, 10, 90, 20)];
        _KuOrTimeLab.font = labelFontStyle;
        _KuOrTimeLab.textColor = [UIColor grayColor];
        _KuOrTimeLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:_KuOrTimeLab];
    }
    return _KuOrTimeLab;

}

-(UILabel *)zhuangTaiLab{
    if (_zhuangTaiLab==nil) {
        _zhuangTaiLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-70, 70,60, 25)];
        _zhuangTaiLab.font = labelFontStyle;
        _zhuangTaiLab.textColor = [UIColor redColor];
        _zhuangTaiLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:_zhuangTaiLab];
    }
    return _zhuangTaiLab;
    
}

-(UIButton *)editBtn{
    if (_editBtn==nil) {
         _editBtn = [[UIButton alloc]initWithFrame:CGRectMake(DEVICEWIDTH-70, 70,60, 25)];
        [_editBtn setTitleColor:NavaCOLOR forState:UIControlStateNormal];
        _editBtn.layer.cornerRadius = 3.0;
        _editBtn.layer.masksToBounds = YES;
        _editBtn.layer.borderWidth = 0.5;
        _editBtn.layer.borderColor=NavaCOLOR.CGColor;
        _editBtn.titleLabel.font = normalFontStyle;
        _editBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [self addSubview:_editBtn];
    }
    return _editBtn;
}
//-(UIButton *)UpBtn{
//    if (_UpBtn==nil) {
//        _UpBtn = [[UIButton alloc]initWithFrame:CGRectMake(DEVICEWIDTH-70, 70,60, 25)];
//        [_UpBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        _UpBtn.layer.cornerRadius  = 3.0;
//        _UpBtn.layer.masksToBounds = YES;
//        _UpBtn.layer.borderWidth   = 0.5;
//        _UpBtn.layer.borderColor =NavaCOLOR.CGColor;
//        _UpBtn.titleLabel.font = normalFontStyle;
//        _UpBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [_UpBtn setTitle:@"上架" forState:UIControlStateNormal];
//        [_UpBtn setTitleColor:[UIColor colorWithRed:0.13 green:0.67 blue:0.22 alpha:1.00]  forState:UIControlStateNormal];
//        [self addSubview:_UpBtn];
//    }
//    return _UpBtn;
//}

//-(UIButton *)DownBtn{
//    if (_DownBtn==nil) {
//        _DownBtn = [[UIButton alloc]initWithFrame:CGRectMake(DEVICEWIDTH-70, 70,60, 25)];
//        [_DownBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        _DownBtn.layer.cornerRadius  = 3.0;
//        _DownBtn.layer.masksToBounds = YES;
//        _DownBtn.layer.borderWidth   = 0.5;
//        _DownBtn.layer.borderColor =NavaCOLOR.CGColor;
//        _DownBtn.titleLabel.font = normalFontStyle;
//        _DownBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
//        [_DownBtn setTitle:@"下架" forState:UIControlStateNormal];
//        [_DownBtn setTitleColor:[UIColor redColor]  forState:UIControlStateNormal];
//        [self addSubview:_DownBtn];
//    }
//    return _DownBtn;
//}
//
//-(UIImageView *)ZeroIma{
//    if (_ZeroIma==nil) {
//        _ZeroIma = [[UIImageView alloc] initWithFrame:CGRectMake(DEVICEWIDTH-70, 35, 60, 60)];
//        _ZeroIma.image = [UIImage imageNamed:@"shouwu"];
//        [self addSubview:_ZeroIma];
//    }
//    return _ZeroIma;
//}
//















@end
