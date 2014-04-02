//
//  tryViewController.h
//  Drop Market
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 26/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tryTableViewController.h"

@interface tryViewController : UIViewController<tryTableViewControllerDelegate>

@property NSDictionary *mainProductsDictionary;

@end
