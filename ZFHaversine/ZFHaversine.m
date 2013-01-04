//
//  ZFHaversine
//
//  Copyright © 2012 Steve Foster <foster@flightblog.org>
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the “Software”),
//  to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is furnished
//  to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "ZFHaversine.h"
static const double EARTH_RADIUS_IN_KILOS = 6372.797560856;
static const double DEGRESS_TO_RADIANS = M_PI/180.0;

@implementation ZFHaversine
{
    NSNumber *_kilos;
}

-(id) initWithLatitude1:(double)latitude1
             longitude1:(double)longitude1
              latitude2:(double)latitude2
             longitude2:(double)longitude2
{
    self = [super init];
    if (self) {
        _latitude1 = latitude1;
        _longitude1 = longitude1;
        _latitude2 = latitude2;
        _longitude2 = longitude2;
    }
    return self;
}


- (double)haversineDistance
{
    double dlon = (_longitude2 - _longitude1) * DEGRESS_TO_RADIANS;
    double dlat = (_latitude2 - _latitude1) * DEGRESS_TO_RADIANS;
    
    double a =  pow(sin(dlat * 0.5), 2)+ cos(_latitude1 * DEGRESS_TO_RADIANS) * cos(_latitude2 * DEGRESS_TO_RADIANS) * pow(sin(dlon * 0.5),2);
    double c = 2.0 * atan2(sqrt(a), sqrt(1-a));
    double d = EARTH_RADIUS_IN_KILOS * c;
    
    return d = EARTH_RADIUS_IN_KILOS * c;
}

- (NSNumber *) kilos
{
    NSNumber *kilos = [[NSNumber alloc] initWithDouble:[self haversineDistance]];
    return kilos;
}

- (NSNumber *) meters
{
    NSNumber *meters = [[NSNumber alloc] initWithDouble:[self haversineDistance] * 1000];
    return meters;
}

- (NSNumber *) miles
{
    NSNumber *miles = [[NSNumber alloc] initWithDouble:[self haversineDistance] * 0.621371];
    return miles;
}

- (NSNumber *) nauticalMiles
{
    NSNumber *miles = [[NSNumber alloc] initWithDouble:[self haversineDistance] * 0.539957];
    return miles;
}

- (NSNumber *) feet
{
    NSNumber *feet = [[NSNumber alloc] initWithDouble:[self haversineDistance] * 3280.84];
    return feet;
}

@end