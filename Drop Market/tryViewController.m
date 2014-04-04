//
//  tryViewController.m
//  Drop Market
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 26/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import "tryViewController.h"
#import "tryTotalViewController.h"

@interface tryViewController ()

@property UIView *secondSon;

@end

@implementation tryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    _gravity = [[UIGravityBehavior alloc]init];
    _collision = [[UICollisionBehavior alloc]init];
    _foodCardItems = [[NSMutableArray alloc]init];
    
    Diagonal *diagonalGesture = [[Diagonal alloc]initWithTarget:self action:@selector(deleteView:)];
    [[self view]addGestureRecognizer:diagonalGesture];
    [self.view addGestureRecognizer:[[CircleCustomGesture alloc]initWithTarget:self action:@selector(goToSeconVC)]];
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
        [self totalPriceMethod];
        
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

-(void) goToSeconVC
{
    [self getName];
    _secondSon = [[UIView alloc]initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] applicationFrame].size.width,
                                                           [[UIScreen mainScreen] applicationFrame].size.height)];
    [_secondSon setBackgroundColor:[UIColor lightGrayColor]];
    
    UILabel *price = [[UILabel alloc]initWithFrame:CGRectMake(50, 350, 150, 30)];
    
    price.text = [NSString stringWithFormat:@"Price: %.2f", [self totalPriceMethod]];
    
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(50, 30, 200, 300)];
    name.numberOfLines = 0;
    
    name.text = _received;
    
    [_secondSon addGestureRecognizer:[[CircleCustomGesture alloc]initWithTarget:self action:@selector(goToFirstVC)]];
    [_secondSon addSubview:price];
    [_secondSon addSubview:name];
    
    [UIView transitionFromView:self.view toView:_secondSon duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
    
    
    
}

-(void) goToFirstVC{
    [UIView transitionFromView:_secondSon toView:self.view duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight completion:nil];
    
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
        
        
        
    }
}

-(void)getName{
    if (!_foodCardItems) {
        return;
    }
    NSMutableArray *pass = [[NSMutableArray alloc]init];
    for (FoodCard *d in _foodCardItems) {
        [pass addObject: d.nameLabel.text];
    }
    
    _received = [[NSString alloc]init];
    _received = [pass componentsJoinedByString:@"\n"];
}

-(double)totalPriceMethod{
    if (!_foodCardItems) {
        return 0;
    }
    else{
        _totalPrice = 0;
        for (FoodCard* d in _foodCardItems) {
            double i = [d.priceLabel.text doubleValue];
            _totalPrice += i;
        }
        
        
    }
    return _totalPrice;
}


@end
