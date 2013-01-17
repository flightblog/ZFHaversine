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
static const CGFloat EARTH_RADIUS_IN_KILOS = 6372.797560856;
static const CGFloat DEGRESS_TO_RADIANS = M_PI/180.0;
static const CGFloat RADIANS_TO_DEGRESS = 180.0/M_PI;
static const CGFloat KILOS_TO_METERS = 1000;
static const CGFloat KILOS_TO_NAUTICAL_MILES = 0.539957;
static const CGFloat KILOS_TO_MILES = 0.621371;
static const CGFloat KILOS_TO_YARDS = 1093.61;
static const CGFloat KILOS_TO_FEET = 3280.84;

@interface ZFHaversine ()
@property CGFloat longitudeDeltaToRadians;
@property CGFloat longitudeDeltaToRadiansReversed;
@property CGFloat latitudeDeltaToRadians;
@property CGFloat latitude1ToRadians;
@property CGFloat latitude2ToRadians;
@property CGFloat longitude1ToRadians;
@property CGFloat longitude2ToRadians;
@end

@implementation ZFHaversine

- (id) init
{
    return [self initWithLatitude1:0 longitude1:0 latitude2:0 longitude2:0];
}

- (id) initWithLatitude1:(CGFloat) latitude1
              longitude1:(CGFloat) longitude1
               latitude2:(CGFloat) latitude2
              longitude2:(CGFloat) longitude2
{
    self = [super init];
    if (self) {
        _latitude1 = latitude1;
        _longitude1 = longitude1;
        _latitude2 = latitude2;
        _longitude2 = longitude2;
        
        // Converting necessary varibles to radians
        _longitudeDeltaToRadians = (_longitude2 - _longitude1) * DEGRESS_TO_RADIANS;
        _longitudeDeltaToRadiansReversed = (_longitude1 - _longitude2) * DEGRESS_TO_RADIANS;
        _latitudeDeltaToRadians = (_latitude2 - _latitude1) * DEGRESS_TO_RADIANS;
        _latitude1ToRadians = _latitude1 * DEGRESS_TO_RADIANS;
        _latitude2ToRadians = _latitude2 * DEGRESS_TO_RADIANS;
        _longitude1ToRadians = _longitude1 * DEGRESS_TO_RADIANS;
        _longitude2ToRadians = _longitude1 * DEGRESS_TO_RADIANS;
    }
    return self;
}

#pragma mark - Coordinates Validation
- (BOOL) validateCoordinates
{
    // Validates latitude and logitude coordinates. Latittude must be within -90 and 90 degrees. Longitude must be within -180 and 180.

    if (_latitude1 > 90 || _latitude1 < -90 || _latitude2 > 90 || _latitude2 < -90) {
        NSLog(@"Latitude of %f out of range. (A latitude not be greater then +/- 90 degrees", _latitude2);
        return 0;
    }
    
    if (_longitude1 > 180 || _longitude1 < -180 || _longitude2 > 180 || _longitude2 < -180) {
        NSLog(@"Longitude out of range. (A longitude can not be greater then +/- 180");
        return 0;
    }
    
    return 1;
}


#pragma mark - Distance & Bearing Formulas
- (CGFloat) haversineDistance
{
    // Implementaion of the haversine formula returning distance in kilos.
    
    CGFloat a = sinf(_longitudeDeltaToRadians/2) * sinf(_latitudeDeltaToRadians/2) + sinf(_longitudeDeltaToRadians/2) * sinf(_longitudeDeltaToRadians/2) * cosf(_latitude1ToRadians) * cos (_latitude2ToRadians);
    
    CGFloat c = 2.0 * atan2(sqrt(a), sqrt(1-a));
  
    return EARTH_RADIUS_IN_KILOS * c;
}

- (CGFloat) sphericalLawOfCosinesDistance
{
    // Alternative formula for finding distance (returned in kilos) using the Sperical Law of Cosines
    
    CGFloat distanceInKilos = acosf(sinf(_latitude1ToRadians) * sinf(_latitude2ToRadians) + cosf(_latitude1ToRadians) * cosf(_latitude2ToRadians) * cosf(_longitudeDeltaToRadians)) * EARTH_RADIUS_IN_KILOS;

    return distanceInKilos;
}


- (CGFloat) calculateInitialBearing
{
    // Calculating initial bearing
    
    CGFloat x = sinf(_longitudeDeltaToRadians) * cosf(_latitude2ToRadians);
    CGFloat y = cosf(_latitude1ToRadians) * sinf(_latitude2ToRadians) - sinf(_latitude1ToRadians) * cosf(_latitude2ToRadians) * cosf(_longitudeDeltaToRadians);
    
    CGFloat results = atan2(-x,-y)/M_PI * 180 + 180;
    
    return results;
}

- (CGFloat) calculateFinalBearing
{
    // Calculating final bearing - To find the final bearing an initial bearing is taken from the second set of GPS coordinates and the heading is reversed.
    
    CGFloat x = sinf(_longitudeDeltaToRadiansReversed) * cosf(_latitude2ToRadians);
    CGFloat y = cosf(_latitude2ToRadians) * sinf(_latitude1ToRadians) - sinf(_latitude2ToRadians) * cosf(_latitude1ToRadians) * cosf(_longitudeDeltaToRadiansReversed);
    
    CGFloat results = atan2(-x,-y)/M_PI * 180 + 360;
    
    return results;
}


#pragma mark - Distance Return Methods

/** Each return method validates coordinates and checks if the default Haversine formula have been changed to Spherical Law Of Cosines.
 Distance is then converted from base kilos to the unit of measure defined by each method. */

- (CGFloat) kilos
{
    if ([self validateCoordinates])
        return _formulaMode == sphericalFormula ? [self sphericalLawOfCosinesDistance] : [self haversineDistance];
    return 0;
}

- (CGFloat) meters
{
    if ([self validateCoordinates])
        return (_formulaMode == sphericalFormula ? [self sphericalLawOfCosinesDistance] : [self haversineDistance]) * KILOS_TO_METERS;
    return 0;
}

- (CGFloat) nauticalMiles
{
    if ([self validateCoordinates])
        return (_formulaMode == sphericalFormula ? [self sphericalLawOfCosinesDistance] : [self haversineDistance]) * KILOS_TO_NAUTICAL_MILES;
    return 0;
}

- (CGFloat) miles
{
    if ([self validateCoordinates])
        return (_formulaMode == sphericalFormula ? [self sphericalLawOfCosinesDistance] : [self haversineDistance]) * KILOS_TO_MILES;
    return 0;
}

- (CGFloat) yards
{
    if ([self validateCoordinates])
        return (_formulaMode == sphericalFormula ? [self sphericalLawOfCosinesDistance] : [self haversineDistance]) * KILOS_TO_YARDS;
    return 0;
}

- (CGFloat) feet
{
    if ([self validateCoordinates])
        return (_formulaMode == sphericalFormula ? [self sphericalLawOfCosinesDistance] : [self haversineDistance]) * KILOS_TO_FEET;
    return 0;
}


#pragma mark - Bearing Return Methods

/** Each return method validates coordinates before calculating bearing. */

- (CGFloat) initialBearing
{
    if ([self validateCoordinates])
        return [self calculateInitialBearing];
    return 0;
}

- (CGFloat) finalBearing
{
    if ([self validateCoordinates])
        return [self calculateFinalBearing];
    return 0;
}

@end

