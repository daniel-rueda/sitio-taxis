//
//  DRTableViewMapControllerViewController.m
//  SitioTaxis
//
//  Created by Cristhian Velazco Solano on 08/09/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRTableViewMapControllerViewController.h"
#import "DRMapSitioPinAnnotation.h"
#import "DRSitioCell.h"

@interface DRTableViewMapControllerViewController ()
{
    NSArray *_sitios;
}
@end

@implementation DRTableViewMapControllerViewController
@synthesize halfMap;
@synthesize coordinate;

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
    self.title = @"Sitios";
    
    [self.tableView setContentOffset:CGPointMake(0, self.halfMap.frame.size.height)];
    _sitios = [NSArray arrayWithObjects:@"Sitio 01", @"Sitio 02", @"Sitio 03", @"Sitio 04", @"Sitio 05", @"Sitio 06", @"Sitio 07", @"Sitio 08", @"Sitio 09", @"Sitio 10", nil];
    
    //Ubicacion *pruebaDeUbicacion;
    CLLocationCoordinate2D theCoordinate1;
    theCoordinate1.latitude = 19.402064;
    theCoordinate1.longitude = -99.166106;
    [halfMap setDelegate:self];
    DRMapSitioPinAnnotation *myAnnotationTest=[[DRMapSitioPinAnnotation alloc] initWithCoordinate:theCoordinate1 title:@"Prueba Titulo" subtitle:@"prueba Subtitulo"];
    
    [halfMap addAnnotation:myAnnotationTest];
    
    [self.halfMap setShowsUserLocation:YES];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setHalfMap:nil];
    [self setHalfMap:nil];
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
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_sitios count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"sitioCell";
    DRSitioCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.nombreSitio.text = [_sitios objectAtIndex:indexPath.row];
    NSString *filename = [NSString stringWithFormat:@"%destrellas", indexPath.row % 6];
    cell.rating.image = [UIImage imageNamed:filename];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondo-tabla"]];
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




#pragma mark - Map view delegate
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    CLLocationCoordinate2D location=[userLocation coordinate];
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(location, 1000, 1000);
    //region.center = location;
    [self.halfMap setRegion:region animated:YES];
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    static NSString *AnnotationViewID = @"annotationViewID";
	
    MKAnnotationView *annotationView = (MKAnnotationView *)[halfMap dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
	
    if (annotationView == nil)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
	
	
	if ([annotation isKindOfClass:[DRMapSitioPinAnnotation class]]) {
		annotationView.image = [UIImage imageNamed:@"pin.png"];
		annotationView.annotation = annotation;
		annotationView.canShowCallout = YES;
		UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		annotationView.rightCalloutAccessoryView = rightButton;
		return annotationView;
	}
	else{
	    return nil;
	}
}

@end
