//
//  detailCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/26.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ProNumberDelegate;

@interface detailCell : UITableViewCell
//section 1
@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UILabel *priceLab;
@property(nonatomic,strong)UILabel *oldPriceLab;
@property(nonatomic,strong)UILabel *kuLab;
@property(nonatomic,strong)UILabel *yunLab;

//
@property(nonatomic,strong)UIButton *BiaoQianBtn;
//
//section 2
@property(nonatomic,strong)UILabel *MingLab;
@property(nonatomic,strong)UILabel *PaiLab;
@property(nonatomic,strong)UILabel *ZhongLab;
@property(nonatomic,strong)UILabel *NumLab;
@property(nonatomic,strong)UILabel *FanweiLab;
@property(nonatomic,strong)UILabel *mingLab;
@property(nonatomic,strong)UILabel *paiLab;
@property(nonatomic,strong)UILabel *zhongLab;
@property(nonatomic,strong)UILabel *numLab;
@property(nonatomic,strong)UILabel *fanweiLab;
//section 3
@property(nonatomic,strong)UIButton *ImageBtn;

@property (nonatomic,assign)id<ProNumberDelegate>delegate;
@end
@protocol ProNumberDelegate <NSObject>

- (void)detail:(detailCell *)cell buttom:(UIButton *)but numberLab:(UILabel *)lab;


@end
