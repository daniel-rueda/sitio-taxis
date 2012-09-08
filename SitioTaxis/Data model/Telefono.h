//
//  Telefono.h
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sitio;

@interface Telefono : NSManagedObject

@property (nonatomic, retain) NSString * numero;
@property (nonatomic, retain) Sitio *sitio;

@end
