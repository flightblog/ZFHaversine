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

-(id) initWithLatitude1:(double)latitude1
             longitude1:(double)longitude1
              latitude2:(double)latitude2
             longitude2:(double)longitude2
{
    self = [super init];
    if (self) {
        self.latitude1 = latitude1;
        self.longitude1 = longitude1;
        self.latitude2 = latitude2;
        self.longitude2 = longitude2;
    }
    return self;
}

double haversineDistance(double lat1, double lon1, double lat2, double lon2){
    double dlon = (lon2 - lon1) * DEGRESS_TO_RADIANS;
    double dlat = (lat2 - lat1) * DEGRESS_TO_RADIANS;
    
    double a =  pow(sin(dlat * 0.5), 2)+ cos(lat1 * DEGRESS_TO_RADIANS) * cos(lat2 * DEGRESS_TO_RADIANS) * pow(sin(dlon * 0.5),2);
    double c = 2.0 * atan2(sqrt(a), sqrt(1-a));
    
    return EARTH_RADIUS_IN_KILOS * c;
}

- (double) kilos
{
    return haversineDistance(_latitude1, _longitude1, _latitude2, _longitude2);
}

- (double) meters
{
    return haversineDistance(_latitude1, _longitude1, _latitude2, _longitude2) * 1000;
}

- (double) miles
{
    return haversineDistance(_latitude1, _longitude1, _latitude2, _longitude2) * 0.621371;
}


- (double) nauticalMiles
{
    return haversineDistance(_latitude1, _longitude1, _latitude2, _longitude2) * 0.539957;
}

- (double) feet
{
    return (haversineDistance(_latitude1, _longitude1, _latitude2, _longitude2) * 0.621371) * 5282;
}

@end