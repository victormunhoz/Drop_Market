//
//  FoodCard.h
//  table_teste2
//
//  Created by Victor Munhoz Theodoro on 22/03/14.
//  Copyright (c) 2014 VICTOR MUNHOZ THEODORO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodCard : UIView <UIDynamicItem, UIDynamicAnimatorDelegate>

@property UILabel *nameLabel;
@property UILabel *priceLabel;
@property UIImageView *productImage;


@end
