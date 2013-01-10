
# ZFHaversine #

Objective-C implementation of the Haversine formula used to find the distance between two GPS 
coordinates. Also, methods are available to find initial and final bearing from GPS coordinates.


### Haversine ###
The haversine formula is an equation important in navigation, giving great-circle distances between two 
points on a sphere from their longitudes and latitudes. It is a special case of a more general formula 
in spherical trigonometry, the law of haversines, relating the sides and angles of spherical triangles.

http://en.wikipedia.org/wiki/Haversine_formula

### Spherical Law of Cosines ###
In spherical trigonometry, the law of cosines (also called the cosine rule for sides) is a theorem 
relating the sides and angles of spherical triangles, analogous to the ordinary law of cosines from 
plane trigonometry.

http://en.wikipedia.org/wiki/Spherical_law_of_cosines


### Usage ###


    // Test coordinates
    
    // Nantucket Memorial Airport (KACK)
    CGFloat latitude1 = 41.2531111;
    CGFloat longitude1 = -70.0603056;
    
    // Block Island Airport (KBID)
    CGFloat latitude2 = 41.1681111;
    CGFloat longitude2 =  -71.5778333;

    // Logan International Airport (KBOS)
    CGFloat latitude1 = 42.3629722;
    CGFloat longitude1 = -71.0064167;
    
    // San Francisco International (KSFO)
    CGFloat latitude2 = 37.6191050;
    CGFloat longitude2 = -122.3752372;
    
    // Setup
    ZFHaversine *distanceAndBearing = [[ZFHaversine alloc] init];
    [distanceAndBearing setLatitude1:latitude1];
    [distanceAndBearing setLongitude1:longitude1];
    [distanceAndBearing setLatitude2:latitude2];
    [distanceAndBearing setLongitude2:longitude2];
    
    // Setup with coordinates
    ZFHaversine *distanceAndBearing = [[ZFHaversine alloc] initWithLatitude1:latitude1
                                                                  longitude1:longitude1
                                                                   latitude2:latitude2
                                                                  longitude2:longitude2];
    
    // __Optional__: Change the default distance formula from Haversine to the Spherical Law Of Cosines
    [distanceAndBearing setFormulaMode:sphericalFormula];
    
    // Results for Distance    
    NSLog(@"Kilos %f", [distanceAndBearing kilos]);
    NSLog(@"Meters %f", [distanceAndBearing meters]);
    NSLog(@"Nautial Miles %f", [distanceAndBearing nauticalMiles]);
    NSLog(@"Miles %f", [distanceAndBearing miles]);
    NSLog(@"Yards %f", [distanceAndBearing yards]);
    NSLog(@"Feet %f", [distanceAndBearing feet]);
    
    // Results for Initial and Final Bearing
    NSLog(@"Initial Bearing %f", [distanceAndBearing initialBearing]);
    NSLog(@"Initial Bearing %f", [distanceAndBearing finalBearing]);
    
    

### TODO:

* Add option to use Equirectangular approximation distance formula
* Unit test

### Contact

Steve Foster (foster@flightblog.org)
[@flightblog](http://twitter.com/flightblog)

### License

The MIT License (MIT)
Copyright © 2013 Steve Foster <foster@flightblog.org>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



