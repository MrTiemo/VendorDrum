//
//  HistoryNewViewController.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/4.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol addHisNewDele<NSObject>
-(void)AddressNewBack:(NSMutableDictionary *)sender;
@end
@interface HistoryNewViewController : UIViewController
@property (nonatomic,retain)id<addHisNewDele>deleNew;

- (void)setName:(NSString*)name;

@end
