//
//  DRSitiosDelegacionTableViewController.m
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRSitiosDelegacionTableViewController.h"
#import "DRSitioCell.h"
#import "DRAppDelegate.h"

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
    
    self.searchDisplayController.searchResultsTableView.backgroundColor = [UIColor colorWithRed:209.0f/255 green:175.0/255 blue:78.0/255 alpha:1];
    self.searchDisplayController.searchResultsTableView.separatorColor = [UIColor colorWithRed:134.0f/255 green:21.0/255 blue:37.0/255 alpha:1];
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
    }else {
        cell.backgroundColor = [UIColor colorWithRed:209.0f/255 green:175.0/255 blue:78.0/255 alpha:1];
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
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"¿Qué deseas realizar?" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Ver información", @"Llamar", nil];
    DRAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    UITabBarController *tabBarController = (UITabBarController *) delegate.window.rootViewController;
    [actionSheet showFromTabBar:tabBarController.tabBar];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *text = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([text isEqualToString:@"Ver información"]) {
        [self performSegueWithIdentifier:@"pushSitioDetail" sender:[_sitios objectAtIndex:buttonIndex]];
    }else if ([text isEqualToString:@"Llamar"]){
        NSString *tel = @"9575771";
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", tel]];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}

@end
