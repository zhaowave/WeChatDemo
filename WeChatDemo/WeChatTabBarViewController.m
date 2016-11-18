//
//  WeChatTabBarViewController.m
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/15.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import "WeChatTabBarViewController.h"
#import "MessageViewController.h"
#import "ContactViewController.h"
#import "DiscoveryViewController.h"
#import "MeViewController.h"

@interface WeChatTabBarViewController ()

@end

@implementation WeChatTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *messageViewController = [[MessageViewController alloc] init];
    UIViewController *contactViewController = [[ContactViewController alloc] init];
    UIViewController *discoverrViewController = [[DiscoveryViewController alloc] init];
    UIViewController *meViewController = [[MeViewController alloc] init];
    
    self.viewControllers = @[[self initialNaviControllerWithViewController:messageViewController andImage:@"tabbar_mainframe" andSelectImage:@"tabbar_mainframeHL"],[self initialNaviControllerWithViewController:contactViewController andImage:@"tabbar_contacts" andSelectImage:@"tabbar_contactsHL"],[self initialNaviControllerWithViewController:discoverrViewController andImage:@"tabbar_discover" andSelectImage:@"tabbar_discoverHL"],[self initialNaviControllerWithViewController:meViewController andImage:@"tabbar_me" andSelectImage:@"tabbar_meHL"]];
    self.tabBar.tintColor =
    [UIColor colorWithRed:9 / 255.0 green:187 / 255.0 blue:7 / 255.0 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/**
 *  返回取消渲染的image
 */
- (UIImage*)removeRendering:(NSString*)imageName
{
    UIImage* image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
- (UINavigationController *) initialNaviControllerWithViewController:(UIViewController *)viewController andImage:(NSString *)image andSelectImage:(NSString*)selectImgName{
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
    naviController.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:viewController.title
                                  image:[self removeRendering:image]
                          selectedImage:[self removeRendering:selectImgName]];
    return naviController;
}

@end
