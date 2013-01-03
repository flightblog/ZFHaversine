
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
    return haversineDistance(_latitude1, _longitude1, _latitude2, _longitude2)*1000;
}

- (double) miles
{
    return haversineDistance(_latitude1, _longitude1, _latitude2, _longitude2)*0.621371;
}

- (double) feet
{
    return (haversineDistance(_latitude1, _longitude1, _latitude2, _longitude2)*0.621371)*5282;
}

@end