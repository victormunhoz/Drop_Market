//
//  tryViewController.m
//  Drop Market
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 26/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import "tryViewController.h"

@interface tryViewController ()

@end

@implementation tryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    _gravity = [[UIGravityBehavior alloc]init];
    _collision = [[UICollisionBehavior alloc]init];
    _foodCardItems = [[NSMutableArray alloc]init];
    
    Diagonal *diagonalGesture = [[Diagonal alloc]initWithTarget:self action:@selector(deleteView:)];
    [[self view]addGestureRecognizer:diagonalGesture];
}

-(void)viewDidAppear:(BOOL)animated{
    
    
    if (_mainProductsDictionary != nil) {
        
        FoodCard *foodCard = [[FoodCard alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
        [[foodCard nameLabel]setText:[_mainProductsDictionary objectForKey:@"name"]];
        [[foodCard priceLabel]setText:[NSString stringWithFormat:@"%@US$",[_mainProductsDictionary objectForKey:@"salePrice"]]];
        NSString *imageUrl = [_mainProductsDictionary objectForKey:@"thumbnailImage"];
        NSData *data = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:imageUrl]];;
        [[foodCard productImage]setImage:[UIImage imageWithData:data]];
        
        
        [[self view]addSubview:foodCard];
        [[self gravity]addItem:foodCard];
        [[self collision]addItem:foodCard];
        [[self animator]addBehavior:[self gravity]];
        [[self animator]addBehavior:[self collision]];
        [[self collision]setTranslatesReferenceBoundsIntoBoundary:YES];
        
        [[self foodCardItems]addObject:foodCard];
        
        
    }
    else{
        NSLog(@"main dictionary vazio");
        return;
    }
    
    
    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [_mainProductsDictionary removeAllObjects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)returnProductsDictionary:(NSMutableDictionary *)productsDictionary{
    
    _mainProductsDictionary = productsDictionary;
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"tableView"]) {
        tryTableViewController *tbvc = segue.destinationViewController;
        [tbvc setDelegate:self];
    }
}

-(void)deleteView:(id*)sender{
    if (!_foodCardItems) {
        return;
    }
    else{
        
        for (UIView *d in _foodCardItems) {
            [[self animator]removeAllBehaviors];
            [[self gravity]removeItem:d];
            [[self collision]removeItem:d];
            [d removeFromSuperview];
            
            
            
        }
        [_foodCardItems removeAllObjects];
        //[_pickedFoods removeAllObjects];
        
        
        
    }
}


@end
