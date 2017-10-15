//
//  AddGoodsViewController.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/7.
//  Copyright © 2016年 爱尚家. All rights reserved.
//
@protocol addProductArrDelegate
-(void)addProductArr:(NSMutableArray *)values;//1.1定义协议与方法
@end
#import <UIKit/UIKit.h>

@interface AddGoodsViewController : UIViewController

@property (nonatomic,strong)id<addProductArrDelegate>dele;

@end
