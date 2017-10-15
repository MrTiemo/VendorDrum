//
//  AFNetWork.m
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/9.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import "AFNetWork.h"

@implementation AFNetWork
-(void)AFGET:(NSString *)urlString BodyDic:(NSMutableDictionary *)bodyDic DataBlock:(void (^)(id))dataBlock ErrorBlock:(void (^)(id))ErrBlock
{
    //创建管理者对象(session)
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置允许请求的类别
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //开始请求
    [manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        dataBlock(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ErrBlock(error);
        NSLog(@"请求失败");
    }];
}
-(void)AFPOST:(NSString *)urlString BodyDic:(NSMutableDictionary *)bodyDic DataBlock:(void (^)(id))dataBlock ErrorBlock:(void (^)(id))ErrBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:urlString parameters:bodyDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        dataBlock(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
    }];
}
//上传图片
-(void)AFImagePost:(NSString *)urlString BodyDic:(UIImage *)bodyDic DataBlock:(void (^)(id))dataBlock ErrorBlock:(void (^)(id))ErrBlock{





}
@end
