//
//  ShoppingCartViewController.h
//  TDS
//
//  Created by 黎金 on 16/3/24.
//  Copyright © 2016年 sixgui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCartViewController : UIViewController

@property (nonatomic,strong)NSString *Tstr;


@property (strong, nonatomic) IBOutlet UIView *naviView;
@property (strong, nonatomic) IBOutlet UIButton *returnBtn;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic)  UIButton *editLabel;

@property (strong, nonatomic) IBOutlet UIView *bottomView;
@property (strong, nonatomic) IBOutlet UIImageView *allImage;
@property (strong, nonatomic) IBOutlet UIButton *allBtn;
@property (strong, nonatomic) IBOutlet UILabel *allPriceLabel;
@property (strong, nonatomic) IBOutlet UILabel *subLabel;
@property (strong, nonatomic) IBOutlet UIButton *settlementButton;
@property (strong, nonatomic) IBOutlet UILabel *settlementLabel;
@end
