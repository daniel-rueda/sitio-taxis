//
//  Ubicacion.h
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sitio;

@interface Ubicacion : NSManagedObject

@property (nonatomic, retain) NSString * calle;
@property (nonatomic, retain) NSString * colonia;
@property (nonatomic, retain) NSString * delegacion;
@property (nonatomic, retain) NSString * codigoPostal;
@property (nonatomic, retain) NSString * geoposicion;
@property (nonatomic, retain) Sitio *sitio;

@end
