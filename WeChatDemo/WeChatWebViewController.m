//
//  WeChatWebViewController.m
//  WeChatDemo
//
//  Created by wei zhao on 2016/12/1.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import "WeChatWebViewController.h"
#import "MBProgressHUD.h"

@interface WeChatWebViewController ()

@end

@implementation WeChatWebViewController{
    UIWebView *_webView;
    MBProgressHUD *_hud;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *bton = [UIButton buttonWithType:UIButtonTypeCustom];
    bton.backgroundColor = [UIColor redColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:bton];
    item.style = UIBarButtonItemStyleDone;
    [bton addTarget:self action:@selector(backToRootViewController) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.leftBarButtonItem = item;
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    NSURL *url = [NSURL URLWithString:@"https://m.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    _hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//    _hud.mode = MBProgressHUDModeAnnularDeterminate;
    _hud.label.text = @"加载中...";
    [_hud showAnimated:YES];
    //[_hud hideAnimated:YES afterDelay:4];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.tabBarController.tabBar.hidden = YES;
    [_hud hideAnimated:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)backToRootViewController {
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
