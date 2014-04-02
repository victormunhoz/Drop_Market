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
    
}

-(void)viewDidAppear:(BOOL)animated{
    
   
    for (id d in _mainProductsDictionary) {
        NSLog(@"MAIN: %@",[d objectForKey:@"name"]);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)returnProductsDictionary:(NSDictionary *)productsDictionary{
    
    _mainProductsDictionary = [productsDictionary objectForKey:@"name"];
  
}

@end
