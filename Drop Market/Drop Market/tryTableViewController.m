//
//  tryTableViewController.m
//  Drop Market
//
//  Created by LUCAS TEIXEIRA DE OLIVEIRA on 26/03/14.
//  Copyright (c) 2014 LUCAS TEIXEIRA DE OLIVEIRA. All rights reserved.
//

#import "tryTableViewController.h"



@interface tryTableViewController ()
@property (strong, nonatomic) IBOutlet UISearchBar *bar;

@end

@implementation tryTableViewController

@synthesize delegate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.walmart = [[tryWalmart alloc]init];
    
    background = [[NSThread alloc]init];
    
    _bar.delegate = self;
    

}

-(void)viewWillDisappear:(BOOL)animated{
    
    [[self delegate]returnProductsDictionary:[_walmart itemSelected]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSLog(@"AQUI MANO------ %lu", (unsigned long)self.walmart.itemGeral.count);
    return self.walmart.itemGeral.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomTableCell";
    
    UITableViewCell *cell = (UITableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    NSMutableDictionary *F = [self.walmart.itemGeral objectAtIndex:indexPath.row];
    NSString *item = [F objectForKey:@"name"];
    NSString *imageUrl = [F objectForKey:@"thumbnailImage"];
    NSString *price = [F objectForKey:@"salePrice"];

    
    NSData *data = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:imageUrl]];;
    
    cell.imageView.image = [UIImage imageWithData:data];

    cell.textLabel.text = item;
    
    cell.detailTextLabel.text = price;
    
//    
//    cell.description.text =[NSString stringWithFormat:@"R$ %@", [item objectForKey:@"price"]];
    
    return cell;
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSDictionary *d = @{@"string": searchText, @"delegate":self };
    [self performSelectorInBackground:@selector(buscaBackground:) withObject:d];
    NSLog(@"tic");
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    NSDictionary *d = @{@"string" :searchString, @"delegate":self };

    
    [self performSelector:@selector(buscaBackground:) onThread:background withObject:d waitUntilDone:NO];
    
    
    return NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = [indexPath row];
    self.walmart.itemSelected = [self.walmart.itemGeral objectAtIndex:row];
    NSLog(@"TESTE POURRA: %@",[[_walmart itemSelected]objectForKey:@"name"]);
}

-(void) terminouDebaixarAsParadsDoWalmart{
    NSLog(@"reload");
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];
}

-(void)buscaBackground:(NSDictionary *)dict{
    
  
    //tryTableViewController *vc = [dict objectForKey:@"delegate"];
    NSString *busca = [dict objectForKey:@"string"];
    
    tryWalmart *W = [[tryWalmart alloc]init];
    
    [W walmartJson:busca];
    [W returnData:@"name"];
    [W returnData:@"price"];
    [W returnData:@"Image"];
    [self terminouDebaixarAsParadsDoWalmart];
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
