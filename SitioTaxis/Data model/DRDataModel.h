//
//  DRDataModel.h
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreData/CoreData.h>

@interface DRDataModel : NSObject

+ (DRDataModel *)sharedModel;

- (NSFetchedResultsController *)sitios;
- (NSFetchedResultsController *)sitiosConCodigoPostal:(NSString *)codigoPostal;
- (NSFetchedResultsController *)sitiosConColonia:(NSString *)colonia;
- (NSFetchedResultsController *)sitiosCercanosUbicacion:(CLLocation *)location
                                        distanciaMaxima:(NSNumber *)distancia;

@end
