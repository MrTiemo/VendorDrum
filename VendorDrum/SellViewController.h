//
//  SellViewController.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/16.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>
//定义一个block返回
typedef void (^ReturnTextBlock)(NSString *showText);
@interface SellViewController : UIViewController

@property (nonatomic, copy) ReturnTextBlock returnTextBlock;
@property (nonatomic,strong)NSString *str;
- (void)returnText:(ReturnTextBlock)block;

@end
