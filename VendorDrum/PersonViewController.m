//
//  PersonViewController.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/8/10.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "PersonViewController.h"
#import "ChangePassViewController.h"
#import "ChangeNameViewController.h"

@interface PersonViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>
@property (nonatomic,strong) UITableView   *tableView;
@property (nonatomic,strong) UIImageView   *imaHea;
@property (nonatomic,strong) UIActionSheet *actionSheet;
@property (nonatomic,strong) NSString *str;

@end
@implementation PersonViewController
@synthesize TuiDEle = _dele;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
    self.view.backgroundColor = [UIColor whiteColor];
    //
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section==0) {
        return 2;
    }else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 80;
        }else{
            return 40;
        }
    }else if(indexPath.section==1){
        
        return 40;
    }else{
        
        return DEVICEHIGHT-180-64;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section==2) {
        return 0.01;
    }else{
        return 10;
    }}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.font = normalFontStyle;
    if (indexPath.section==2) {
        //退出登陆
        UIButton *btnT = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, DEVICEWIDTH-60, 40)];
        [btnT setTitle:@"退出登陆" forState:UIControlStateNormal];
        btnT.backgroundColor = NavaCOLOR;
        btnT.layer.cornerRadius = 20;
        btnT.titleLabel.font = titleFontStyle;
        [btnT addTarget:self action:@selector(backLogin) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btnT];
    }else{
        if (indexPath.section==0) {
            if (indexPath.row==0) {
                cell.textLabel.text = @"头像";
                //头像
                _imaHea = [[UIImageView alloc] initWithFrame:CGRectMake(DEVICEWIDTH-80, 10,60, 60)];
                //                if (_str.length>0) {
                //                    NSData *dd = [NSData dataWithContentsOfFile:_str];
                //                    [_imaHea setImage:[UIImage imageWithData:dd]];
                //                }else{
                _imaHea.image = [UIImage imageNamed:@"headurl"];
                //                }
                _imaHea.layer.cornerRadius = 30;
                _imaHea.layer.masksToBounds = YES;
                _imaHea.userInteractionEnabled = YES;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapIma)];
                [_imaHea addGestureRecognizer:tap];
                [cell addSubview:_imaHea];
            }else{
                //用户名
                UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(DEVICEWIDTH-200, 10,180, 20)];
                lab.font = normalFontStyle;
                lab.text = @"呵呵呵呵尼玛";
                lab.textAlignment = NSTextAlignmentRight;
                [cell addSubview:lab];
                cell.textLabel.text = @"用户名";
            }
        }else{
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = @"修改密码";
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        
        if (indexPath.row==1) {
            
            ChangeNameViewController *chan = [[ChangeNameViewController alloc] init];
            [self.navigationController pushViewController:chan animated:YES];
        }
    }else if (indexPath.section==1){
        
        ChangePassViewController *chan = [[ChangePassViewController alloc] init];
        [self.navigationController pushViewController:chan animated:YES];
    }
}
//点击头像换头像
-(void)tapIma{
    NSLog(@"....");
    [self callActionSheetFunc];
}
#pragma mark  ===--===  调用相机有关的处理和设置
/**
 @ 调用ActionSheet
 */
- (void)callActionSheetFunc{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选择", nil ,nil];
    }else{
        self.actionSheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:nil otherButtonTitles:@"从相册选择", nil, nil];
    }
    self.actionSheet.tag = 1000;
    [self.actionSheet showInView:self.view];
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (actionSheet.tag == 1000) {
        NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    //来源:相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 1:
                    //来源:相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
                case 2:
                    return;
            }
        }
        else {
            if (buttonIndex == 0) {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                //                return;
            } else {
                //                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                return;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        [self presentViewController:imagePickerController animated:YES completion:^{
            
        }];
    }
}
//选中图片以后
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self saveImage:image WithName:@"userHead.png"];
    _imaHea.image = image;
}
//保存图片到沙河路径下
- (void)saveImage:(UIImage *)tempImage WithName:(NSString *)imageName
{
    NSData* imageData = UIImagePNGRepresentation(tempImage);
    NSString* documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* totalPath = [documentPath stringByAppendingPathComponent:imageName];
    //保存到 document
    [imageData writeToFile:totalPath atomically:NO];
    //保存到 NSUserDefaults
    //    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //    [userDefaults setObject:totalPath forKey:@"avatar"];
    //上传服务器
    //    [[HSLoginClass new] uploadAvatar:totalPath];
    NSLog(@"%@",totalPath);
    //     _str = totalPath;
    //    [_tableView reloadData];
}

//退出登陆
-(void)backLogin{
    [_dele backTui:@"2"];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
