//
//  ResultCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/21.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultCell : UITableViewCell

//商店页面
@property (nonatomic,strong)UIImageView *ShopIma;
@property (nonatomic,strong)UIImageView *ImaProOne;
@property (nonatomic,strong)UIImageView *ImaProTwo;
@property (nonatomic,strong)UIImageView *ImaProThree;
@property (nonatomic,strong)UILabel *ShopName;
@property (nonatomic,strong)UILabel *ShopAddress;
@property (nonatomic,strong)UILabel *ShopPro;
@property (nonatomic,strong)UILabel *ShopNum;

//商品页面
@property (nonatomic,strong)UIImageView *ProImage;
@property (nonatomic,strong)UILabel* ProLabel;
@property (nonatomic,strong)UILabel* priLabel;

@end
