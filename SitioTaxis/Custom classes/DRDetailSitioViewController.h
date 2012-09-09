//
//  DRDetailSitioViewController.h
//  SitioTaxis
//
//  Created by Cristhian Velazco Solano on 08/09/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sitio.h"

@interface DRDetailSitioViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) Sitio* sitio;
@end
