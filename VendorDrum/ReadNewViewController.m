//
//  ReadNewViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/13.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "ReadNewViewController.h"

@interface ReadNewViewController ()

@end

@implementation ReadNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *labName = [[UILabel alloc] initWithFrame:CGRectMake(20, 84, DEVICEWIDTH/3-20, 40)];
    labName.font = normalFontStyle;
    labName.text = @"通知:";
    [self.view addSubview:labName];
    
    UILabel *labTime = [[UILabel alloc] initWithFrame:CGRectMake(labName.frame.size.width+20, 84, DEVICEWIDTH-labName.frame.size.width-40, 40)];
    labTime.font = labelFontStyle;
    labTime.textColor = [UIColor grayColor];
    labTime.textAlignment = NSTextAlignmentRight;
    labTime.text = @"2016-5-12 21:23:05";
    [self.view addSubview:labTime];
    UILabel *labelData = [[UILabel alloc] init];
    labelData.font = normalFontStyle;
    labelData.text = @"亲，商家已接单成功，请耐心等待发货吧! \n商家名称：中沙生活之家\n商家电话：400-6666-520 / 0538-5629999\n订单号：1029283445\n状态：已接单\n总价：168\n如有问题可拨打商家电话或直接在微信留言，客服将第一时间为您服务！   ";
    labelData.numberOfLines = 0;
    labelData.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize = CGSizeMake(DEVICEWIDTH-40, 9999);//labelsize的最大值
    //关键语句
    CGSize expectSize = [labelData sizeThatFits:maximumLabelSize];
    //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
    labelData.frame = CGRectMake(20, 140, expectSize.width, expectSize.height);
    [self.view addSubview:labelData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
