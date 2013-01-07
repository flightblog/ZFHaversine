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
static const double RADIANS_TO_DEGRESS = 180.0/M_PI;

@implementation ZFHaversine

- (id) init
{
    return [self initWithLatitude1:0 longitude1:0 latitude2:0 longitude2:0 distanceFormula:nil];
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

- (id) initWithLatitude1:(CGFloat)latitude1
              longitude1:(CGFloat)longitude1
               latitude2:(CGFloat)latitude2
              longitude2:(CGFloat)longitude2
         distanceFormula:(NSString *)distanceFormula
{
    self = [super init];
    if (self) {
        _latitude1 = latitude1;
        _longitude1 = longitude1;
        _latitude2 = latitude2;
        _longitude2 = longitude2;
        _distanceFormula = distanceFormula;
    }
    return self;
}




#pragma mark - Validate Coordinates
// Validates latitude and logitude coordinates. Latittude must be within -90 and 90 degrees. Longitude must be within -180 and 180.
- (BOOL)validateCoordinates 
{
    // Checking validity of latitude
    if ((_latitude1 || _latitude2) > 90 || (_latitude1 || _latitude2) < -90) {
        NSLog(@"Latitude out of range. (A latitude not be greater then +/- 90 degrees");
        return 0;
    }
    
    // Checking validity of longitude
    if ((_longitude1 || _longitude2) > 180 || (_longitude1 || _longitude2) < -180) {
        NSLog(@"Longitude out of range. (A longitude can not be greater then +/- 180");
        return 0;
    }
    
    return 1;
}



#pragma mark - Distance Formulas
- (CGFloat) haversineDistance
{
    CGFloat dlon = (_longitude2 - _longitude1) * DEGRESS_TO_RADIANS;
    CGFloat dlat = (_latitude2 - _latitude1) * DEGRESS_TO_RADIANS;
    
    CGFloat a =  pow(sin(dlat * 0.5), 2)+ cos(_latitude1 * DEGRESS_TO_RADIANS) * cos(_latitude2 * DEGRESS_TO_RADIANS) * pow(sin(dlon * 0.5), 2);
    CGFloat c = 2.0 * atan2(sqrt(a), sqrt(1-a));
//    CGFloat distanceInKilos = EARTH_RADIUS_IN_KILOS * c;    
    return EARTH_RADIUS_IN_KILOS * c;
}

- (CGFloat) sphericalLawOfCosinesDistance
{
    
    CGFloat distance = acoshf(sinf(_latitude1) *sinf(_latitude2) + cosf(_latitude1) * cosf(_latitude2) * cosf(_longitude2 - _longitude2) * EARTH_RADIUS_IN_KILOS);
    
    return distance;
}

#pragma mark - Bearings
- (CGFloat) calculateInitialBearing
{
    CGFloat dlon = (_longitude2 - _longitude1) * DEGRESS_TO_RADIANS;
    
    CGFloat y = sin(dlon) * cosf(_latitude2);
    CGFloat x = cosf(_latitude1 * sinf(_latitude2) - sinf(_latitude1) * cosf(_latitude2) * cosf(dlon));
    
    CGFloat bearing = atan2f(y, x);
    
    return bearing;
}

- (CGFloat) calculateFinalBearing
{
    CGFloat dlon = (_longitude2 - _longitude1) * DEGRESS_TO_RADIANS;
    
    CGFloat y = sin(dlon) * cosf(_latitude2);
    CGFloat x = cosf(_latitude1 * sinf(_latitude2) - sinf(_latitude1) * cosf(_latitude2) * cosf(dlon));
    
    CGFloat bearing = atan2f(y, x);
    
    return bearing;
}


#pragma mark - Distance Methods
- (CGFloat) kilos
{
    if (_distanceFormula == nil) {
        return [self haversineDistance];
    } else {
        return [self sphericalLawOfCosinesDistance];
    }
}

- (CGFloat) meters
{
    if ([self validateCoordinates]) {
        NSLog(@"valid coordinates");
    }

    return [self haversineDistance] * 1000;
}

- (CGFloat) nauticalMiles
{
    return [self haversineDistance] * 0.539957;
}

- (CGFloat) miles
{
    return [self haversineDistance]  * 0.621371;
}

- (CGFloat) yards
{
    return [self haversineDistance] * 1093.61 ;
}

- (CGFloat) feet
{
    return [self haversineDistance] * 3280.84 ;
}


#pragma mark - Bearing Methods
- (CGFloat) initialBearing
{
    if ([self validateCoordinates]) {
        return [self initialBearing];
    }
    return 0;
}

- (CGFloat) finalBearing
{
    if ([self validateCoordinates]){
        return [self finalBearing];
    }
    return 0;
}

@end

















