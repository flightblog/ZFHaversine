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

#import "ZFAppDelegate.h"
#import "ZFHaversine.h"

@implementation ZFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
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
    
    // Setup with
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
    
    
    // Optional: Change the default distance formula from Haversine to the Spherical Law Of Cosines
    [distanceAndBearing setFormulaMode:sphericalFormula];
    
    // Results for Distance    
    NSLog(@"Kilos %f", [distanceAndBearing kilos]);
    NSLog(@"Meters %f", [distanceAndBearing meters]);
    NSLog(@"Nautial Miles %f", [distanceAndBearing nauticalMiles]);
    NSLog(@"Miles %f", [distanceAndBearing miles]);
    NSLog(@"Yards %f", [distanceAndBearing yards]);
    NSLog(@"Feet %f", [distanceAndBearing feet]);
    
    // Results for Bearing
    NSLog(@"Initial Bearing %f", [distanceAndBearing initialBearing]);
    NSLog(@"Initial Bearing %f", [distanceAndBearing finalBearing]);
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
