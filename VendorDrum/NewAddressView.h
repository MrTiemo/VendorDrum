//
//  NewAddressView.h
//  ASJDemo
//
//  Created by 爱尚家 on 16/6/20.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol addressDele<NSObject>
-(void)AddressBack:(NSMutableDictionary *)sender;
@end
@interface NewAddressView : UIViewController
@property (nonatomic,retain)id<addressDele>dele;

@end
