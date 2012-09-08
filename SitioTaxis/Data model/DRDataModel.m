//
//  DRDataModel.m
//  SitioTaxis
//
//  Created by Daniel Rueda Jimenez on 9/8/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRDataModel.h"

@implementation DRDataModel

static DRDataModel *_sharedInstance = nil;

+ (DRDataModel *)sharedModel
{
    if (!_sharedInstance) {
        _sharedInstance = [[self alloc] init];
    }
    return _sharedInstance;
}

+ (id)alloc
{
    NSAssert(_sharedInstance == nil, @"Attemping allocate a second instance of a singleton");
    return [super alloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark - Fetching objects
#pragma mark Sitios
- (NSFetchedResultsController *)sitios
{
    return [Sitio fetchAllSortedBy:@"nombre" ascending:YES withPredicate:nil groupBy:nil];
}

- (NSFetchedResultsController *)sitiosConCodigoPostal:(NSString *)codigoPostal
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ubicacion.codigoPostal like %@", codigoPostal];
    return [Sitio fetchAllSortedBy:@"nombre" ascending:YES withPredicate:predicate groupBy:nil];
}

- (NSFetchedResultsController *)sitiosConColonia:(NSString *)colonia
{
    return nil;
}

- (NSFetchedResultsController *)sitiosConDelegacion:(NSString *)delegacion
{
    return nil;
}

- (NSFetchedResultsController *)sitiosCercanosUbicacion:(CLLocation *)location 
                                        distanciaMaxima:(NSNumber *)distancia
{
    return nil;
}

@end
