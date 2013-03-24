//
//  AppDelegate.h
//  stockdoctor
//
//  Created by zhang kai on 3/5/13.
//  Copyright (c) 2013 zhang kai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeveyTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    LeveyTabBarController *leveyTabBarController;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) LeveyTabBarController *leveyTabBarController;
@end
