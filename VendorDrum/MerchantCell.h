//
//  MerchantCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/15.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MerchantCell : UITableViewCell


@property (nonatomic,strong)UIImageView *HeadImageView; ///<店铺头像

@property (nonatomic,strong)UIButton *scBtn; ///<收藏店铺按钮

@property (nonatomic,strong)UILabel *AddressLab;  ///<地址
@property (nonatomic,strong)UILabel *ZhuYingLab;   ///<主营

@property (nonatomic,strong)UILabel *TimeLab; ///<开点时间
@property (nonatomic,strong)UILabel *timeLab;
@property (nonatomic,strong)UILabel *DanLab;  ///<成交单数
@property (nonatomic,strong)UILabel *danLab;
@property (nonatomic,strong)UILabel *ShouLab;   ///<收藏次数
@property (nonatomic,strong)UILabel *shouLab;
//--------------
@property (nonatomic,strong)UILabel *XinYuLab;  ///<信誉评价
//@property (nonatomic, strong) TQStarRatingView *starRatingView;
@property (nonatomic,strong)UILabel *numXinLab;  ///<信誉评分
@property (nonatomic,strong)UILabel *PingLab;    ///<评论个数
//--------------
@property (nonatomic,strong)UILabel *ZhanLab;       ///<店铺展示
@property (nonatomic,strong)UILabel *JieShaoLab;    ///<店铺介绍
@property (nonatomic,strong)UIButton *zhanBtn;      ///<展示的图片，因为需要点击，所以直接用button代替
//--------------
@property (nonatomic,strong)UILabel  *ShangPinLab;   ///<商品信息
@property (nonatomic,strong)UILabel  *GoBtn;         ///<去店铺
@property (nonatomic,strong)UIButton *Product;      ///<展示的图片，因为需要点击，所以直接用button代替

@end
