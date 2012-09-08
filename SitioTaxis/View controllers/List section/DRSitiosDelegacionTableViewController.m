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
    
    [self.tableView setContentOffset:CGPointMake(0, self.searchDisplayController.searchBar.frame.size.height)];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"sitioCell";
    DRSitioCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.nombreSitio.text = [_sitios objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
