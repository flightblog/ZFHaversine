# ZFHaversine #

Objective-C implementation of the Haversine formula.

### From Wikipedia.org ###
The haversine formula is an equation important in navigation, giving great-circle distances between two 
points on a sphere from their longitudes and latitudes. It is a special case of a more general formula 
in spherical trigonometry, the law of haversines, relating the sides and angles of spherical triangles.

http://en.wikipedia.org/wiki/Haversine_formula

### Usage ###

    // Nantucket Memorial Airport (KACK)
    double latitude1 = 41.253;
    double longitude1 = -70.060;
    
    // Block Island Airport (KBID)
    double latitude2 = 41.168;
    double longitude2 = -71.578;
    
    ZFHaversine *distance = [[ZFHaversine alloc] initWithLatitude1:latitude1
                                                        longitude1:longitude1
                                                         latitude2:latitude2
                                                        longitude2:longitude2];
    
    NSLog(@"Kilos %f", [distance kilos]);
    NSLog(@"Miles %f", [distance miles]);
    NSLog(@"Nautial Miles %f", [distance nauticalMiles]);
    NSLog(@"Meters %f", [distance meters]);
    NSLog(@"Feet %f", [distance feet]);
    NSLog(@"Inches %f", [distance inches]);

### TODO:

* Add compass heading.
* Create a cocoapod.

## Contact

Steve Foster (foster@flightblog.org)
[@flightblog](http://twitter.com/flightblog)

## License

The MIT License (MIT)
Copyright © 2013 Steve Foster <foster@flightblog.org>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

