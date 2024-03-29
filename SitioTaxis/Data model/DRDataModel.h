//
//  DRDataModel.h
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <RestKit/RestKit.h>
#import <RestKit/CoreData.h>

#import "Sitio.h"

@interface DRDataModel : NSObject

@property (nonatomic, strong) RKObjectManager *manager;

+ (DRDataModel *)sharedModel;

- (BOOL)saveChanges;

- (NSFetchedResultsController *)sitios;
- (NSFetchedResultsController *)sitiosConCodigoPostal:(NSString *)codigoPostal;
- (NSFetchedResultsController *)sitiosConColonia:(NSString *)colonia;
- (NSFetchedResultsController *)sitiosConDelegacion:(NSString *)delegacion;
- (NSFetchedResultsController *)sitiosCercanosUbicacion:(CLLocation *)location
                                        distanciaMaxima:(NSNumber *)distancia;

@end
