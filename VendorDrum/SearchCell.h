//
//  SearchCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/20.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchCell : UITableViewCell
@property(nonatomic,strong)UIButton *hotBtn;
@property(nonatomic,strong)UIImageView *hisImage;
@property(nonatomic,strong)UILabel *hisLab;


-(instancetype)backHotArr:(NSMutableArray *)arr;


@end
