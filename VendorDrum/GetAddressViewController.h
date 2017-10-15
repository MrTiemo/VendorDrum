//
//  GetAddressViewController.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/29.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewAddressViewController.h"

@protocol GetaddDelegate<NSObject>
-(void)Getbackadd:(NSMutableDictionary *)sender;
@end
@interface GetAddressViewController : UIViewController
@property (nonatomic,retain)id<GetaddDelegate>deleGate;

@end
