//
//  ZJAlertListView.m
//  弹框列表
//
//  Created by James on 16/1/21.
//  Copyright © 2016年 James. All rights reserved.
//

/**
 
 *******************************************************
 *                                                      *
 * 感谢您的支持， 如果下载的代码在使用过程中出现BUG或者其他问题    *
 * 您可以发邮件到axxinzhijia@163.com 或者 到                       *
 * https://github.com/ZJAlertListView 提交问题     *
 *                                                      *
 *******************************************************
 
 */

#import "ZJAlertListView.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

// 颜色
#define ZJColor      [UIColor colorWithRed:0.91 green:0.31 blue:0.28 alpha:1.00]
#define ZJColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

static char * const alertListViewButtonClickForDone = "alertListViewButtonClickForDone";
static char * const alertListViewButtonClickForcancel = "alertListViewButtonClickForcancel";
static CGFloat ZJCustomButtonHeight = 44;
static UIButton *_cover;
static ZJAlertListViewBlock _block;

@interface ZJAlertListView()

@property (nonatomic, strong) UITableView *mainAlertListView;                 //列表视图
@property (nonatomic, strong) UIButton *doneButton;                           //确定按钮
@property (nonatomic, strong) UIButton *cancelButton;                         //取消按钮

@end

@implementation ZJAlertListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTheInterface];
    }
    return self;
}

//对弹框的布局
- (void)initTheInterface
{
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth = 1.0f;
    self.layer.cornerRadius = 10.0f;
    self.clipsToBounds = TRUE;
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    self.titleLabel.backgroundColor = ZJColor;
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    CGFloat xWidth = self.bounds.size.width;
    //显示不全的情况下，省略号的位置
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.titleLabel.frame = CGRectMake(0, 0, xWidth, ZJCustomButtonHeight);
    [self addSubview:self.titleLabel];
    
    CGRect tableFrame = CGRectMake(0, ZJCustomButtonHeight, xWidth, self.bounds.size.height - 2 * ZJCustomButtonHeight);
    _mainAlertListView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    self.mainAlertListView.dataSource = self;
    self.mainAlertListView.delegate = self;
    [self addSubview:self.mainAlertListView];
    
    CGRect doneBtn = CGRectMake(0, self.bounds.size.height - ZJCustomButtonHeight, self.bounds.size.width / 2.0f - 0.5, ZJCustomButtonHeight);
    UIButton *doneButton = [[UIButton alloc] initWithFrame:doneBtn];
    doneButton.backgroundColor = ZJColor;
    [doneButton setTitle:@"确定" forState:UIControlStateNormal];
    [doneButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [doneButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    self.doneButton = doneButton;
    [self.doneButton addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.doneButton];
    
    CGRect cancelBtn = CGRectMake(self.bounds.size.width / 2.0f + 1, self.bounds.size.height - ZJCustomButtonHeight, self.bounds.size.width / 2.0f - 0.5, ZJCustomButtonHeight);
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:cancelBtn];
    cancelButton.backgroundColor = ZJColor;
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    self.cancelButton = cancelButton;
    
    ZJAlertListViewBlock __block block;
    if (block){
        [self.cancelButton addTarget:self action:@selector(buttonWasPressed:) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self.cancelButton addTarget:self action:@selector(touchForDismissSelf:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self addSubview:self.cancelButton];

}

- (NSIndexPath *)indexPathForSelectedRow
{
    return [self.mainAlertListView indexPathForSelectedRow];
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.datasource && [self.datasource respondsToSelector:@selector(alertListTableView:numberOfRowsInSection:)])
    {
        return [self.datasource alertListTableView:self numberOfRowsInSection:section];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.datasource && [self.datasource respondsToSelector:@selector(alertListTableView:cellForRowAtIndexPath:)])
    {
        return [self.datasource alertListTableView:self cellForRowAtIndexPath:indexPath];
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(alertListTableView:didDeselectRowAtIndexPath:)])
    {
        [self.delegate alertListTableView:self didDeselectRowAtIndexPath:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(alertListTableView:didSelectRowAtIndexPath:)])
    {
        [self.delegate alertListTableView:self didSelectRowAtIndexPath:indexPath];
    }
}

#pragma mark - Animated Mthod
- (void)animatedIn
{
    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.alpha = 0;
    [UIView animateWithDuration:.35 animations:^{
        self.alpha = 1;
        self.transform = CGAffineTransformMakeScale(1, 1);
    }];
}

- (void)animatedOut
{
    [UIView animateWithDuration:.35 animations:^{
        [self removeFromSuperview];
        [_cover removeFromSuperview];
        _cover = nil;
    }];
}

- (void)show
{
    UIWindow *keywindow = [[UIApplication sharedApplication].windows lastObject];
    keywindow.windowLevel = UIWindowLevelNormal;
    // 遮盖
    UIButton *cover = [[UIButton alloc] init];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.8;
    [cover addTarget:self action:@selector(animatedOut) forControlEvents:UIControlEventTouchUpInside];
    cover.frame = [UIScreen mainScreen].bounds;
    _cover = cover;
    
    [keywindow addSubview:cover];
    [keywindow addSubview:self];
    
    self.center = CGPointMake(keywindow.bounds.size.width/2.0f,
                              keywindow.bounds.size.height/2.0f);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self tableView:self.mainAlertListView didSelectRowAtIndexPath:indexPath];
    
    [self animatedIn];
}

- (void)dismiss
{
    [self animatedOut];
}

- (id)dequeueReusableAlertListCellWithIdentifier:(NSString *)identifier
{
    return [self.mainAlertListView dequeueReusableCellWithIdentifier:identifier];
}

- (UITableViewCell *)alertListCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.mainAlertListView reloadData];
    return [self.mainAlertListView cellForRowAtIndexPath:indexPath];
}

- (void)setDoneButtonWithBlock:(ZJAlertListViewBlock)block
{
     objc_setAssociatedObject(self.doneButton, alertListViewButtonClickForDone, [block copy], OBJC_ASSOCIATION_RETAIN);
}

- (void)setCancelButtonBlock:(ZJAlertListViewBlock)block{
    objc_setAssociatedObject(self.cancelButton, alertListViewButtonClickForcancel, [block copy], OBJC_ASSOCIATION_RETAIN);
}
#pragma mark - UIButton Clicke Method
- (void)buttonWasPressed:(id)sender
{
   ZJAlertListViewBlock __block block;
    UIButton *button = (UIButton *)sender;
    if (button == self.doneButton){
        
        block = objc_getAssociatedObject(sender, alertListViewButtonClickForDone);
        
    }else if(button == self.cancelButton){
        
        block = objc_getAssociatedObject(sender, alertListViewButtonClickForcancel);
        
    }
    if (block){
        block();
    }
}

- (void)touchForDismissSelf:(id)sender
{
    [self animatedOut];
}

@end
