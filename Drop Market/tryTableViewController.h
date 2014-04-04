//
//  tryTableViewController.h
//  Drop Market
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 26/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tryWalmart.h"
#import "tryCell.h"

@class tryTableViewController;
@protocol tryTableViewControllerDelegate <NSObject>

@required
-(void)returnProductsDictionary:(NSMutableDictionary*)productsDictionary;

@end

@interface tryTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>
{
    NSThread *background;
    id<tryTableViewControllerDelegate>delegate;
}
-(void)buscaBackground: (NSDictionary *)dict;


@property tryWalmart *walmart;
@property(retain)id delegate;

@end
