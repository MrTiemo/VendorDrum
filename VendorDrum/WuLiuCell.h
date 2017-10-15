//
//  WuLiuCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/2.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WuLiuCell : UITableViewCell
//商品信息等
@property (nonatomic,strong)UIImageView *proImage;
@property (nonatomic,strong)UILabel     *wuliu;
@property (nonatomic,strong)UILabel     *gongshi;
@property (nonatomic,strong)UILabel     *bianhao;
@property (nonatomic,strong)UILabel     *dianhua;
//物流跟踪信息
@property (nonatomic,strong)UIView      *ViewXian;
@property (nonatomic,strong)UIView      *ViewXia;
@property (nonatomic,strong)UIView      *ViewShang;
@property (nonatomic,strong)UIView      *lineCell;
@property (nonatomic,strong)UIImageView *imageWu;

@property (nonatomic,strong)UILabel     *xinxiLab;
@property (nonatomic,strong)UILabel     *timeLab;

//确认收货按钮
@property (nonatomic,strong)UIButton    *sureBtn;
@end
