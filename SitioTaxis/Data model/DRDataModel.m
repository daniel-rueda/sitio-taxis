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

+ (id)alloc
{
    NSAssert(_sharedInstance != nil, @"Attemping allocate a second instance of a singleton");
    return [super alloc];
}

+ (DRDataModel *)sharedModel
{
    if (!_sharedInstance) {
        _sharedInstance = [[self alloc] init];
    }
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)sitios
{
    
}

- (void)sitiosConCodigoPostal:(NSString *)codigoPostal
{
    
}

- (void)sitiosConColonia:(NSString *)colonia
{
    
}

- (void)sitiosCercanosUbicacion:(CLLocation *)location
{
    
}

@end
