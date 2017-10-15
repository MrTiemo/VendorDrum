//
//  LeftSelectScroll.h
//  YiLeHelp
//
//  Created by ChenYi on 15/11/14.
//  Copyright © 2015年 JC. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
@protocol LeftSelectScrollDataSource <NSObject>

- (NSInteger)numberOfRowsInSection;

- (UIButton*)viewForRowAtIndexPath:(NSInteger *)indexPath;

@end
*/
@protocol LeftSelectScrollDelegate <NSObject>

-(void)clickLeftSelectScrollButton:(NSInteger)indexPath;

@end

@interface LeftSelectScroll : UIScrollView

@property(nonatomic,strong)NSArray *leftSelectArray;

@property (nonatomic,strong)id<LeftSelectScrollDelegate>leftSelectDelegate;

//-(void)setLeftSelectArray:(NSArray *)leftSelectArray;


-(void)setSelectButtonWithIndexPathSection:(NSInteger)indexPathSection;

-(instancetype)backarr:(NSMutableArray *)arr;

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)




@end
