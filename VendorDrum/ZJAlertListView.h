//
//  ZJAlertListView.h
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

#import <UIKit/UIKit.h>

typedef void (^ZJAlertListViewBlock)();

@class ZJAlertListView;

//ZJAlertListView数据源方法
@protocol ZJAlertListViewDatasource <NSObject>
//ZJAlertListView有多少行
- (NSInteger)alertListTableView:(ZJAlertListView *)tableView numberOfRowsInSection:(NSInteger)section;
//ZJAlertListView每个cell的样式
- (UITableViewCell *)alertListTableView:(ZJAlertListView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

//代理方法
@protocol ZJAlertListViewDelegate <NSObject>
//ZJAlertListView cell的选中
- (void)alertListTableView:(ZJAlertListView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
//ZJAlertListView cell为被选中
- (void)alertListTableView:(ZJAlertListView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ZJAlertListView : UIView<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) id <ZJAlertListViewDatasource> datasource;

@property (nonatomic, weak) id <ZJAlertListViewDelegate> delegate;

//view的标题
@property (nonatomic, strong) UILabel *titleLabel;


//ZJAlertListView展示界面
- (void)show;

//ZJAlertListView消失界面
- (void)dismiss;

//列表cell的重用
- (id)dequeueReusableAlertListCellWithIdentifier:(NSString *)identifier;

- (UITableViewCell *)alertListCellForRowAtIndexPath:(NSIndexPath *)indexPath;

//设置确定按钮的标题，如果不设置的话，点击按钮没有响应
- (void)setDoneButtonWithBlock:(ZJAlertListViewBlock)block;

//如果在取消的时候也需要做一些事情的时候才设置它。不设置它的时候，只是让ZJAlertListView消失
- (void)setCancelButtonBlock:(ZJAlertListViewBlock)block;

//选中的列表元素
- (NSIndexPath *)indexPathForSelectedRow;

@end
