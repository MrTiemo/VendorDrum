//
//  WLFSViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/16.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "WLFSViewController.h"

@interface WLFSViewController ()
@property (nonatomic,strong) UIButton *WlfsBtn;
@property (nonatomic,strong) NSMutableArray *interestArray;/*存放选中的按钮*/
@property (nonatomic,strong)UIButton    *btnSure;

@end

@implementation WLFSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.interestArray = [NSMutableArray new];
    [self viewView];
    
    
    _btnSure = [[UIButton alloc] initWithFrame:CGRectMake(30, 220, DEVICEWIDTH-60, 40)];
    [_btnSure setTitle:@"确   定" forState:UIControlStateNormal];
    _btnSure.backgroundColor = [UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00];
    _btnSure.layer.cornerRadius = 20;
    _btnSure.titleLabel.font = titleFontStyle;
    [_btnSure addTarget:self action:@selector(backto) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnSure];

}
//第二种方法
- (void)viewView{
    //第一个 label的起点
    CGSize size = CGSizeMake(5, 120);
    //间距
    CGFloat padding = 5.0;
    
    
    NSArray *titleArr = @[@"协助找车",@"支持走快递",@"支持走空运",@"支持周边送货",@"不支持港澳台",@"需自提",@"支持零担拼车",@"不支持西藏，云南，新疆等偏远地区",];
    for (int i = 0; i < titleArr.count; i ++) {
        
        CGFloat keyWorldWidth = [self getSizeByString:titleArr[i] AndFontSize:18].width;
        if (keyWorldWidth > DEVICEWIDTH) {
            keyWorldWidth = DEVICEWIDTH;
        }
        if (DEVICEWIDTH - size.width < keyWorldWidth) {
            size.height += 30.0;
            size.width = 5.0;
        }
        //创建 label点击事件
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(size.width, size.height-40, keyWorldWidth, 25)];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.layer.cornerRadius = 3.0;
        button.layer.masksToBounds = YES;
        button.layer.borderWidth = 0.5;
        button.layer.borderColor=[UIColor grayColor].CGColor;
        button.titleLabel.font = titleFontStyle;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [self.view addSubview:button];
        button.tag = i;
        [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
        //起点 增加
        size.width += keyWorldWidth+padding;
    }
}
- (void)handleButton:(UIButton *)button{
    button.selected = !button.selected;
    if (button.selected) {
        
        button.backgroundColor = [UIColor colorWithRed:0.10 green:0.67 blue:0.55 alpha:1.00];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_interestArray addObject:button.titleLabel.text];
        
    }else{
        
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_interestArray removeObject:button.titleLabel.text];
    }
}
//计算文字所占大小
- (CGSize)getSizeByString:(NSString*)string AndFontSize:(CGFloat)font
{
    CGSize size = [string boundingRectWithSize:CGSizeMake(999, 25) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    size.width += 5;
    return size;
}
-(void)backto{
    
    NSString *STR = [NSString new];
    for (int i = 0; i<_interestArray.count; i++) {
        NSString *str = [_interestArray objectAtIndex:i];
        STR = [NSString stringWithFormat:@"%@%@,",STR,str];
    }
    if (self.returnWLFSText!=nil) {
        self.returnWLFSText(STR);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)returnWLFS:(WLFSBlockText)block{
    self.returnWLFSText = block;
}


@end
