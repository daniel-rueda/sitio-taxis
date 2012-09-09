//
//  DRDetailSitioViewController.m
//  SitioTaxis
//
//  Created by Cristhian Velazco Solano on 08/09/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRDetailSitioViewController.h"

@interface DRDetailSitioViewController ()

@end

@implementation DRDetailSitioViewController
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setDelegate:self];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 6;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row!=1) {
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondo-tabla"]];
    }else {
        cell.backgroundView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"5estrellas"]];
    }
        

        //cell.backgroundColor = [UIColor colorWithRed:209.0f/255 green:175.0/255 blue:78.0/255 alpha:1];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString* icono=nil;
    NSString* titulo=nil;
    switch (indexPath.row) {
        case 0:
            titulo=@"Sitio B302";
            cell.textLabel.font=[UIFont boldSystemFontOfSize:24.0f];
            cell.textLabel.textAlignment=UITextAlignmentCenter;
            break;
        case 2:
            icono=@"comentario.png";
            titulo=@"16 Comentarios";
            cell.textLabel.font=[UIFont boldSystemFontOfSize:16.0f];
            break;
        case 3:
            icono=@"direccion.png";
            titulo=@"Leandro Valle 20, Colonia Centro, Del: Cuauhtemoc";
            cell.textLabel.font=[UIFont boldSystemFontOfSize:16.0f];
            cell.textLabel.numberOfLines=2;
            break;
        case 4:
            icono=@"telefono.png";
            titulo=@"56569323";
            cell.textLabel.font=[UIFont boldSystemFontOfSize:20.0f];
            break;
        case 5:
            icono=@"representante.png";
            titulo=@"Representante: Pedro Fernandez";
            cell.textLabel.font=[UIFont boldSystemFontOfSize:16.0f];
            cell.textLabel.numberOfLines=2;
            break;
        default:
            break;
    }
    
    if (titulo!=nil) {
        cell.textLabel.textColor=[UIColor whiteColor];
        cell.textLabel.text=titulo;
    }else {
        cell.textLabel.text=nil;
    }
    
    if (icono!=nil) {
        cell.imageView.image=[UIImage imageNamed:icono];
    }else {
        cell.imageView.image=nil;
    }
    
    
    
    // Configure the cell...
    
    return cell;
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row==4) {
        NSString *telefono=[[[self.tableView cellForRowAtIndexPath:indexPath] textLabel]text];
        NSString *URLtel=[NSString stringWithFormat:@"tel://%@",telefono];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:URLtel]];
    }
}

@end
