//
//  AdministrationVC.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/7.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "AdministrationVC.h"
#import "AdminCell.h"
#import "StoreEditViewController.h"
#import "AddGoodsViewController.h"
#import "LXAlertView.h"



@interface AdministrationVC ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIAlertViewDelegate,addProductArrDelegate>
@property (nonatomic,strong)UILabel      *gonggaoLab;   ///<滚动label的文字
@property (nonatomic,strong)UITableView  *lefttable;    ///<类别tableview
@property (nonatomic,strong)UITableView  *righttable;   ///<商品tableview
@property (nonatomic,strong)NSMutableArray  *leftArr;   ///<类别的数组
@property (nonatomic,strong)NSMutableArray  *rightArr;  ///<商品数组
@property (nonatomic,strong)UITextField     *textLeft;  ///<类名编辑
@property (nonatomic)NSInteger       numTag;            ///<标记长按手势点击的哪一个cell
@property (nonatomic)NSInteger       numCell;            ///<标记点击的哪一个cell
@property (nonatomic,strong)NSMutableArray  *SectionArr; ///<单个分区的
@end

@implementation AdministrationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.86 green:0.86 blue:0.87 alpha:1.00];
    self.title = @"店铺名称";
    //店铺公告
    _gonggaoLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, DEVICEWIDTH, 30)];
    _gonggaoLab.text = @"玛德智障： 这特么到底是一个什么东西，真服了，不行了，我死了快";
    _gonggaoLab.textAlignment = NSTextAlignmentLeft;
    _gonggaoLab.textColor = [UIColor whiteColor];
    _gonggaoLab.backgroundColor = [UIColor colorWithRed:0.99 green:0.57 blue:0.20 alpha:1.00];
    _gonggaoLab.font = normalFontStyle;
    [self.view addSubview:_gonggaoLab];
    
    //店铺信息
    UIView *viewD = [[UIView alloc] initWithFrame:CGRectMake(0, 94, DEVICEWIDTH, 60)];
    viewD.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewD];
    //店铺图标
    UIImageView *imaV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    imaV.image = [UIImage imageNamed:@"sg"];
    imaV.layer.masksToBounds = YES;
    imaV.layer.cornerRadius = 20;
    [viewD addSubview:imaV];
    //店铺名字
    UILabel *labV = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 20)];
    labV.text = @"店铺一号";
    labV.font= labelFontStyle;
    [viewD addSubview:labV];
    //右箭头
    UILabel *labJ = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-20, 20, 20, 20)];
    labJ.font = normalFontStyle;
    labJ.text = @">";
    labJ.textColor = [UIColor grayColor];
    [viewD addSubview:labJ];
    //单击手势，推出店铺信息编辑的页面
    UITapGestureRecognizer *panRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushEdit)];
    [viewD addGestureRecognizer:panRecognizer];//关键语句，给self.view添加一个手势监测；
    ////********************************左边的类别列表
    _lefttable = [[UITableView alloc] initWithFrame:CGRectMake(0, 155, DEVICEWIDTH/3, DEVICEHIGHT-155) style:UITableViewStyleGrouped];
    _lefttable.delegate = self;
    _lefttable.dataSource = self;
    _lefttable.tag = 1001;
    [self.view addSubview:_lefttable];
    
    //＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊右边的商品列表
    _righttable = [[UITableView alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, 155, DEVICEWIDTH/3*2, DEVICEHIGHT-205) style:UITableViewStyleGrouped];
    _righttable.delegate = self;
    _righttable.dataSource = self;
    _righttable.tag = 1002;
    _righttable.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_righttable];
    
    
    UIView *viewXiu = [[UIView alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3, DEVICEHIGHT-50, DEVICEWIDTH/3*2, 50)];
    viewXiu.backgroundColor = [UIColor colorWithRed:0.42 green:0.42 blue:0.42 alpha:1.00];
    [self.view addSubview:viewXiu];
    
    UIButton *btnXiu = [[UIButton alloc] initWithFrame:CGRectMake(viewXiu.frame.size.width-100, 10, 60, 30)];
    btnXiu.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
    [btnXiu setTitle:@"休息" forState:UIControlStateNormal];
    [btnXiu setTitleColor:BlackColor forState:UIControlStateNormal];
    btnXiu.titleLabel.font = labelFontStyle;
    [btnXiu addTarget:self action:@selector(xiuxi) forControlEvents:UIControlEventTouchUpInside];
    btnXiu.layer.cornerRadius = 4;
    [viewXiu addSubview:btnXiu];
    _leftArr = [[NSMutableArray alloc] init];  //左边的数组
    _rightArr = [[NSMutableArray alloc] init];
    _SectionArr = [[NSMutableArray alloc] init];
    
}
#pragma mark UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView.tag==1001) {
        return _leftArr.count+1;
    }else{
        //判断左边有没有类别，没有直接显示为空
        if (_leftArr.count==0) {
            return 0;
        }else{
            return _SectionArr.count+1;
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag==1001) {
        if (indexPath.row==_leftArr.count) {
            return 40;
        }else{
            return 60;}
    }else{
        
        if (indexPath.row==_SectionArr.count){
            return 40;
        }else{
            return 80;
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag==1001) {
        
        static NSString *cellID = @"cell";
        
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        if (indexPath.row==_leftArr.count) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/6-10, 10, 20, 20)];
            [btn setBackgroundImage:[UIImage imageNamed:@"TJ"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(addLeftArr) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:btn];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else{
            
            cell.textLabel.text = [NSString stringWithFormat:@"%@",[_leftArr objectAtIndex:indexPath.row]];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.font = labelFontStyle;
            //给cell添加一个长按手势
            UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
            //            longPressGr.minimumPressDuration = 1.0;
            [cell addGestureRecognizer:longPressGr];
            cell.tag = indexPath.row+1;
        }
        return cell;
        
    }else{
        static NSString *cellID = @"cell";
        AdminCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (!cell) {
            cell = [[AdminCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row==_SectionArr.count) {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH/3*2/2-10, 10, 20, 20)];
            [btn setBackgroundImage:[UIImage imageNamed:@"TJ"] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(addRight) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:btn];
        }else{
            cell.goodsImg.image = [UIImage imageNamed:@"sg"];
            cell.priceLab.text = @"22/斤";
            cell.titleLab.text = @"商品名称";
            cell.yuShouLab.text = @"预售";
            cell.EditBtn.tag = 1001;
            cell.upBtn.tag = 1001;
        }
        return cell;
        
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==1001) {
        if (indexPath.row==_leftArr.count) {
            //当点击的是按钮的时候，不做处理，防止点击按钮也会刷新rightTableview
        }else{
            //获取对应的数组，刷新显示
            _numCell=indexPath.row;
            _SectionArr = [_rightArr objectAtIndex:indexPath.row];
            [_righttable reloadData];
            
        }
    }
}
#pragma mark -------------＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊添加按钮以及alertview处理＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊＊

//输入类别的alertview
-(void)addLeftArr{
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"输入分类名："
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"确定", nil];
    // 基本输入框，显示实际输入的内容
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.delegate = self;
    alert.tag = 1001;
    [alert show];
    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag==1001) {
        if (buttonIndex==1)
        {//添加类型
            NSString *str =[NSString stringWithFormat:@"%@",[alertView textFieldAtIndex:0].text];
            [_leftArr setObject:str atIndexedSubscript:_leftArr.count];
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            [_rightArr addObject:arr];
            [_lefttable reloadData];
        }
    }else{
        if (buttonIndex==1)
        {
            //修改类型
            NSString *str =[NSString stringWithFormat:@"%@",[alertView textFieldAtIndex:0].text];
            [_leftArr replaceObjectAtIndex:_numTag-1 withObject:str];
            [_lefttable reloadData];
        }
    }
}
-(void)addRight{
    
    AddGoodsViewController *addgoods = [[AddGoodsViewController alloc] init];
    addgoods.dele = self;
    [self.navigationController pushViewController:addgoods animated:YES];
    
}
//新增商品页面传过来的商品
-(void)addProductArr:(NSMutableArray *)values{
    
    NSLog(@"%@",values);
    
    for (int i =0; i<values.count; i++) {
        [[_rightArr objectAtIndex:_numCell] addObject:@"123"];
    }
    [_righttable reloadData];
    
}

-(void)pushEdit{
    StoreEditViewController *storeEdit = [[StoreEditViewController alloc] init];
    [self.navigationController pushViewController:storeEdit animated:YES];
    
}
#pragma mark -------------//长按手势触发的事件

-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        NSLog(@"%ld",gesture.view.tag);
        _numTag =gesture.view.tag;
        [self becomeFirstResponder];
        UIMenuItem *editA = [[UIMenuItem alloc] initWithTitle:@"编辑" action:@selector(editArr:)];
        UIMenuItem *deleteA = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(deleteArr:)];
        UIMenuController *menu=[UIMenuController sharedMenuController];
        [menu setMenuItems:[NSArray arrayWithObjects:editA,deleteA,nil]];
        [menu setTargetRect:gesture.view.bounds inView:gesture.self.view];
        [menu setMenuVisible:YES animated:YES];
    }
}
//编辑
-(void)editArr:(id)sender{
    
    NSLog(@"编辑");
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"输入分类名："
                                                    message:nil
                                                   delegate:nil
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"确定", nil];
    // 基本输入框，显示实际输入的内容
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.delegate = self;
    alert.tag = 1002;
    [alert show];
}
//删除类型
-(void)deleteArr:(UIMenuItem *)sender{
    NSLog(@"删除");
    [_leftArr removeObjectAtIndex:_numTag-1];
    [_rightArr removeObjectAtIndex:_numCell];
    [_righttable reloadData];
    [_lefttable reloadData];
}
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    return [super canPerformAction:action withSender:sender];
}
-(BOOL)canBecomeFirstResponder{
    return YES;
}
//休息
-(void)xiuxi{
    
    LXAlertView *alert=[[LXAlertView alloc] initWithTitle:@"店铺休息以后将不会在前端展示" message:@"确定要休息吗？" cancelBtnTitle:@"继续营业" otherBtnTitle:@"暂时休息" clickIndexBlock:^(NSInteger clickIndex) {
        
        NSLog(@"点击index====%ld",(long)clickIndex);
        
    }];
//    alert.dontDissmiss=YES;
//    设置动画类型(默认是缩放)
    alert.animationStyle=LXASAnimationLeftShake;
    [alert showLXAlertView];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
