//
//  AppDelegate.m
//  UI16_UITabBarController
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "VCForItem2ViewController.h"
#import "VCforItem3.h"
#import "VCForItem4.h"
#import "VCForitem5.h"
#import "VCForItem6.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@property (nonatomic, retain)UITabBarController *tb;

@end

@implementation AppDelegate

- (void)dealloc{
    
    [_window release];
    [_tb release];
    [super dealloc];
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
     self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
     self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    

    [self createTabBarController];
    
    
    
    [_window release];
    return YES;
}





#pragma mark --- 知识点 1 uitab

- (void)createTabBarController{

    /** 创建对象*/
    
    self.tb = [[UITabBarController alloc] init];
    
    
    // 设置 viewController 属性
    
    [self createViewControllers];
    
    // 设置 tabBar
    
    self.tb.tabBar.tintColor = [UIColor redColor];
    self.tb.tabBar.barTintColor = [UIColor cyanColor];
    
    // 设置 tabBar 的全局风格
    // 设置全局外观
    // 通过[UITabBar appearance]得到当前应 的UITabBar对象来设置tabBar的外观
    // 注意:设置全局外观最好在appDelegate ,否则会无效
    
    [[UITabBar appearance] setBarTintColor:[UIColor darkGrayColor]];
    [[UITabBar appearance] setTintColor:[UIColor yellowColor]];
    
    
    // 改变导航栏外观颜色
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor cyanColor]];
    
    // 改变导航栏字体颜色
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:25],NSFontAttributeName, nil]];
    
    // 设置代理 delega
    
    self.tb.delegate = self;

    /** 指定跟视图控制器 */
    
    self.window.rootViewController =_tb;
    
    [_tb release];

}


#pragma mark === tabBarontroller Delegate 协议方法


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    // 选中的 vc 在数组中的下标
    NSLog(@"%ld", tabBarController.selectedIndex);
    
    //徽章 清零
    
    if (tabBarController.selectedIndex == 1) {
        
        viewController.tabBarItem.badgeValue = nil;
    }
}


- (void)createViewControllers{

    //item1
    
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    [vc release];
    
 
    // 设置 tabBarItem
    
    navi.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:100];
    
    
    //item2
    
    VCForItem2ViewController *item2 = [[VCForItem2ViewController alloc]init];
    
    item2.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:200];
    
    
    /** 设置徽章 badgeValue */
    
    item2.tabBarItem.badgeValue = @"99+";
    
    
    
    // item3 自定义图片和标题
    
    VCforItem3 *item3 = [[VCforItem3 alloc]init];
    item3.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"亮度调节" image:[[UIImage imageNamed:@"liang1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:300];
    
    
    
    
    // item4 自定义图片 + 选中之后的图片
    
    VCForItem4 *item4 = [[VCForItem4 alloc]init];
    item4.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"image" image:[UIImage imageNamed:@"tuzi"] selectedImage:[UIImage imageNamed:@"woniu"]];
    
    
    
    // item5
    
    VCForitem5 *item5 = [[VCForitem5 alloc]init];
    item5.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:500];
    
    
    // item6
    
    VCForItem6 *item6 = [[VCForItem6 alloc] init];
    
    item6.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:600];
    
    
    
    // 加入 viewcontroller 数组中
    
    self.tb.viewControllers = @[navi, item2, item3, item4, item5, item6];
    
    [navi release];
    [item2 release];
    [item3 release];
    [item4 release];
    [item5 release];
    [item6 release];

}









- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
