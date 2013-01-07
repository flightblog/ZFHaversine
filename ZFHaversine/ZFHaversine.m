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

- (id) init
{
    self = [super init];
    
    _latitude1 = 0;
    _longitude1 = 0;
    _latitude2 = 0;
    _longitude2 = 0;
    
    return self;
}

- (id) initWithLatitude1:(CGFloat)latitude1
              longitude1:(CGFloat)longitude1
               latitude2:(CGFloat)latitude2
              longitude2:(CGFloat)longitude2
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

- (CGFloat) haversineDistance
{
    CGFloat dlon = (_longitude2 - _longitude1) * DEGRESS_TO_RADIANS;
    CGFloat dlat = (_latitude2 - _latitude1) * DEGRESS_TO_RADIANS;
    
    CGFloat a =  pow(sin(dlat * 0.5), 2)+ cos(_latitude1 * DEGRESS_TO_RADIANS) * cos(_latitude2 * DEGRESS_TO_RADIANS) * pow(sin(dlon * 0.5), 2);
    CGFloat c = 2.0 * atan2(sqrt(a), sqrt(1-a));
    CGFloat d = EARTH_RADIUS_IN_KILOS * c;
    
    return d = EARTH_RADIUS_IN_KILOS * c;
}

- (CGFloat) kilos
{
    return [self haversineDistance];
}

- (CGFloat) meters
{
    return [self haversineDistance] * 1000;
}

- (CGFloat) centimeters
{
    return [self haversineDistance] * 10000;
}

- (CGFloat) millimeters
{
    return [self haversineDistance] * 100000;
}

- (CGFloat) nauticalMiles
{
    return [self haversineDistance] * 0.539957;
}

- (CGFloat) miles
{
    return [self haversineDistance]  * 0.621371;
}

- (CGFloat) feet
{
    return [self haversineDistance] * 3280.84 ;
}

- (CGFloat) inches
{
    return [self haversineDistance] * 39370.1;
}


@end