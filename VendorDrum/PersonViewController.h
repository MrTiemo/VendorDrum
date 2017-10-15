//
//  PersonViewController.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/10.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol TuiChuDelegate <NSObject>

-(void)backTui:(NSString *)str;

@end

@interface PersonViewController : UIViewController

@property (nonatomic,strong) id<TuiChuDelegate>TuiDEle;

@end
