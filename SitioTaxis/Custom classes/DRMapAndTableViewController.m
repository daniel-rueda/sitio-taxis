//
//  DRMapAndTableViewController.m
//  SitioTaxis
//
//  Created by Cristhian Velazco Solano on 08/09/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRMapAndTableViewController.h"
#import "DRMapSitioPinAnnotation.h"
#import "DRSitioCell.h"
#import "DRAppDelegate.h"

@interface DRMapAndTableViewController ()
{
    NSArray *_sitios;
}
@end

@implementation DRMapAndTableViewController
@synthesize mapa;
@synthesize tableView = _tableView;
@synthesize coordinate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mapa setDelegate:self];
    [self.tableView setDelegate:self];
    [self.mapa setShowsUserLocation:YES];
    self.title = @"Sitio de Taxis";
    
    //[self.tableView setContentOffset:CGPointMake(0, self.mapa.frame.size.height)];
    _sitios = [NSArray arrayWithObjects:@"Sitio 01", @"Sitio 02", @"Sitio 03", @"Sitio 04", @"Sitio 05", @"Sitio 06", @"Sitio 07", @"Sitio 08", @"Sitio 09", @"Sitio 10", nil];
    [self.tableView reloadData];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setMapa:nil];
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sitios count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"sitioCell";
    DRSitioCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.nombreSitio.text = [_sitios objectAtIndex:indexPath.row];
    NSString *filename = [NSString stringWithFormat:@"%destrellas", indexPath.row % 6];
    cell.rating.image = [UIImage imageNamed:filename];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondo-tabla"]];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"¿Qué deseas realizar?" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Ver información", @"Llamar", nil];
    DRAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    UITabBarController *tabBarController = (UITabBarController *) delegate.window.rootViewController;
    [actionSheet showFromTabBar:tabBarController.tabBar];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Map view delegate
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    CLLocationCoordinate2D location=[userLocation coordinate];
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(location, 1000, 1000);
    //region.center = location;
    [self.mapa setRegion:region animated:YES];
}

-(MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    static NSString *AnnotationViewID = @"annotationViewID";
	
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapa dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
	
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
