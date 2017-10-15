//
//  HistoryAddressController.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/4.
//  Copyright © 2016年 爱尚家. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol HisAddDelegate<NSObject>
-(void)GetbackHisadd:(NSMutableDictionary *)sender;
@end
@interface HistoryAddressController : UIViewController
@property (nonatomic,retain)id<HisAddDelegate>deleHis;

@end
