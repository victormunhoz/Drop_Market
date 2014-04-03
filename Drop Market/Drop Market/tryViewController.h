//
//  tryViewController.h
//  Drop Market
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 26/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tryTableViewController.h"
#import "FoodCard.h"

@interface tryViewController : UIViewController<tryTableViewControllerDelegate>

@property NSMutableDictionary *mainProductsDictionary;
@property(nonatomic,strong) UIDynamicAnimator *animator;
@property(nonatomic,strong)UIGravityBehavior *gravity;
@property(nonatomic, strong)UICollisionBehavior *collision;

@property int py;

@end
