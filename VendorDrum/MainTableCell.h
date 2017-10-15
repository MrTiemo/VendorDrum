//
//  MainTableCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/15.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableCell : UITableViewCell
@property(nonatomic,strong)UIButton *BuyBtn; ///<买
@property(nonatomic,strong)UIButton *SellBtn;///<卖
@property(nonatomic,strong)UIImageView *Proimage;///<商品图片
@property(nonatomic,strong)UILabel *NameLab;///<商品名称
@property(nonatomic,strong)UILabel *PriceLab;///<商品价格
@property(nonatomic,strong)UIButton *TypeBtn;///<类型按钮
@property(nonatomic,strong)UILabel *TypeLab;///<类型label
@property(nonatomic,strong)UIImageView *PosterIma;///<广告图片


//-(instancetype)backStr:(NSMutableArray *)array;
@end
