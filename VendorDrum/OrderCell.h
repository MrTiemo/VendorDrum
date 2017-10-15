//
//  OrderCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/1.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell
@property (nonatomic,strong)UIImageView *imagePro;
@property (nonatomic,strong)UILabel  *nameLab;
@property (nonatomic,strong)UILabel  *priceLab;
@property (nonatomic,strong)UILabel  *numLab;
@property (nonatomic,strong)UILabel  *shuLab;
@property (nonatomic,strong)UILabel  *jiaLab;
@property (nonatomic,strong)UIButton *BtnOne;
@property (nonatomic,strong)UIButton *BtnTwo;
@property (nonatomic,strong)UIButton *BtnThree;

-(instancetype)backZhuangT:(NSString *)str;
@end
