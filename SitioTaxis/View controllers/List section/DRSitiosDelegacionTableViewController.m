//
//  DRSitiosDelegacionTableViewController.m
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRSitiosDelegacionTableViewController.h"
#import "DRSitioCell.h"

@interface DRSitiosDelegacionTableViewController ()
{
    NSArray *_sitios;
}
@end

@implementation DRSitiosDelegacionTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Sitios";
    
    CGRect newBounds = self.tableView.bounds;
    newBounds.origin.y = newBounds.origin.y + self.searchDisplayController.searchBar.bounds.size.height;
    self.tableView.bounds = newBounds;
    
    _sitios = [NSArray arrayWithObjects:@"Sitio 01", @"Sitio 02", @"Sitio 03", @"Sitio 04", @"Sitio 05", @"Sitio 06", @"Sitio 07", @"Sitio 08", @"Sitio 09", @"Sitio 10", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sitios count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView) {
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondo-tabla"]];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableView) {
        static NSString *CellIdentifier = @"sitioCell";
        DRSitioCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        cell.nombreSitio.text = [_sitios objectAtIndex:indexPath.row];
        NSString *filename = [NSString stringWithFormat:@"%destrellas", indexPath.row % 6];
        cell.rating.image = [UIImage imageNamed:filename];
        
        return cell;
    }
    
    static NSString *cellID = @"genericCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [_sitios objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UISearchDisplayDelegate

#pragma mark - UISearchDisplayController Delegate Methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    return YES;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption {
    return YES;
}

@end
