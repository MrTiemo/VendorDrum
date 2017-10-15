//
//  MyDatePicker.h
//  NetOptimization
//
//  Created by HeHongwe on 15/9/23.
//  Copyright © 2015年 贺子东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CDatePickerViewEx :UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong, readonly) NSDate *date;
-(void)selectToday;
@end
