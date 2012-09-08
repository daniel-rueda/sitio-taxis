//
//  Sitio.h
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Sitio : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSNumber * calificacion;
@property (nonatomic, retain) NSSet *comentarios;
@property (nonatomic, retain) NSManagedObject *ubicacion;
@property (nonatomic, retain) NSManagedObject *telefono;
@end

@interface Sitio (CoreDataGeneratedAccessors)

- (void)addComentariosObject:(NSManagedObject *)value;
- (void)removeComentariosObject:(NSManagedObject *)value;
- (void)addComentarios:(NSSet *)values;
- (void)removeComentarios:(NSSet *)values;

@end
