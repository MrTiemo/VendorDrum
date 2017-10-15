//
//  NiceAlertSheet.m
//  NiceAlertSheet
//
//  Created by Jax on 16/6/6.
//  Copyright © 2016年 Jax. All rights reserved.
//


#import "NiceAlertSheet.h"
#import "UIWindow+Extension.h"

static CGFloat const kMessageLabelHeght                  = 40.0f;
static CGFloat const kChoiceButtonHeght                  = 40.0f;
static CGFloat const kCancelButtonHeght                  = 40.0f;
static CGFloat const kMoveToSupviewDuration              = 0.35f;
static CGFloat const kRemoveFromSupviewDuration          = 0.35f;
static CGFloat const kMarginBetweenChoiceAndCancelButton = 8.0f;

@interface NiceAlertSheet()

@property (nonatomic, strong) UIButton *coverBtn;
@property (nonatomic, assign) CGFloat  selfHeight;

@end

@implementation NiceAlertSheet

- (instancetype)initWithMessage:(NSString *)message choiceButtonTitles:(NSArray *)titlesArray {
    if (self = [super init]) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.selfHeight      = 1 + kMessageLabelHeght + titlesArray.count * (kChoiceButtonHeght + 0.5) + kMarginBetweenChoiceAndCancelButton + kCancelButtonHeght;
        
        UIView *lineView     = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
        self.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
        [self addSubview:lineView];
        
        UILabel *messageLabel        = [[UILabel alloc] initWithFrame:CGRectMake(0, 1, kScreenWidth, kMessageLabelHeght)];
        messageLabel.text            = message;
        messageLabel.textAlignment   = NSTextAlignmentCenter;
        messageLabel.font            = normalFontStyle;
        messageLabel.textColor       = [UIColor redColor];
        messageLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:messageLabel];
        
        for (int i = 0; i < titlesArray.count; i ++) {
            UIButton *choiceButton = [[UIButton alloc] init];
            CGFloat choiceButtonY  = CGRectGetMaxY(messageLabel.frame) + 1 + i * (kChoiceButtonHeght + 0.5);
            choiceButton.frame     = CGRectMake(0, choiceButtonY, kScreenWidth, kChoiceButtonHeght);
            choiceButton.tag       = i;
            choiceButton.titleLabel.font = normalFontStyle;
            choiceButton.backgroundColor = [UIColor whiteColor];
            [choiceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [choiceButton setTitle:titlesArray[i] forState:UIControlStateNormal];
            [choiceButton addTarget:self action:@selector(choiceButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:choiceButton];
        }
        
        UIButton *cancelButton       = [[UIButton alloc] init];
        CGFloat cancelButtonY        = CGRectGetMaxY(messageLabel.frame) + titlesArray.count * (kChoiceButtonHeght + 0.5) + kMarginBetweenChoiceAndCancelButton;
        cancelButton.frame           = CGRectMake(0, cancelButtonY, kScreenWidth, kCancelButtonHeght);
        cancelButton.backgroundColor = [UIColor whiteColor];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        cancelButton.titleLabel.font = normalFontStyle;
        [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(cancelButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancelButton];
        
    }
    return self;
}

- (void)show {
    self.frame = CGRectMake(0, kScreenHeight, kScreenWidth, self.selfHeight);
    [[UIWindow lastWindow] addSubview:self];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    [super willMoveToSuperview:newSuperview];
    
    if (newSuperview == nil) {
        return ;
    }
    if (!self.coverBtn) {
        self.coverBtn                  = [[UIButton alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.coverBtn.backgroundColor  = [UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:0.50];
        self.coverBtn.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self.coverBtn addTarget:self action:@selector(coverBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    UIWindow *lastWindow = [UIWindow lastWindow];
    [lastWindow addSubview:self.coverBtn];
    
    CGRect afterFrame = CGRectMake(0, kScreenHeight - self.selfHeight, kScreenWidth, self.selfHeight);
    [UIView animateWithDuration:kMoveToSupviewDuration delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = afterFrame;
    } completion:^(BOOL finished) {
    
    }];

}

- (void)removeFromSuperview {
    [self.coverBtn removeFromSuperview];
    self.coverBtn = nil;
    
    CGRect afterFrame = CGRectMake(0, kScreenHeight, kScreenWidth, self.selfHeight);
    [UIView animateWithDuration:kRemoveFromSupviewDuration delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.frame = afterFrame;
    } completion:^(BOOL finished) {
        [super removeFromSuperview];
    }];
}

- (void)coverBtnClicked:(UIButton *)sender {
    [self removeFromSuperview];
}

- (void)choiceButtonClicked:(UIButton *)sender {
    [self removeFromSuperview];
    
    if (self.choiceButtonClickedBlock) {
        self.choiceButtonClickedBlock(sender.tag);
    }
}

- (void)cancelButtonClicked:(UIButton *)sender {
    [self removeFromSuperview];
}

@end
