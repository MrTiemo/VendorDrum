//
//  storeDingCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/10.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface storeDingCell : UITableViewCell

@property (nonatomic,strong)UILabel *labUsername;  ///<用户名
@property (nonatomic,strong)UILabel *labBian;      ///<订单编号


@property (nonatomic,strong)UILabel *labBackground; ///<订单编号后边的竖线


@property (nonatomic,strong)UILabel *labZhuang;    ///<订单状态
@property (nonatomic,strong)UIImageView *imaV;     ///<商品图片
@property (nonatomic,strong)UILabel *labProName;   ///<商品名称
@property (nonatomic,strong)UILabel *labPrice;     ///<商品价格
@property (nonatomic,strong)UILabel *labNum;       ///<商品数量
@property (nonatomic,strong)UILabel *labGongji;    ///<共计多少件
@property (nonatomic,strong)UILabel *labAllprice;  ///<总价

@property (nonatomic,strong)UILabel *labTui;       ///<退款或退货

@property (nonatomic,strong)UILabel *labBackTui;   ///<退款或退货后边的竖线

@property (nonatomic,strong)UILabel *labReason;    ///<退款活着换货的原因


@property (nonatomic,strong)UIButton *buttonLeft;

@property (nonatomic,strong)UIButton *buttonRight;

@end


