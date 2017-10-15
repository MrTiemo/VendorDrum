//
//  WLFSViewController.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/16.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>
//定义一个block返回
typedef void (^WLFSBlockText)(NSString *showText);
@interface WLFSViewController : UIViewController

@property (nonatomic, copy) WLFSBlockText returnWLFSText;
- (void)returnWLFS:(WLFSBlockText)block;

@end
