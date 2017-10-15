//
//  demoData.h
//  123
//
//  Created by 爱尚家 on 16/6/9.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface demoData : NSObject

#define DEVICEWIDTH [UIScreen mainScreen].bounds.size.width
#define DEVICEHIGHT [UIScreen mainScreen].bounds.size.height
//定义颜色
#define BlackColor    [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1.00]
#define NavaCOLOR     [UIColor colorWithRed:0.89 green:0.21 blue:0.22 alpha:1.00]
//定义字体
#define normalFontStyle [UIFont fontWithName:@"Arial" size: 15]
#define labelFontStyle [UIFont fontWithName:@"Arial" size: 12]
#define titleFontStyle [UIFont fontWithName:@"Arial" size: 18]

@end
