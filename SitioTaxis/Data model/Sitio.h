//
//  Sitio.h
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Ubicacion, Telefono;


@interface Sitio : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSNumber * calificacion;
@property (nonatomic, retain) NSSet *comentarios;
@property (nonatomic, retain) Ubicacion *ubicacion;
@property (nonatomic, retain) Telefono *telefono;
@end

@interface Sitio (CoreDataGeneratedAccessors)

- (void)addComentariosObject:(NSManagedObject *)value;
- (void)removeComentariosObject:(NSManagedObject *)value;
- (void)addComentarios:(NSSet *)values;
- (void)removeComentarios:(NSSet *)values;

@end
