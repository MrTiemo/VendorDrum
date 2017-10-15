//
//  NewAddressView.m
//  ASJDemo
//
//  Created by 爱尚家 on 16/6/20.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)
#import "NewAddressView.h"
#import "CCLocationManager.h"

@interface NewAddressView ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate>
{
    CLLocationManager *locationmanager;

}
@property (strong ,nonatomic )UITableView *tableView;
@property (strong ,nonatomic )UITextField *textPerson;
@property (strong ,nonatomic )UITextField *textPhone;
@property (strong ,nonatomic )UITextField *textAdd;
@property (strong ,nonatomic )UITextField *textadd;
@property (strong ,nonatomic )UIButton *AddressBtn;

@end

@implementation NewAddressView
@synthesize dele =_dele;

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"新建收货地址";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //自定义右按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ok"] style:UIBarButtonItemStyleDone target:self action:@selector(backData)];
    //启动定位服务
    if (IS_IOS8) {
        [UIApplication sharedApplication].idleTimerDisabled = TRUE;
        locationmanager = [[CLLocationManager alloc] init];
        [locationmanager requestAlwaysAuthorization];        //NSLocationAlwaysUsageDescription
        [locationmanager requestWhenInUseAuthorization];     //NSLocationWhenInUseDescription
        locationmanager.delegate = self;
    }
    _textPerson = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH*0.75, 60)];
    _textPhone = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH*0.75, 60)];
    _textAdd = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH*0.75-60, 60)];
    _textadd = [[UITextField alloc] initWithFrame:CGRectMake(DEVICEWIDTH/4, 0, DEVICEWIDTH*0.75, 60)];
    
    _AddressBtn = [[UIButton alloc] initWithFrame:CGRectMake(DEVICEWIDTH-60, 0, 60, 60)];
    _AddressBtn.contentMode = UIViewContentModeScaleAspectFit;
    [_AddressBtn setImage:[UIImage imageNamed:@"address"] forState:UIControlStateNormal];
    _AddressBtn.backgroundColor = [UIColor whiteColor];
    [_AddressBtn addTarget:self action:@selector(dingwei) forControlEvents:UIControlEventTouchUpInside];
    
    
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
    
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:15];
    if (indexPath.row==0) {
        cell.textLabel.text = @"联系人";
        _textPerson.placeholder = @"请输入真实姓名";
        _textPerson.font =[UIFont fontWithName:@"Arial" size:15];
        [cell addSubview:_textPerson];
    }else if (indexPath.row==1){
        cell.textLabel.text = @"手机号码";
        _textPhone.placeholder = @"请输入11位有效手机号";
        _textPhone.font =[UIFont fontWithName:@"Arial" size:15];
        [cell addSubview:_textPhone];
    }else if (indexPath.row==2){
        cell.textLabel.text = @"所在地区";
        _textAdd.placeholder = @"请输入或者点击右按钮定位";
        _textAdd.font =[UIFont fontWithName:@"Arial" size:15];
        [cell addSubview:_AddressBtn];
        [cell addSubview:_textAdd];
    }
    else{
        cell.textLabel.text = @"详细地址";
        _textadd.placeholder = @"输入街道,楼号和门牌号等详细信息";
        _textadd.font =[UIFont fontWithName:@"Arial" size:13];
        [cell addSubview:_textadd];
    }
    return cell;
}
-(void)dingwei{

    if (IS_IOS8) {

    __block NSString *string;
        [[CCLocationManager shareLocation]getLocationCoordinate:^(CLLocationCoordinate2D locationCorrrdinate) {
            string = [NSString stringWithFormat:@"%f %f",locationCorrrdinate.latitude,locationCorrrdinate.longitude];
        } withAddress:^(NSString *addressString) {
            NSLog(@"%@",addressString);
            string = [NSString stringWithFormat:@"%@%@",string,addressString];
            NSLog(@"%lu",(unsigned long)addressString.length);
            if (string.length>0) {
                NSRange range = [string rangeOfString:@"省"];
                NSString *str = [string substringFromIndex:range.location+1];
                NSLog(@"%@",str);
                _textAdd.text = str;
            }
            
        }];
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
-(void)backData{
    //返回这个界面的值
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:_textPerson.text forKey:@"Person"];
    [dic setValue:_textPhone.text forKey:@"Phone"];
    [dic setValue:_textAdd.text forKey:@"Address"];
    [dic setValue:_textadd.text forKey:@"address"];
    [self.dele AddressBack:dic];
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
