//
//  AdminCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/7.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AdminCell : UITableViewCell
//商品
@property (nonatomic,retain)UIImageView *goodsImg;    ///<商品图片
@property (nonatomic,retain)UILabel     *titleLab;    ///<商品名称
@property (nonatomic,retain)UILabel     *priceLab;    ///<商品价格
@property (nonatomic,retain)UILabel     *yuShouLab;   ///<预售
@property (nonatomic,strong)UIButton    *EditBtn;     ///<编辑按钮
@property (nonatomic,strong)UIButton    *upBtn;       ///<上架按钮
@property (nonatomic,strong)UIButton    *downBtn;     ///<下架按钮


@end
