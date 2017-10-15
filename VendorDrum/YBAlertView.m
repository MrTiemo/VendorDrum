//
//  YBAlertView.m
//  YBAlertView_Demo
//
//  Created by Jason on 16/1/12.
//  Copyright © 2016年 www.jizhan.com. All rights reserved.
//

#import "YBAlertView.h"

@interface YBAlertView ()

@property (nonatomic, strong) UIView *bgView;

@end

@implementation YBAlertView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10;
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)show
{
    if (self.bgView) return;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//    [self.bgView addGestureRecognizer:tap];
    
    self.bgView.userInteractionEnabled = YES;
    self.bgView.backgroundColor = [UIColor blackColor];
    self.bgView.alpha = 0.2;
    [window addSubview:self.bgView];
    
    [window addSubview:self];
    
}

- (void)close
{
    [self.bgView removeFromSuperview];
    self.bgView = nil;
    [self removeFromSuperview];
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    [self close];
}

@end
