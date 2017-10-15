//
//  MarketCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/26.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MarketCell : UITableViewCell
//评价
@property (nonatomic,strong)UILabel *pingLab;
@property (nonatomic,strong)UIImageView *headImaV;
@property (nonatomic,strong)UILabel *nameLab;
@property (nonatomic,strong)UILabel *timeLab;
//商品
@property (nonatomic,strong)UILabel *shouLab;
@property (nonatomic,strong)UILabel *oldPriceLab;
@property (nonatomic,retain)UIImageView *goodsImg;
@property (nonatomic,retain)UILabel  *titleLab;
@property (nonatomic,retain)UILabel  *priceLab;

@end


