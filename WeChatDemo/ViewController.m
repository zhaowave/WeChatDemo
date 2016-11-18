//
//  ViewController.m
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/14.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *name = [[UIDevice currentDevice] systemName];
    NSLog(@"%@",name);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
