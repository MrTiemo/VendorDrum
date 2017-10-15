//
//  NiceAlertSheet.h
//  NiceAlertSheet
//
//  Created by Jax on 16/6/6.
//  Copyright © 2016年 Jax. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ChoiceButtonClickedBlock)(NSInteger tag);

@interface NiceAlertSheet : UIView

@property (nonatomic, copy) ChoiceButtonClickedBlock choiceButtonClickedBlock;

- (instancetype)initWithMessage:(NSString *)message choiceButtonTitles:(NSArray *)titlesArray;
- (void)show;

@end
