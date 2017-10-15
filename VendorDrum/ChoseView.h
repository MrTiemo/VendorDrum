//
//  ChoseView.h
//  AddShoppingCart
//
//  Created by 主用户 on 16/3/23.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ChoseView : UIView<UITextFieldDelegate,UIAlertViewDelegate>
@property(nonatomic, retain)UIView *alphaiView;
@property(nonatomic, retain)UIView *whiteView;

@property(nonatomic, retain)UIImageView *img;

@property(nonatomic, retain)UILabel *nameLab;  ///<商品名称
@property(nonatomic, retain)UILabel *jieshaoLab;///<商品介绍
@property(nonatomic, retain)UILabel *zuishaoLab;///< 起批量
@property(nonatomic, retain)UILabel *numLab;  ///< 购买数量


@property(nonatomic, retain)UITextField *numText;  ///< 填写数量

@property(nonatomic, retain)UILabel *lineLab;  ///< 下划线


@property(nonatomic, retain)UILabel *kuLab;  ///< 库存
@property(nonatomic, retain)UILabel *allPriceLab;  ///< 商品总价

@property(nonatomic, retain)UILabel *SurePriceLab;  ///< 商品总价


@property(nonatomic, retain)UILabel *shuomingLab;  ///< 总价说明

@property(nonatomic, retain)UILabel *fahuoLab;  ///< 发货方式

@property(nonatomic, retain)UIButton *changeBtn;  ///< 方式选择



@property(nonatomic, retain)UIButton *bt_sure;
@property(nonatomic, retain)UIButton *bt_cancle;



@property(nonatomic, retain)UIButton *btShop;///<添加购物车


@property (nonatomic, strong) NSMutableArray * btnArray;



@property (nonatomic, strong) NSString * btnName;



@property(nonatomic) int stock;
@end
