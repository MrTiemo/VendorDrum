//
//  ShoppingTableViewCell.m
//  TDS
//
//  Created by 黎金 on 16/3/24.
//  Copyright © 2016年 sixgui. All rights reserved.
//

#import "ShoppingTableViewCell.h"
#import "Util.h"
#import "Header.h"
#import "AddNumView.h"
#import "EditCartView.h"


@interface ShoppingTableViewCell ()<AddNumViewDelegate,EditCartViewDelegate>

@end
@implementation ShoppingTableViewCell
{

    NSIndexPath *indexPath;
    
    //图片
    UIImageView *headImageView;
    
    //标题
    UILabel *titleLabel;
    
    //价格
    UILabel *priceLabel;
    
    //颜色&尺码
//    UILabel *styleLabel;
    
    EditCartView *editcartView;
    
    AddNumView *addnumView;
    
    //确定
    ShoppingBtn *okBtn;
    
    UILabel *mustLabel;
    
    BOOL isbool;
    
}
- (void)awakeFromNib {
    
}



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        //勾选按钮
        okBtn = [[ShoppingBtn alloc] initWithFrame:CGRectMake(0, 0, 55, 100)];
        [okBtn addTarget:self action:@selector(OKBtn:) forControlEvents:UIControlEventTouchDown];
        
        
        //图片
        headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(55, 15, 70, 70)];
        headImageView.backgroundColor = [UIColor whiteColor];

        mustLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 67, 70, 18)];
        mustLabel.textColor = [UIColor whiteColor];
        mustLabel.text = @"必选单品";
        mustLabel.backgroundColor = UIColorRGBA(239, 34, 109, 0.6);
        mustLabel.textAlignment = NSTextAlignmentCenter;
        mustLabel.font = [UIFont systemFontOfSize:12.0];
        mustLabel.hidden = YES;
        
   
        //标题
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake([Util ReturnViewFrame:headImageView Direction:@"X"] +10, 15, SCREEN_WIDTH - ([Util ReturnViewFrame:headImageView Direction:@"X"] +91), 32)];
        titleLabel.textColor = TextColor;
        titleLabel.font = labelFontStyle;
        titleLabel.numberOfLines = 0;
        [titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        
//        //颜色 尺码
//        styleLabel = [[UILabel alloc] initWithFrame:CGRectMake([Util ReturnViewFrame:headImageView Direction:@"X"] +10, [Util ReturnViewFrame:titleLabel Direction:@"Y"], SCREEN_WIDTH-[Util ReturnViewFrame:headImageView Direction:@"X"] - 20, 18)];
//        styleLabel.textColor = [UIColor grayColor];
//        styleLabel.font = [UIFont systemFontOfSize:12.0];
        
        //价格
        priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 80, 15, 70, 18)];
        priceLabel.textColor = [UIColor redColor];
        priceLabel.textAlignment = NSTextAlignmentRight;
        priceLabel.font = labelFontStyle;
        
    
        addnumView = [[AddNumView alloc] initWithFrame:CGRectMake([Util ReturnViewFrame:headImageView Direction:@"X"] +10, [Util ReturnViewFrame:headImageView Direction:@"Y"] - 30, 100, 30)];
        addnumView.delegate = self;
       [self addSubview:addnumView];

        [self addSubview:okBtn];
        [self addSubview:headImageView];
        [self addSubview:mustLabel];
        [self addSubview:titleLabel];
//        [self addSubview:styleLabel];
        [self addSubview:priceLabel];
        
        
        
        editcartView = [[EditCartView alloc ] initWithFrame:CGRectMake([Util ReturnViewFrame:headImageView Direction:@"X"] +10, 15, SCREEN_WIDTH - ([Util ReturnViewFrame:headImageView Direction:@"X"] +20) , 70)];
        editcartView.delegate = self;
        editcartView.backgroundColor = [UIColor orangeColor];
        [Util makeCorner:2 view:editcartView];
        [Util makeCorner:0.5 view:editcartView color:GrayLine];
        [self addSubview:editcartView];
        editcartView.hidden = YES;
        

        
    }
    
    return  self;
}


-(void)setModel:(ShoppingCellModel *)model{

    _model = model;
    
    indexPath = [NSIndexPath indexPathForRow:model.row inSection:model.section];
    
    headImageView.image = [UIImage imageNamed:_model.imageUrl];
    titleLabel.text = model.title;
//    styleLabel.text = [NSString stringWithFormat:@"颜色: %@   尺码: %@",model.color,model.size];
    priceLabel.text = [NSString stringWithFormat:@"￥%@",model.price];
    mustLabel.hidden = model.mustInteger == 0?YES:NO;
    addnumView.numInteger = model.numInt;
    editcartView.numInteger = model.numInt;
//    editcartView.styleString = styleLabel.text;
    
    if (model.cellClickState == 1) {

        isbool = YES;
        [okBtn setImage:[UIImage imageNamed:@"iconfont-zhengque"] forState:UIControlStateNormal];

    } else {

        isbool = NO;
        [okBtn setImage:[UIImage imageNamed:@"iconfont-yuanquan"] forState:UIControlStateNormal];
    }
    
    if (model.cellEditState ==1) {
        
        editcartView.hidden = NO;
        
    }else{
    
        editcartView.hidden = YES;

    }

}

-(void)EditCartView:(NSInteger)num{

    _model.numInt = num;
    [_delegate ShoppingTableViewCell:_model];
}

-(void)EditCartView{

}

-(void)AddNumView:(NSInteger)num{
    
    _model.numInt = num;
    [_delegate ShoppingTableViewCell:_model];
}

-(void)OKBtn:(UIButton *)sendel{
    
        if (isbool) {
    
            _model.cellClickState = 0;
            [_delegate ShoppingTableViewCell:_model];
            [okBtn setImage:[UIImage imageNamed:@"iconfont-yuanquan"] forState:UIControlStateNormal];
            isbool = NO;
    
        }else{
    
            _model.cellClickState = 1;
            [_delegate ShoppingTableViewCell:_model ];
            [okBtn setImage:[UIImage imageNamed:@"iconfont-zhengque"] forState:UIControlStateNormal];
            isbool = YES;
        }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    
}

@end
