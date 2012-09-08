//
//  DRMapSitioPinAnnotation.h
//  SitioTaxis
//
//  Created by Cristhian Velazco Solano on 08/09/12.
//  Copyright (c) 2012 Planet Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface DRMapSitioPinAnnotation : NSObject <MKAnnotation>
{
	
}
@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString *subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString*)t subtitle:(NSString*)st;

@end
