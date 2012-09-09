//
//  Sitio.h
//  RestKit
//
//  Created by Claudia Patricia Orta on 9/9/12.
//  Copyright (c) 2012 RestKit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comentario, Telefono, Ubicacion;

@interface Sitio : NSManagedObject

@property (nonatomic, retain) NSString * calificacion;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * representante;
@property (nonatomic, retain) NSSet *comentarios;
@property (nonatomic, retain) Telefono *telefono;
@property (nonatomic, retain) Ubicacion *ubicacion;
@end

@interface Sitio (CoreDataGeneratedAccessors)

- (void)addComentariosObject:(Comentario *)value;
- (void)removeComentariosObject:(Comentario *)value;
- (void)addComentarios:(NSSet *)values;
- (void)removeComentarios:(NSSet *)values;
@end
