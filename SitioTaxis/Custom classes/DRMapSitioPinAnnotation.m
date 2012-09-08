//
//  DRMapSitioPinAnnotation.m
//  SitioTaxis
//
//  Created by Cristhian Velazco Solano on 08/09/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import "DRMapSitioPinAnnotation.h"

@implementation DRMapSitioPinAnnotation
@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString*)t subtitle:(NSString*)st{
    self=[super init];
    if (self) {
        coordinate=c;
        [self setTitle:t];
        [self setSubtitle:st];
    }
    return self;
}

@end
