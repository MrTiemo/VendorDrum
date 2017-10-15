//
//  MYCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/5.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYCell : UITableViewCell

//第一个分区
@property (nonatomic,strong)UIImageView *imageHead;
@property (nonatomic,strong)UILabel *nameLab;
@property (nonatomic,strong)UILabel *numLab;
//剩下的分区
@property (nonatomic,strong)UIImageView *imageV;
@property (nonatomic,strong)UILabel *titLab;
//电话号码
@property (nonatomic,strong)UILabel *telephone;

@end
