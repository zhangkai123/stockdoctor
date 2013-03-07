//
//  AppDelegate.m
//  stockdoctor
//
//  Created by zhang kai on 3/5/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import "AppDelegate.h"
#import "LeveyTabBarController.h"
#import "SDSelfChooseViewController.h"
#import "SDSmartChooseViewController.h"
#import "SDSetupViewController.h"


@implementation AppDelegate
@synthesize leveyTabBarController;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    SDSelfChooseViewController *firstVC = [[SDSelfChooseViewController alloc] initWithTabBar];
	SDSmartChooseViewController *secondVC = [[SDSmartChooseViewController alloc] initWithTabBar];
	SDSetupViewController *thirdVC = [[SDSetupViewController alloc] initWithTabBar];
    
    UINavigationController *nc1 = [[UINavigationController alloc] initWithRootViewController:firstVC];
	[firstVC release];
    UINavigationController *nc2 = [[UINavigationController alloc] initWithRootViewController:secondVC];
    nc2.delegate = (id)self;
	[secondVC release];
    UINavigationController *nc3 = [[UINavigationController alloc] initWithRootViewController:thirdVC];
	[thirdVC release];
    
	NSArray *ctrlArr = [NSArray arrayWithObjects:nc1,nc2,nc3,nil];
	[nc1 release];
	[nc2 release];
	[nc3 release];
    
	NSMutableDictionary *imgDic = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic setObject:[UIImage imageNamed:@"zixuangu01.png"] forKey:@"Default"];
	[imgDic setObject:[UIImage imageNamed:@"zixuangu02.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic2 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic2 setObject:[UIImage imageNamed:@"xuangu01.png"] forKey:@"Default"];
	[imgDic2 setObject:[UIImage imageNamed:@"xuangu02.png"] forKey:@"Seleted"];
	NSMutableDictionary *imgDic3 = [NSMutableDictionary dictionaryWithCapacity:3];
	[imgDic3 setObject:[UIImage imageNamed:@"shezhi01.png"] forKey:@"Default"];
	[imgDic3 setObject:[UIImage imageNamed:@"shezhi02.png"] forKey:@"Seleted"];
	
	NSArray *imgArr = [NSArray arrayWithObjects:imgDic,imgDic2,imgDic3,nil];
        
	self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	leveyTabBarController = [[LeveyTabBarController alloc] initWithViewControllers:ctrlArr imageArray:imgArr];
	[leveyTabBarController setTabBarTransparent:YES];
	[self.window addSubview:leveyTabBarController.view];
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
