//
//  CancelDingCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/12.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CancelDingCell : UITableViewCell

@property (nonatomic,strong)UILabel *labBianHao; ///<订单编号

@property (nonatomic,strong)UILabel *labZFB; ///<订支付方式

@property (nonatomic,strong)UILabel *labTime; ///<创建时间

@property (nonatomic,strong)UILabel *labZhuang; ///<订单状态

@property (nonatomic,strong)UIImageView *imageV; ///<商品图片

@property (nonatomic,strong)UILabel *labTitle; ///<商品名称

@property (nonatomic,strong)UILabel *labPrice; ///<商品价格

@property (nonatomic,strong)UILabel *labNumber; ///<商品数量

@property (nonatomic,strong)UILabel *labAllNum; ///<商品共计

@property (nonatomic,strong)UILabel *labAllPirce; ///<总价

@property (nonatomic,strong)UILabel *labYouHui; ///<优惠金额

@property (nonatomic,strong)UILabel *labShifu; ///<实付金额

@property (nonatomic,strong)UILabel *labUser; ///<收货人信息

@property (nonatomic,strong)UILabel *labAddress; ///<收货地址

@property (nonatomic,strong)UILabel *labBeiZhu; ///<订单备注

@property (nonatomic,strong)UILabel *labQXFS; ///<取消方式

@property (nonatomic,strong)UILabel *labReason; ///<取消原因

@property (nonatomic,strong)UILabel *labTuiPrice; ///<退还金额


@end
