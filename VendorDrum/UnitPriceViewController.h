//
//  UnitPriceViewController.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/16.
//  Copyright © 2016年 爱尚家. All rights reserved.
//



#import <UIKit/UIKit.h>
//定义一个block返回
typedef void (^UnitPriceText)(NSString *showText);
@interface UnitPriceViewController : UIViewController
@property (nonatomic, copy) UnitPriceText returnUuitPriceText;
- (void)returnUnitPrice:(UnitPriceText)block;

@end
