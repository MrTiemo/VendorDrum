//
//  StoreEditCell.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/8.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreEditCell : UITableViewCell
@property (nonatomic,strong)UILabel *LabelA;     ///<比较窄的cell的名字
@property (nonatomic,strong)UILabel *LabelB;     ///<比较高的cell的名字
@property (nonatomic,strong)UITextField *textA;  ///<比较窄的cell的输入框
@property (nonatomic,strong)UITextField *textB;  ///<比较高的cell的输入框
@property (nonatomic,strong)UILabel *labDZ;      ///<店铺地址
@property (nonatomic,strong)UILabel *labLX;      ///<店铺类型

@end
