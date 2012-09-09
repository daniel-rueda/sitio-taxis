//
//  DRLoadAddress.m
//  SitioTaxis
//
//  Created by Claudia Patricia Orta on 9/9/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRLoadAddress.h"
#import "DRDataModel.h"
#import "Sitio.h"
#import "Ubicacion.h"

@implementation DRLoadAddress
-(void)loadAddressFromPlist
{
    NSString *pListPath = [[NSBundle mainBundle] pathForResource:@"addressOut" ofType:@"plist"];
    NSLog(@"pListPath....:%@",pListPath);

    NSArray* arrayAddress = [[NSArray alloc] initWithContentsOfFile:pListPath];
    
    
    NSError *error = nil;
    NSInteger sitiosCount = [Sitio count:&error];
    
    if (!sitiosCount) {
        
        for (NSDictionary *dictAddres in arrayAddress) {
            Sitio* sitio=[Sitio createEntity];
            Ubicacion *ubicacion=[Ubicacion createEntity];
            ubicacion.calle=[dictAddres valueForKey:@"CALLE"];
            ubicacion.colonia=[dictAddres valueForKey:@"COLONIA"];
            ubicacion.delegacion=[dictAddres valueForKey:@"DELEGACIÓN"];
            ubicacion.codigoPostal=[dictAddres valueForKey:@"C.P."];
            ubicacion.geoposicion=[dictAddres valueForKey:@"UBICACION"];
        }

    }
        
        
}




@end
