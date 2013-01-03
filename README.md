# ZFHaversine #

Finds the distance between two GPS coordinates.

## Usage ##

    double latitude1 = 38.898556;
    double longitude1 = -77.037852;
    
    double latitude2 = 38.897147;
    double longitude2 = -77.043934;
    
    ZFHaversine *distance = [[ZFHaversine alloc] initWithLatitude1:latitude1
                                                        longitude1:longitude1
                                                         latitude2:latitude2
                                                        longitude2:longitude2];
    
    NSLog(@"distance (kilos) %f", [distance kilos]);
    NSLog(@"distance (meters) %f", [distance meters]);
    NSLog(@"distance (miles) %f", [distance miles]);
    NSLog(@"distance (feet) %f", [distance feet]);


## Contact ##

[@flightblog](http://twitter.com/flightblog)
