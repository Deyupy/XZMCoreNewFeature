//
//  AppDelegate.m
//  XZMCoreNewFeaturePlayerDemo
//
//  Created by Mac_Nelson on 15/11/26.
//  Copyright © 2015年 com.xiaomage.new. All rights reserved.
//

#import "AppDelegate.h"
#import "XZMCoreNewFeatureVC.h"
#import "CALayer+Transition.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window = window;
    
    //判断是否需要显示：（内部已经考虑版本及本地版本缓存）
    BOOL canShow = [XZMCoreNewFeatureVC canShowNewFeature];
    
    //测试代码，正式版本应该删除
    canShow = YES;
    
    if(canShow){ // 初始化新特性界面
        window.rootViewController = [XZMCoreNewFeatureVC newFeatureVCWithPlayerURL:[[NSBundle mainBundle] URLForResource:@"美团启动视频.m4v" withExtension:nil] enterBlock:^{
            
            NSLog(@"进入主页面");
            [self enter];
        } configuration:^(AVPlayerLayer *playerLayer) {
            
        }];
        
    }else{
        
        [self enter];
    }
    
    [window makeKeyAndVisible];
    
    return YES;
}


// 进入主页面
-(void)enter{
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor brownColor];
    self.window.rootViewController = vc;
    [self.window.layer transitionWithAnimType:TransitionAnimTypeRamdom subType:TransitionSubtypesFromRamdom curve:TransitionCurveRamdom duration:2.0f];
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
