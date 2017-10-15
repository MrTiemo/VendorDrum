//
//  ShoppingModel.m
//  TDS
//
//  Created by 黎金 on 16/3/24.
//  Copyright © 2016年 sixgui. All rights reserved.
//

#import "ShoppingModel.h"


@implementation ShoppingModel

@synthesize headClickState;

@synthesize headPriceDict;

-(instancetype)initWithShopDict:(NSDictionary *)dict{
    
    self.headID = dict[@"headID"];
    
    self.headState = [dict[@"headState"] integerValue];
    
    self.discount  = dict[@"discount"];
    
    self.headCellArray = [NSMutableArray arrayWithArray:[self ReturnData:dict[@"headCellArray"]]];
    
    self.headClickState = 0;
    
    self.headPriceDict = [[NSDictionary alloc] init];
    self.headPriceDict = @{
                           @"headTitle":[NSString stringWithFormat:@"%@",self.discount],
                           @"footerTitle":@"小计:¥0.00",
                           @"footerMinus":@""
                           };
    
    return self ;
}

-(NSArray *)ReturnData:(NSArray *)array{
    
    NSMutableArray *arrays= [[NSMutableArray alloc] init];
    for (NSDictionary *dict in array) {
        
        ShoppingCellModel *model = [[ShoppingCellModel alloc] initWithShopDict:dict];
        [arrays addObject:model];

    }

    return arrays;
}


@end

@implementation ShoppingCellModel

@synthesize row;
@synthesize section;
@synthesize indexState;
@synthesize cellClickState;
@synthesize cellPriceDict;
@synthesize cellEditState;
-(instancetype)initWithShopDict:(NSDictionary *)dict{
    
    self.ID = dict[@"ID"];
    self.imageUrl = dict[@"imageUrl"];
    self.title = dict[@"title"];
    self.color = dict[@"color"];
    self.size = dict[@"size"];
    self.price =dict[@"price"];
    self.mustInteger = [dict[@"mustInteger"] integerValue];
    self.numInt = [dict[@"numInt"] integerValue];
    self.inventoryInt = [dict[@"inventoryInt"] integerValue];
    self.discountNum = dict[@"discountNum"];
    self.row = 0;
    self.section = 0;
    self.indexState = 0;
    self.cellClickState = 0;
    self.cellEditState = 0;
    self.cellPriceDict = [[NSDictionary alloc] init];
    return self ;
}

@end