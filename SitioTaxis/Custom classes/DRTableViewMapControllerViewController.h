//
//  DRTableViewMapControllerViewController.h
//  SitioTaxis
//
//  Created by Cristhian Velazco Solano on 08/09/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DRTableViewMapControllerViewController : UITableViewController <MKMapViewDelegate,MKAnnotation>

@property (strong, nonatomic) IBOutlet MKMapView *halfMap;

@end
