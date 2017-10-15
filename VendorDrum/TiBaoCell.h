//
//  TiBaoCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/18.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TiBaoCell : UITableViewCell

//===========================================================

@property (nonatomic,strong) UIImageView *imaV; ///< 图片
@property (nonatomic,strong) UILabel *nameLab;  ///< 商品名称
@property (nonatomic,strong) UILabel *pirceLab;  ///< 价格
@property (nonatomic,strong) UILabel *yunFeiLab; ///< 运费
@property (nonatomic,strong) UILabel *KuOrTimeLab;///< 库存还是上市时间
@property (nonatomic,strong) UILabel *zhuangTaiLab; ///< 提报状态
@property (nonatomic,strong) UILabel *timeLab;  ///< 提报时间

//===============
@property (nonatomic,strong) UIButton *editBtn;  ///< 编辑按钮
//@property (nonatomic,strong) UIButton *UpBtn;  ///< 上架按钮

//@property (nonatomic,strong) UIButton *DownBtn;  ///< 下架按钮



//@property (nonatomic,strong) UIImageView *ZeroIma;  ///< 售无标识




@end
