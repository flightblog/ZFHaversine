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

#import <Foundation/Foundation.h>

@interface ZFHaversine : NSObject

typedef NS_ENUM (NSInteger, DistanceFormula) {
	haversineFormula,
	sphericalFormula,
	equirectangularFormula
};

/** GPS Coordinates for location 1 & location 2 */
@property (readwrite) CGFloat latitude1;
@property (readwrite) CGFloat longitude1;
@property (readwrite) CGFloat latitude2;
@property (readwrite) CGFloat longitude2;

/** Distance formula can be set to Haversine or Spherical Law Of Cosines. Haversine is the default */
@property (nonatomic) DistanceFormula formulaMode;

/** Initializer for setting coordinates
 * @param latitude/longitde coordinates for location 1 and location 2
 */
- (id) initWithLatitude1:(CGFloat) latitude1
              longitude1:(CGFloat) longitude1
               latitude2:(CGFloat) latitude2
              longitude2:(CGFloat) longitude2;

/** Return methods for distance 
 * @return distance for each unit of measure
 */
- (CGFloat) kilos;
- (CGFloat) meters;
- (CGFloat) nauticalMiles;
- (CGFloat) miles;
- (CGFloat) yards;
- (CGFloat) feet;

/** Initial heading giving set GPS coordinates
 * @return initial bearing in degrees
 */
- (CGFloat) initialBearing;

/** Final heading giving set GPS coordinates
 * @return final bearing in degrees
 */
- (CGFloat) finalBearing;

@end
