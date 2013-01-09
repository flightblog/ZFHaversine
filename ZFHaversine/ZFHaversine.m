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
    return [self initWithLatitude1:0 longitude1:0 latitude2:0 longitude2:0];
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

/* 
  
 2. set default mode -
 3. unit testing - specta (built on OCunit)
 4. look at cocoa controls
 5. White Street Brewery
 
 */

# pragma mark - Change Default Distance Formula 
// ?????
- (BOOL)changeDistanceFormula:(NSString *)mode
{
	return 1;
}


#pragma mark - Validate Coordinates
- (BOOL) validateCoordinates
{
    // Validates latitude and logitude coordinates. Latittude must be within -90 and 90 degrees. Longitude must be within -180 and 180.
    
    if (_latitude1 > 90 || _latitude2 > 90 || _latitude1 < -90 || _latitude2 < -90) {
    
        NSLog(@"Latitude out of range. (A latitude not be greater then +/- 90 degrees");
        //NSError *error = nil;
        
        return 0;
    }
    
    if (_longitude1 > 180 || _longitude2 > 180 || _longitude1 < -180 || _longitude2 < -180) {
        
        NSLog(@"Longitude out of range. (A longitude can not be greater then +/- 180");
        return 0;
    }
    
    return 1;
}


#pragma mark - Distance Formulas
- (CGFloat) haversineDistance
{
    
    // Implementaion of the haversine formula returning distance in kilos.

    CGFloat longitudeDelta = (_longitude2 - _longitude1) * DEGRESS_TO_RADIANS;
    CGFloat latitudeDelta = (_latitude2 - _latitude1) * DEGRESS_TO_RADIANS;
    
    CGFloat _latitude1_ToRadians = _latitude1 * DEGRESS_TO_RADIANS;
    CGFloat _latitude2_ToRadians = _latitude2 * DEGRESS_TO_RADIANS;
    
    CGFloat a = sinf(latitudeDelta/2)
                * sinf(latitudeDelta/2)
                + sinf(longitudeDelta/2)
                * sinf(longitudeDelta/2)
                * cosf(_latitude1_ToRadians)
                * cosf(_latitude2_ToRadians);
    
    CGFloat c = 2.0 * atan2(sqrt(a), sqrt(1-a));
  
    return EARTH_RADIUS_IN_KILOS * c;
}

- (CGFloat) sphericalLawOfCosinesDistance
{
    
    // Alternative formula for finding distance (returned in kilos) using the Sperical Law of Cosines
    
    /*
     var R = 6371; // km
     var d = Math.acos(Math.sin(lat1)*Math.sin(lat2) + Math.cos(lat1)*Math.cos(lat2) * Math.cos(lon2-lon1)) * R;
    */
    
    //CGFloat distanceInKilos = acosf(sinf(_latitude1_ToRadians) * sinf(_latitude2_ToRadians) + cosf(_latitude1_ToRadians) * cosf(_latitude2_ToRadians) * cosf(_latitude2_ToRadians - _latitude2_ToRadians)) * EARTH_RADIUS_IN_KILOS;

    CGFloat distanceInKilos = acosf(sinf(_latitude1) * sinf(_latitude2) + cosf(_latitude1) * cosf(_latitude2) * cosf(_longitude2 - _longitude1) * EARTH_RADIUS_IN_KILOS);

    return distanceInKilos;
}
 

#pragma mark - Distance Return Methods
- (CGFloat) kilosSphericalLawOfCosinesDistance
{
    return [self sphericalLawOfCosinesDistance];
}

- (CGFloat) kilos
{
    if ([self validateCoordinates])
        return _formulaMode == sphericalFormula ? [self sphericalLawOfCosinesDistance] : [self haversineDistance];
    return 0;
}

- (CGFloat) meters
{
    if ([self validateCoordinates])
        return _formulaMode == sphericalFormula ? [self sphericalLawOfCosinesDistance] * 1000 : [self haversineDistance] * 1000;
    return 0;
    
//    if ([self validateCoordinates]) {
//        return [self haversineDistance] * 1000;
//    }
//    return 0;
}

- (CGFloat) nauticalMiles
{
    if ([self validateCoordinates]) {
        return [self haversineDistance] * 0.539957;
    }
    return 0;
}

- (CGFloat) miles
{
    if ([self validateCoordinates]) {
        return [self haversineDistance]  * 0.621371;
    }
    return 0;
}

- (CGFloat) yards
{
    if ([self validateCoordinates]) {
        return [self haversineDistance] * 1093.61;
    }
    return 0;
}

- (CGFloat) feet
{
    if ([self validateCoordinates]) {
        return [self haversineDistance] * 3280.84;
    }
    return 0;
}


#pragma mark - Bearing Formulas
- (CGFloat) calculateInitialBearing
{
    
    // Calculating initial bearing
    
    float _latitude1_ToRadians = (_latitude1 / 180) * M_PI;
    float _longitude1_ToRadians = (_longitude1 / 180) * M_PI; 
    float _latitude2_ToRadians = (_latitude2 / 180) * M_PI;
    float _longitude2_ToRadians = (_longitude2 / 180) * M_PI;
    
    CGFloat x = sinf(_longitude2_ToRadians - _longitude1_ToRadians) * cosf(_latitude2_ToRadians);
    CGFloat y = cosf(_latitude1_ToRadians) * sinf(_latitude2_ToRadians) - sinf(_latitude1_ToRadians) * cosf(_latitude2_ToRadians) * cosf(_longitude2_ToRadians - _longitude1_ToRadians);
    
    CGFloat radians = atan2f(x, y);
        
    return (radians * RADIANS_TO_DEGRESS) + 360;
}
 
- (CGFloat) calculateFinalBearing
{
    
    // Calculating final bearing
    
    float _latitude2_ToRadians = (_latitude1 / 180) * M_PI;
    float _longitude2_ToRadians = (_longitude1 / 180) * M_PI;
    float _latitude1_ToRadians = (_latitude2 / 180) * M_PI;
    float _longitude1_ToRadians = (_longitude2 / 180) * M_PI;
    
    CGFloat x = sinf(_longitude2_ToRadians - _longitude1_ToRadians) * cosf(_latitude2_ToRadians);
    CGFloat y = cosf(_latitude1_ToRadians) * sinf(_latitude2_ToRadians) - sinf(_latitude1_ToRadians) * cosf(_latitude2_ToRadians) * cosf(_longitude2_ToRadians - _longitude1_ToRadians);
    
    CGFloat radians = atan2f(x, y);
    
    return (radians * RADIANS_TO_DEGRESS) + 180;
}


#pragma mark - Bearing Return Methods
- (CGFloat) initialBearing
{
    return [self calculateInitialBearing];
}

- (CGFloat) finalBearing
{
    return [self calculateFinalBearing];
}

@end

