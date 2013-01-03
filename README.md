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

### License ###

The MIT License (MIT)
Copyright © 2013 Steve Foster <foster@flightblog.org>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

