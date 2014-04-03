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
#import "Diagonal.h"
#import "CircleCustomGesture.h"

@interface tryViewController : UIViewController<tryTableViewControllerDelegate, UIDynamicItem>

@property NSMutableDictionary *mainProductsDictionary;
@property(nonatomic,strong) UIDynamicAnimator *animator;
@property(nonatomic,strong)UIGravityBehavior *gravity;
@property(nonatomic, strong)UICollisionBehavior *collision;

@property NSMutableArray *foodCardItems;

- (IBAction)removeFoosViews:(id)sender;

-(void)deleteView:(id*)sender;

@end
