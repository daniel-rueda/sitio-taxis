//
//  DRDelegacionesTableViewController.m
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRDelegacionesTableViewController.h"

@interface DRDelegacionesTableViewController ()
{
    NSArray *_delegaciones;
}
@end

@implementation DRDelegacionesTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Delegaciones";
    _delegaciones = [NSArray arrayWithObjects:@"Delegacion 01", @"Delegacion 02", @"Delegacion 03", @"Delegacion 04", @"Delegacion 05", nil];
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
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Titulo";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_delegaciones count];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor colorWithRed:134.0f/255 green:21.0/255 blue:37.0/255 alpha:1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"delegacionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.textLabel.text = [_delegaciones objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 310, 25)];
    label.font = [UIFont boldSystemFontOfSize:18];
    label.text = @" TITULO";
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor colorWithRed:209.0f/255 green:175.0/255 blue:78.0/255 alpha:1];
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
