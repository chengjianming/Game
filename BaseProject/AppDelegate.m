//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initializeWithApplication:application];
//     HomeViewController *vc = [[HomeViewController alloc]init];
//    UINavigationController *nvc = [[UINavigationController alloc]initWithRootViewController:vc];
//    nvc.navigationBar.backgroundColor = kRGBColor(31, 109, 187);
//    UIImage *barImg = [[UIImage alloc]init];
//    [nvc.navigationBar setBackgroundImage:barImg forBarMetrics:UIBarMetricsDefaultPrompt];
//    nvc.navigationBar.barStyle = UIBarStyleBlackOpaque;
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
//
//    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
//    self.window.rootViewController = nvc;
    
    return YES;
}

@end
