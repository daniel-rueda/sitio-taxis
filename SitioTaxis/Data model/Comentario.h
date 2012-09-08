//
//  Comentario.h
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sitio;

@interface Comentario : NSManagedObject

@property (nonatomic, retain) NSString * usuario;
@property (nonatomic, retain) NSString * comentario;
@property (nonatomic, retain) NSDate * fecha;
@property (nonatomic, retain) id avatar;
@property (nonatomic, retain) NSString * origen;
@property (nonatomic, retain) Sitio *sitio;

@end
