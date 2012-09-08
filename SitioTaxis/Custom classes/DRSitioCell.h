//
//  DRSitioCell.h
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sitio.h"

@interface DRSitioCell : UITableViewCell

@property (nonatomic, strong) Sitio *sitio;

@property (nonatomic, weak) IBOutlet UILabel *nombreSitio;
@property (nonatomic, weak) IBOutlet UILabel *distanciaSitio;
@property (nonatomic, weak) IBOutlet UIButton *telefonoSitio;

- (IBAction)telefonoSeleccionado:(id)sender;

@end
