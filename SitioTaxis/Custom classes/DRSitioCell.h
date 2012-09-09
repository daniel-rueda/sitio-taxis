//
//  DRSitioCell.h
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sitio.h"

@interface DRSitioCell : UITableViewCell<UIAlertViewDelegate>

@property (nonatomic, strong) Sitio *sitio;

@property (nonatomic, weak) IBOutlet UILabel *nombreSitio;
@property (nonatomic, weak) IBOutlet UILabel *distanciaSitio;
@property (nonatomic, weak) IBOutlet UIButton *telefonoSitio;
@property (nonatomic, weak) IBOutlet UIImageView *rating;

- (IBAction)telefonoSeleccionado:(id)sender;

@end
