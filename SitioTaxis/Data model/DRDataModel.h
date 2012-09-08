//
//  DRDataModel.h
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface DRDataModel : NSObject

+ (DRDataModel *)sharedModel;

- (void)sitios;
- (void)sitiosConCodigoPostal:(NSString *)codigoPostal;
- (void)sitiosConColonia:(NSString *)colonia;
- (void)sitiosCercanosUbicacion:(CLLocation *)location;

@end
