//
//  AddGoodsCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddGoodsCell : UITableViewCell

@property (nonatomic,strong)UIImageView *imageBtn;     ///<是否选择的对号提示
@property (nonatomic,strong)UIImageView *imageV;       ///商品图片
@property (nonatomic,strong)UILabel     *labName;      ///<商品名称
@property (nonatomic,strong)UILabel     *labPrice;     ///<商品价格
@property (nonatomic,strong)UILabel     *labYun;       ///<商品运费
@property (nonatomic,strong)UILabel     *labTime;      ///<提报时间
@property (nonatomic,strong)UILabel     *labYushou;    ///<商品是否预售
@property (nonatomic,strong)UILabel     *labKu;        ///<商品库存


@end
