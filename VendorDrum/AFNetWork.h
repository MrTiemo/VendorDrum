//
//  AFNetWork.h
//  VendorDrum
//
//  Created by 爱尚家 on 16/7/9.
//  Copyright © 2016年 爱尚家. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLSessionManager.h"
#import "AFHTTPSessionManager.h"
#import "UIImageView+AFNetworking.h"

@interface AFNetWork : NSObject
-(void)AFGET:(NSString *)urlString BodyDic:(NSMutableDictionary *)bodyDic DataBlock:(void(^)(id data))dataBlock ErrorBlock:(void(^)(id errOr))ErrBlock;
-(void)AFPOST:(NSString *)urlString BodyDic:(NSMutableDictionary *)bodyDic DataBlock:(void(^)(id data))dataBlock ErrorBlock:(void(^)(id errOr))ErrBlock;
-(void)AFImagePost:(NSString *)urlString BodyDic:(UIImage *)bodyDic DataBlock:(void(^)(id data))dataBlock ErrorBlock:(void(^)(id errOr))ErrBlock;
@end

