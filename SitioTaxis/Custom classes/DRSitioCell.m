//
//  DRSitioCell.m
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRSitioCell.h"
#import "Telefono.h"

@implementation DRSitioCell
@synthesize sitio = _sitio;
@synthesize nombreSitio = _nombreSitio;
@synthesize distanciaSitio = _distanciaSitio;
@synthesize telefonoSitio = _telefonoSitio;
@synthesize rating = _rating;

- (void)updateSitioInfo
{
    _nombreSitio.text = _sitio.nombre;
    [_telefonoSitio setTitle:_sitio.telefono.numero forState:UIControlStateNormal];
}

- (id)initWithSitio:(Sitio *)sitio reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        _sitio = sitio;
        [self updateSitioInfo];
    }
    return self;
}

- (IBAction)telefonoSeleccionado:(id)sender
{
    NSString *tel = [_telefonoSitio.titleLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", tel]];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
