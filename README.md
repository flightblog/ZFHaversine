## ZFHaversine ##

Objective-C implementation of the Haversine formula.

### From Wikipedia.org ###
The haversine formula is an equation important in navigation, giving great-circle distances between two 
points on a sphere from their longitudes and latitudes. It is a special case of a more general formula 
in spherical trigonometry, the law of haversines, relating the sides and angles of spherical triangles.

http://en.wikipedia.org/wiki/Haversine_formula

### Usage ###

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

### TODO: ###

Add compass heading.

### Contact ###

[@flightblog](http://twitter.com/flightblog)
