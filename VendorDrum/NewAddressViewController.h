//
//  NewAddressViewController.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/29.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol addressDele<NSObject>
-(void)AddressBack:(NSMutableDictionary *)sender;
@end
@interface NewAddressViewController : UIViewController
@property (nonatomic,retain)id<addressDele>dele;
@end
