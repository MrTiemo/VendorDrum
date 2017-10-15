//
//  UserThinkViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/15.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "UserThinkViewController.h"
#import "UserthinkCell.h"

@interface UserThinkViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *NumLab;
@property (nonatomic, strong) TQStarRatingView *starRatingView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, assign) NSInteger x;
@property (nonatomic, strong) NSMutableArray * btnArray;
@property (nonatomic, strong) UIButton *shouBtn;

@end

@implementation UserThinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"用户评价";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _btnArray = [[NSMutableArray alloc] init];
    //初始化tableview
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 80, DEVICEWIDTH, DEVICEHIGHT-80) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIView *viewD = [[UIView alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH, 80)];
    viewD.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewD];
    //评分分数
    _NumLab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 10, 30, 20)];
    _NumLab.text = @"3.3";
    _NumLab.font = titleFontStyle;
    _NumLab.textAlignment = NSTextAlignmentCenter;
    _NumLab.textColor = [UIColor colorWithRed:0.13 green:0.67 blue:0.22 alpha:1.00];
    [viewD addSubview:_NumLab];
    
    _starRatingView = [[TQStarRatingView alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3+30,10,DEVICEWIDTH/3-30,20)];
    [_starRatingView setScore:3.3/5 withAnimation:YES];
    _starRatingView.userInteractionEnabled = NO;
    [viewD addSubview:_starRatingView];
    
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"全部",@"好评",@"中评",@"差评", nil];
    for (int i =0; i<4; i++) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(i*(DEVICEWIDTH/4), 50, DEVICEWIDTH/4, 30)];
        [_button setTitle:[NSString stringWithFormat:@"%@",[arr objectAtIndex:i]] forState:UIControlStateNormal];
        _button.tag = i+1;
        _button.titleLabel.font = normalFontStyle;
        if (i==0) {
            _button.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1.00];
            [_button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }else{
            _button.backgroundColor = [UIColor colorWithRed:0.13 green:0.67 blue:0.22 alpha:1.00];
        }
        [_button addTarget:self action:@selector(pingjia:) forControlEvents:UIControlEventTouchUpInside];
        [viewD addSubview:_button];
        [_btnArray addObject:_button];//添加到数组
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cell";
    UserthinkCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell = [[UserthinkCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.starRatingView setScore:4.5/5 withAnimation:YES];
    cell.nameLab.text = @"我勒个槽";
    cell.timeLab.text = @"2016-3-12";
    cell.pingLab.text = @"这是个啥玩意，大声告诉我，这是啥";
    return cell;
}
-(void)pingjia:(UIButton*)button{
    NSLog(@"%ld",(long)button.tag);
    for (UIButton *btn in _btnArray) {
        if (btn.tag ==button.tag) {
            btn.backgroundColor = [UIColor colorWithRed:0.81 green:0.81 blue:0.82 alpha:1.00];
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        } else {
            btn.backgroundColor = [UIColor colorWithRed:0.13 green:0.67 blue:0.22 alpha:1.00];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}

@end
