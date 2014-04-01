//
//  tryTableViewController.h
//  Drop Market
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 26/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tryWalmart.h"

@interface tryTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>
{
    NSThread *background;
}
-(void)buscaBackground: (NSDictionary *)dict;

@property tryWalmart *walmart;

@end
