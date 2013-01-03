
#import <Foundation/Foundation.h>

@interface ZFHaversine : NSObject

@property double latitude1;
@property double longitude1;
@property double latitude2;
@property double longitude2;

- (id)initWithLatitude1:(double)latitude1
             longitude1:(double)longitude1
              latitude2:(double)latitude2
             longitude2:(double)longitude2;

- (double) kilos;
- (double) meters;
- (double) miles;
- (double) nauticalMiles;
- (double) feet;

@end
