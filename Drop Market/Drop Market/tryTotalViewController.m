//
//  tryTotalViewController.m
//  Drop Market
//
//  Created by Lucas Teixeira on 4/4/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import "tryTotalViewController.h"

@interface tryTotalViewController ()

@end

@implementation tryTotalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	_prices = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 150, 20)];
    _names = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 150, 20)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
