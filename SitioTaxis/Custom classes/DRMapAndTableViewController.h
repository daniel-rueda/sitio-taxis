//
//  DRMapAndTableViewController.h
//  SitioTaxis
//
//  Created by Cristhian Velazco Solano on 08/09/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DRMapAndTableViewController : UIViewController <MKMapViewDelegate,MKAnnotation,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet MKMapView *mapa;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
