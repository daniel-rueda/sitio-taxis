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
#import "DRDatamodel.h"
#import "Sitio.h"
#import "Ubicacion.h"
#import "Telefono.h"

@interface DRMapAndTableViewController ()
@property(strong, nonatomic)NSMutableArray* arrCoords;
@property(strong, nonatomic) NSArray *_sitios;
@property(strong, nonatomic)CLLocation* currentLoc;
-(void)loadAllCorrdinate;
@end

@implementation DRMapAndTableViewController
@synthesize mapa;
@synthesize tableView;
@synthesize coordinate;
@synthesize arrCoords;
@synthesize _sitios;
@synthesize currentLoc;

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
    [self loadAllCorrdinate];
    
    
    
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
    //return [_sitios count];
    id <NSFetchedResultsSectionInfo> sectionInfo = [[[self fetchedResultsControllerSitios] sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"sitioCell";
    Sitio *sitio = [[self fetchedResultsControllerSitios] objectAtIndexPath:indexPath];
    
    
    DRSitioCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    /*cell.nombreSitio.text = [_sitios objectAtIndex:indexPath.row];
    NSString *filename = [NSString stringWithFormat:@"%destrellas", indexPath.row % 6];
    cell.rating.image = [UIImage imageNamed:filename];*/
    
    
    CLLocationDistance distance;
    
    NSString* ubicacion=sitio.ubicacion.geoposicion;
    NSArray *ubi=[ubicacion componentsSeparatedByString:@","];
    CLLocationDegrees lat=[(NSString*)[ubi objectAtIndex:0] floatValue];
    CLLocationDegrees lon=[(NSString*)[ubi objectAtIndex:1] floatValue];
    //NSString* subtitle=[NSString stringWithFormat:@"calle %@",sitio.ubicacion.calle];
    CLLocation* coords=[[CLLocation alloc]  initWithLatitude:lat longitude:lon];
    
    distance=[self.currentLoc distanceFromLocation:coords];
    
    
   
    NSString *strDistancia=[[NSString alloc] initWithFormat:@"A %5.0f mts:",distance ];
    
    
    NSLog(@"Distancia...:%@", strDistancia);
    
    cell.nombreSitio.text=sitio.nombre;
    NSString *strTel=[NSString stringWithFormat:@" %@",sitio.telefono.numero];
    [cell.telefonoSitio setTitle:strTel forState:UIControlStateNormal];
    NSString *strNameRating=[NSString stringWithFormat:@"%destrellas",rand()%6];
    cell.distanciaSitio.text=strDistancia;
    
    
    

    cell.rating.image=[UIImage imageNamed:strNameRating];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fondo-tabla"]];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Map view delegate
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    CLLocationCoordinate2D location=[userLocation coordinate];
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(location, 3000, 3000);
    //region.center = location;
    self.currentLoc=[[CLLocation alloc] initWithLatitude:location.latitude longitude:location.longitude];
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
        UIImage* imgPin=[UIImage imageNamed:@"pin.png"];
		annotationView.image = imgPin;//[UIImage imageNamed:@"pin.png"];
    
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

//Fecth para obtener los sitios de la tabla

-(NSFetchedResultsController*)fetchedResultsControllerSitios
{
   return  [[DRDataModel sharedModel] sitios];
}

//Obtner las coordendas de todos los objetos en la BD para pintar en el mapa
-(void)loadAllCorrdinate
{
    NSArray* arrSitios=[Sitio allObjects];
    self.arrCoords=[[NSMutableArray alloc] initWithCapacity:0];
    for (Sitio *sitio in arrSitios) {
        NSString* ubicacion=sitio.ubicacion.geoposicion;
        NSArray *ubi=[ubicacion componentsSeparatedByString:@","];
        CLLocationDegrees lat=[(NSString*)[ubi objectAtIndex:0] floatValue];
        CLLocationDegrees lon=[(NSString*)[ubi objectAtIndex:1] floatValue];
        NSString* subtitle=[NSString stringWithFormat:@"calle %@",sitio.ubicacion.calle];
        CLLocation* coords=[[CLLocation alloc]  initWithLatitude:lat longitude:lon];
        DRMapSitioPinAnnotation *pin=[[DRMapSitioPinAnnotation alloc] initWithCoordinate:coords.coordinate title:sitio.nombre subtitle:subtitle];
        
        [self.arrCoords addObject:pin];
    }
    [self.mapa addAnnotations:arrCoords];
}

@end
