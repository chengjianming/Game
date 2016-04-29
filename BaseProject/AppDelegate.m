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
#import "LoginNetManager.h"
#import "LoginModel.h"
#import "LoginViewModel.h"
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
    
    
    
//    NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:@"[a-zA-Z.-]" options:0 error:NULL];
//    NSString *string = @"780元";
//    NSString *result = [regular stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, [string length]) withTemplate:@""];
//    NSLog(@"%@", result);
//    
    

    return YES;
}

@end
