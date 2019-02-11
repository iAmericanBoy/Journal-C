//
//  DLEntryListTableViewController.m
//  Journal-C
//
//  Created by Dominic Lanzillotta on 2/11/19.
//  Copyright © 2019 Dominic Lanzillotta. All rights reserved.
//

#import "DLEntryListTableViewController.h"
#import "DLEntryController.h"
#import "DLEntry.h"
#import "DLEntryDetailViewController.h"

@interface DLEntryListTableViewController ()

@end

@implementation DLEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[DLEntryController sharedInstance] entries] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[[DLEntryController sharedInstance] entries][[indexPath row] ] title];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DLEntry *entry = [[[DLEntryController sharedInstance] entries] objectAtIndex:indexPath.row];
        [[DLEntryController sharedInstance] removeEntry:(entry)];
    }
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"toDetailVC"]) {
        DLEntryDetailViewController *detailVC = segue.destinationViewController;
        NSIndexPath *index  = [self.tableView indexPathForSelectedRow];
        DLEntry *entryToSent = [[DLEntryController sharedInstance]entries][index.row];
        
        detailVC.entry  = entryToSent;
    }
    
}


@end
