//
//  HistoryNewViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/9/4.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "HistoryNewViewController.h"
#import "TWSelectCityView.h"

@interface HistoryNewViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong ,nonatomic )UITableView *tableView;
@property (strong ,nonatomic )UITextField *textPerson;
@property (strong ,nonatomic )UITextField *textPhone;
@property (strong ,nonatomic )UILabel *textAdd;
@property (strong ,nonatomic )UITextField *textadd;
@property (strong ,nonatomic )UIButton *AddressBtn;

@end
@implementation HistoryNewViewController
@synthesize deleNew =_deleNew;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新建收货地址";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //自定义右按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ok"] style:UIBarButtonItemStyleDone target:self action:@selector(backData)];
    _textPerson = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH*0.75, 60)];
    _textPhone = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH*0.75, 60)];
    _textAdd = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH*0.75, 60)];
    _textadd = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH*0.75, 60)];
    //    _AddressBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-60, 0, 60, 60)];
    //    _AddressBtn.contentMode = UIViewContentModeScaleAspectFit;
    //    [_AddressBtn setImage:[UIImage imageNamed:@"address"] forState:UIControlStateNormal];
    //    _AddressBtn.backgroundColor = [UIColor whiteColor];
    //    [_AddressBtn addTarget:self action:@selector(dingwei) forControlEvents:UIControlEventTouchUpInside];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,DEVICEWIDTH , 320) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = normalFontStyle;
    if (indexPath.row==0) {
        cell.textLabel.text = @"联系人";
        _textPerson.placeholder = @"请输入真实姓名";
        _textPerson.font =normalFontStyle;
        [cell addSubview:_textPerson];
    }else if (indexPath.row==1){
        cell.textLabel.text = @"手机号码";
        _textPhone.placeholder = @"请输入11位有效手机号";
        _textPhone.font =normalFontStyle;
        [cell addSubview:_textPhone];
    }else if (indexPath.row==2){
        cell.textLabel.text = @"所在地区";
        _textAdd.font =normalFontStyle;
        _textAdd.text = @"请点击获取地点";
        _textAdd.textColor = [UIColor colorWithRed:0.81 green:0.81 blue:0.82 alpha:1.00];
        //        [cell addSubview:_AddressBtn];
        [cell addSubview:_textAdd];
    }else{
        cell.textLabel.text = @"详细地址";
        _textadd.placeholder = @"输入街道,楼号和门牌号等详细信息";
        _textadd.font  = normalFontStyle;
        [cell addSubview:_textadd];
    }
    return cell;
}
//-(void)dingwei{
//    NSLog(@"点击了定位");
//}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [_textadd resignFirstResponder];
    [_textPhone resignFirstResponder];
    [_textPerson resignFirstResponder];
    
    if (indexPath.row==2) {
        TWSelectCityView *city = [[TWSelectCityView alloc] initWithTWFrame:self.view.bounds TWselectCityTitle:@"选择地区"];
        //        __weak typeof(self)blockself = self;
        [city showCityView:^(NSString *proviceStr, NSString *cityStr, NSString *distr) {
            _textAdd.text = [NSString stringWithFormat:@" %@%@%@",proviceStr,cityStr,distr];
            _textAdd.textColor = BlackColor;
            _textAdd.font =normalFontStyle;
        }];
    }
}
-(void)backData{
    //返回这个界面的值
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:_textPerson.text forKey:@"Person"];
    [dic setValue:_textPhone.text forKey:@"Phone"];
    [dic setValue:_textAdd.text forKey:@"Address"];
    [dic setValue:_textadd.text forKey:@"address"];
    [self.deleNew AddressNewBack:dic];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
