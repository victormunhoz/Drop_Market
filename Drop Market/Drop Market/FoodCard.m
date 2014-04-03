//
//  FoodCard.m
//  table_teste2
//
//  Created by Victor Munhoz Theodoro on 22/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import "FoodCard.h"

@implementation FoodCard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _nameLabel = [[UILabel alloc]init];
        [[self nameLabel]setFrame:CGRectMake(80, 20, 150, 50)];
        [[self nameLabel]setTextColor:[UIColor whiteColor]];
        [self addSubview:_nameLabel];
        
        _priceLabel = [[UILabel alloc]init];
        [[self priceLabel]setFrame:CGRectMake(300, 20, 100, 50)];
        [[self priceLabel]setTextColor:[UIColor whiteColor]];
        [self addSubview:_priceLabel];
        
        _productImage = [[UIImageView alloc]init];
        [[self productImage]setFrame:CGRectMake(5, 5, 70, 60)];
        [self addSubview:_productImage];
        
        self.backgroundColor = [UIColor blueColor];
               

        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
}


@end
